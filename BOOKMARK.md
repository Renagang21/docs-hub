# 🔖 북마크 - 빠른 접근 링크

## 📋 오늘 작업한 문서들 (2025-06-07)

### 🆕 새로 생성된 문서들
- 📊 **[작업 요약](./daily-logs/2025-06-07-work-summary.md)** - 오늘 작업 전체 요약
- 🤖 **[AI 협업 패턴](./analysis/ai-collaboration-patterns-for-rpa.md)** - RPA 자동화 설계 자료
- 🎯 **[기술 의사결정](./decisions/technical-decisions-record.md)** - ADR 기록

### 🔧 기존 템플릿들
- 💾 **[Memory 저장 템플릿](./templates/memory-daily-save-template.md)** - 매일 사용
- 🚀 **[Memory 빠른 시작](./guides/memory-quick-start-guide.md)** - 사용법 가이드
- 🤝 **[협업 워크플로우](./guides/claude-chatgpt-collaboration-workflow.md)** - AI 협업 가이드

## 🎯 현재 프로젝트 상태

### ✅ 완료된 작업
- TypeScript 백엔드 기반 구축
- PostgreSQL 마이그레이션 완료
- docs-hub 독립 위치로 이동
- 메인 사이트 React 컴포넌트 구성

### 🔄 다음 작업 (우선순위)
1. **PostgreSQL DB 설정** - 데이터베이스 생성 및 연결
2. **시스템 테스트** - API 서버 + 메인 사이트 통합 테스트
3. **관리자 계정 생성** - 초기 관리자 설정

### 📊 Git 정보
- **최신 커밋**: `82769c5` (2025-06-07)
- **변경사항**: PostgreSQL 마이그레이션 완료
- **브랜치**: main
- **서버**: ubuntu@13.124.146.254

## 🚀 즐겨찾기 링크

### 📂 프로젝트 저장소
- 🏠 **[o4o-platform 메인](https://github.com/Renagang21/o4o-platform)**
- 📚 **[docs-hub 문서](https://github.com/Renagang21/docs-hub)**
- 📖 **[프로젝트 문서](https://github.com/Renagang21/o4o-platform/tree/main/docs)**

### 🔧 개발 환경
- 💻 **로컬 경로**: `C:\Users\sohae\OneDrive\Coding\o4o-platform\`
- 📁 **독립 문서**: `C:\Users\sohae\OneDrive\Coding\docs-hub\`
- 🐳 **Docker**: `docker-compose up -d`
- 🖥️ **서버**: `ssh ubuntu@13.124.146.254`

### 📋 일일 루틴
- 🌅 **작업 시작**: memory.get() → 컨텍스트 로딩
- 🌙 **작업 마무리**: 로컬→GitHub→서버 동기화 → memory.set()
- 💾 **템플릿 사용**: [Memory 저장 템플릿](./templates/memory-daily-save-template.md)

## 🤖 AI 협업 패턴

### Claude 역할
- 🔧 코드 구현 및 기술적 문제 해결
- 🏗️ 아키텍처 설계 및 디버깅
- 💾 Memory 시스템 기반 연속성 관리

### ChatGPT 역할
- 📋 프로젝트 기획 및 전략 수립
- 📝 문서화 및 사용자 요구사항 분석
- 🎯 비즈니스 로직 설계

### 협업 방식
- 📄 GitHub 문서 기반 컨텍스트 공유
- 🔄 작업 단계별 역할 분담
- 🤝 상호 리뷰 및 피드백

## 📊 RPA 자동화 로드맵

### Phase 1 (2-3개월)
- 🔄 동기화 자동화 (Git + 배포 + Memory)
- 📝 문서 자동 생성
- 📊 기본 모니터링

### Phase 2 (3-6개월)
- 🧠 컨텍스트 인식 자동화
- 🤖 AI 역할 분담 자동화
- ✅ 품질 관리 자동화

### Phase 3 (6-12개월)
- 🤝 A2A 직접 통신
- 📈 자가 학습 시스템
- 🔮 예측 자동화

## 🎯 단축키 & 팁

### 자주 사용하는 명령어
```bash
# API 서버 시작
cd services/api-server && npm run dev

# 메인 사이트 시작
cd services/main-site && npm run dev

# Docker 컨테이너 실행
docker-compose up -d

# Git 동기화
git add . && git commit -m "feat: ..." && git push

# 서버 배포
bash scripts/deploy-yaksa.sh
```

### Claude Memory 사용법
```
# 작업 시작
Claude야, memory.get("project-status"), memory.get("current-tasks")

# 작업 종료
Claude야, 오늘 작업 내용을 memory.set()으로 저장해줘
```

---

**📌 즐겨찾기 추가 방법**  
이 파일을 브라우저 즐겨찾기에 추가하거나 IDE에서 탭으로 고정하여 사용하세요.

**🔄 업데이트 주기**  
작업 완료 시마다 현재 상태 및 다음 작업 계획 업데이트

**📅 최종 수정**: 2025-06-07 (PostgreSQL 마이그레이션 완료 후)
