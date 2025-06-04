
# CI/CD 파이프라인 구현 요청서

## 프로젝트 개요

마이크로서비스 아키텍처 기반의 멀티 레포지토리 프로젝트에 대한 CI/CD 파이프라인을 구현해주세요.

### 저장소 구조
```
├── common-core/           # 공통 라이브러리 (auth, logging, payment, security, utils)
├── ai-services/          # AI 도메인 서비스  
├── rpa-services/         # RPA 도메인 서비스
├── o4o-platform/         # 메인 플랫폼
└── docs-hub/             # 통합 문서 (현재 폴더)
```

### 아키텍처 특징
- **통합 인증**: common-core 기반 SSO, 도메인별 분리 (ai-services, rpa-services)
- **의존성 관리**: common-core 변경 시 다른 서비스 자동 업데이트 필요
- **독립 배포**: 각 서비스는 독립적으로 개발/배포 가능해야 함

## 구현 요구사항

### 1. common-core CI/CD
**목표**: NPM 패키지로 배포하여 다른 서비스에서 사용

**필요한 파일들**:
- `.github/workflows/ci.yml` - 기본 CI (테스트, 빌드, 린팅)
- `.github/workflows/publish.yml` - NPM 배포 + 의존 서비스 알림
- `package.json` 업데이트 - 빌드/배포 스크립트 추가
- `.npmignore` - 배포 제외 파일 설정

**기능**:
- 코드 푸시 시 자동 테스트
- 태그 생성 시 NPM 배포
- 배포 완료 시 다른 저장소에 repository_dispatch 이벤트 발송

### 2. 각 서비스 CI/CD (ai-services, rpa-services, o4o-platform)
**목표**: Docker 이미지 빌드/배포, common-core 업데이트 자동화

**필요한 파일들**:
- `.github/workflows/deploy.yml` - CI/CD 파이프라인
- `Dockerfile` - 컨테이너 이미지 정의
- `.dockerignore` - 도커 빌드 제외 파일
- `.env.example` - 환경 변수 템플릿

**기능**:
- common-core 업데이트 시 자동 의존성 업데이트
- 자동 테스트 (unit, integration)
- Docker 이미지 빌드 및 푸시 (GHCR 사용)
- 환경별 배포 (develop → staging, main → production)

### 3. 개발 환경 설정
**필요한 파일들**:
- `docker-compose.yml` - 로컬 개발 환경 (프로젝트 루트)
- `scripts/setup.sh` - 개발 환경 초기 설정
- `scripts/deploy.sh` - 수동 배포 스크립트

### 4. 환경 설정
각 서비스별 환경 변수 템플릿 및 설정 파일

## 기술 스택 및 제약사항

### 기술 스택
- **언어**: Node.js (TypeScript 사용 예정)
- **컨테이너**: Docker
- **CI/CD**: GitHub Actions
- **패키지 레지스트리**: NPM (common-core)
- **이미지 레지스트리**: GitHub Container Registry (GHCR)
- **데이터베이스**: PostgreSQL
- **캐시**: Redis

### 제약사항
- GitHub Free/Pro 계정 사용
- 비용 최소화 (무료 티어 최대 활용)
- 보안: 민감한 정보는 GitHub Secrets 사용

## 구현 가이드라인

### 1. 워크플로우 트리거
```yaml
# common-core
on:
  push: [main, develop]
  pull_request: [main]
  
# 서비스들  
on:
  push: [main, develop]
  pull_request: [main]
  repository_dispatch:
    types: [common-core-updated]
```

### 2. 의존성 업데이트 플로우
```
common-core 배포 → repository_dispatch → 서비스 CI 트리거 → 의존성 업데이트 → 테스트 → 배포
```

### 3. 환경별 배포 전략
- **develop 브랜치** → staging 환경
- **main 브랜치** → production 환경
- **Pull Request** → 테스트만 실행

### 4. 보안 고려사항
- NPM_TOKEN: NPM 패키지 배포용
- REPO_ACCESS_TOKEN: repository_dispatch 용 (repo 권한)
- 각 서비스별 환경변수는 GitHub Secrets 활용

### 5. 모니터링 및 알림
- 빌드 실패 시 Slack 알림 (선택사항)
- 배포 상태 GitHub Status 업데이트

## 예상 폴더 구조 (생성 후)

### common-core
```
common-core/
├── .github/workflows/
│   ├── ci.yml
│   └── publish.yml
├── src/
├── dist/
├── package.json
├── .npmignore
└── README.md
```

### 각 서비스 (ai-services 예시)
```
ai-services/
├── .github/workflows/
│   └── deploy.yml
├── src/
├── Dockerfile
├── .dockerignore
├── .env.example
├── package.json
└── README.md
```

### 프로젝트 루트 (상위 폴더)
```
프로젝트명/
├── common-core/
├── ai-services/
├── rpa-services/
├── o4o-platform/
├── docs-hub/
├── docker-compose.yml
└── scripts/
    ├── setup.sh
    └── deploy.sh
```

## 구현 순서

1. **common-core CI/CD 설정** (가장 중요, 다른 서비스의 기반)
2. **ai-services CI/CD 설정** (템플릿 역할)
3. **rpa-services, o4o-platform에 동일 패턴 적용**
4. **로컬 개발 환경 구성** (docker-compose)
5. **배포 스크립트 및 문서화**

## 추가 요청사항

- 각 파일에 상세한 주석 포함
- 환경변수 및 시크릿 설정 가이드
- 문제 해결을 위한 디버깅 가이드
- 향후 확장을 위한 구조적 고려사항

---

**참고**: 이 문서는 마이크로서비스 아키텍처의 CI/CD 파이프라인 구현을 위한 포괄적인 요구사항입니다. 실제 구현 시 프로젝트 특성에 맞게 조정해주세요.