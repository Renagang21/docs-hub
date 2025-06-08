# 작업 시작 설정 워크플로우

이 문서는 새로운 근무지나 새로운 작업 세션을 시작할 때 개발 환경을 빠르게 설정하고 작업 컨텍스트를 복원하는 가이드입니다.

## 🎯 목표
- 개발 환경 빠른 설정 및 검증
- 이전 작업 컨텍스트 복원
- 오늘 할 작업 명확화
- 시간 낭비 없이 바로 개발 시작

---

## 📋 상세 체크리스트

### 1. 기본 환경 확인 (5분)
- [ ] **인터넷 연결 상태 확인**
- [ ] **VPN 연결 (필요시)**
- [ ] **개발 도구 실행 상태 확인**
  - VS Code / Cursor
  - 터미널
  - Docker Desktop
  - Node.js 버전

### 2. 로컬 저장소 동기화 (10분)
- [ ] **각 프로젝트 디렉토리로 이동하여 최신 상태 확인**
  ```bash
  cd C:/Users/sohae/OneDrive/Coding/common-core
  git status
  git pull origin main
  
  cd C:/Users/sohae/OneDrive/Coding/o4o-platform  
  git status
  git pull origin main
  
  cd C:/Users/sohae/OneDrive/Coding/ai-services
  git status  
  git pull origin main
  
  cd C:/Users/sohae/OneDrive/Coding/rpa-services
  git status
  git pull origin main
  
  cd C:/Users/sohae/OneDrive/Coding/docs-hub
  git status
  git pull origin main
  ```

### 3. 개발 환경 상태 점검 (10분)
- [ ] **Node.js 및 npm 버전 확인**
  ```bash
  node --version
  npm --version
  ```
- [ ] **Docker 상태 확인**
  ```bash
  docker --version
  docker ps
  ```
- [ ] **의존성 설치 상태 확인 (필요시 설치)**
  ```bash
  npm install  # 각 프로젝트별로
  ```
- [ ] **환경 변수 설정 확인**
  - `.env` 파일들 존재 여부
  - 필요한 API 키들 설정 상태

### 4. 서버 및 인프라 상태 확인 (5분)
- [ ] **AWS Lightsail 서버 상태 확인**
  ```bash
  ping your-server-ip
  ```
- [ ] **SSH 연결 테스트**
  ```bash
  ssh user@your-server "echo 'Server connection OK'"
  ```
- [ ] **주요 서비스 상태 확인**
  - 웹사이트 접속 테스트
  - API 엔드포인트 테스트
  - 데이터베이스 연결 상태

### 5. MCP 서버 연결 확인 (3분)
- [ ] **Claude Desktop MCP 서버 상태 확인**
  - filesystem 서버
  - github 서버  
  - desktop-commander 서버
  - memory 서버
- [ ] **간단한 테스트 실행**
  ```
  "현재 작업 디렉토리의 파일들을 보여줘"
  ```

### 6. 이전 작업 컨텍스트 복원 (10분)
- [ ] **최근 작업 문서 확인**
  - `docs-hub/development/01-cicd-implementation-status.md`
  - 각 프로젝트별 진행 상황 문서
- [ ] **GitHub 최근 커밋 및 이슈 확인**
- [ ] **진행 중인 브랜치 상태 확인**
  ```bash
  git branch -a
  git log --oneline -5
  ```
- [ ] **메모리에서 이전 작업 내용 복원**
  ```
  "지난번에 작업하던 내용을 알려줘"
  ```

### 7. 오늘 작업 계획 수립 (5분)
- [ ] **우선순위 작업 목록 확인**
- [ ] **예상 소요 시간 계산**
- [ ] **필요한 리소스 확인**
- [ ] **중간 체크포인트 설정**

---

## 🚨 환경별 특수 설정

### 🏠 집에서 작업 시
- [ ] 집 네트워크 설정 확인
- [ ] 개인 개발 환경 설정 로드
- [ ] 조용한 환경 설정 (알림 끄기 등)

### 🏢 사무실에서 작업 시  
- [ ] 회사 네트워크/VPN 연결
- [ ] 회사 보안 정책 준수 확인
- [ ] 외부 협업 도구 접근 권한 확인

### 🌍 외부 근무지에서 작업 시
- [ ] 안정적인 인터넷 연결 확보
- [ ] VPN 연결 상태 확인
- [ ] 보안 고려사항 점검
- [ ] 배터리 및 전원 상태 확인

---

## 🔧 자동화 스크립트 (참고)

### 빠른 환경 설정 스크립트
```bash
#!/bin/bash
# setup-work-environment.sh

echo "=== 작업 환경 설정 시작 ==="

# 1. 기본 도구 버전 확인
echo "🔧 개발 도구 버전 확인..."
echo "Node.js: $(node --version)"
echo "npm: $(npm --version)"  
echo "Git: $(git --version)"
echo "Docker: $(docker --version)"

# 2. 모든 프로젝트 동기화
echo "📥 프로젝트 동기화..."
projects=("common-core" "o4o-platform" "ai-services" "rpa-services" "docs-hub")

for project in "${projects[@]}"; do
    if [ -d "$HOME/OneDrive/Coding/$project" ]; then
        echo "Updating $project..."
        cd "$HOME/OneDrive/Coding/$project"
        git pull origin main
    fi
done

# 3. 서버 연결 테스트
echo "🌐 서버 연결 테스트..."
# ping your-server-ip

echo "✅ 환경 설정 완료!"
```

---

## 📊 체크리스트 완료 확인

모든 항목을 완료한 후:
- [ ] **모든 로컬 저장소가 최신 상태인가?**
- [ ] **개발 환경이 정상 작동하는가?**  
- [ ] **서버 연결이 가능한가?**
- [ ] **MCP 서버들이 정상 작동하는가?**
- [ ] **오늘 할 작업이 명확한가?**
- [ ] **필요한 도구들이 모두 준비되었는가?**

---

## 💡 효율적인 작업 시작 팁

### 1. 일관된 루틴 만들기
- 매번 같은 순서로 체크리스트 실행
- 자주 사용하는 명령어들 스크립트화
- 개인별 체크리스트 커스터마이징

### 2. 시간 단축 방법
- 자동화 스크립트 활용
- 즐겨찾기 및 단축키 설정  
- 가장 자주 사용하는 프로젝트부터 확인

### 3. 문제 예방
- 중요한 설정 파일들 클라우드 백업
- 개발 환경 도커화 고려
- 정기적인 개발 도구 업데이트

---

## 🆘 문제 해결 가이드

### 자주 발생하는 문제들

#### Git pull 실패
```bash
# 해결 방법
git stash          # 로컬 변경사항 임시 저장
git pull           # 다시 pull 시도  
git stash pop      # 저장된 변경사항 복원
```

#### Docker 실행 오류
```bash
# Docker Desktop 재시작
# 또는 명령어로 재시작
sudo systemctl restart docker  # Linux
```

#### 의존성 설치 실패
```bash
# 캐시 삭제 후 재설치
npm cache clean --force
rm -rf node_modules package-lock.json
npm install
```

#### MCP 서버 연결 실패  
- Claude Desktop 재시작
- 설정 파일 확인
- 개발자 모드 활성화 상태 확인

### 도움 요청 방법
문제가 발생하면 다음과 같이 요청하세요:
- `"작업 환경 설정 중에 Git 오류가 발생했어"`
- `"서버 연결이 안 되는데 확인해줘"`
- `"MCP 서버가 작동하지 않아"`
- `"오늘 할 작업 목록을 정리해줘"`

---

## 📝 개인화 체크리스트 영역

### 자주 사용하는 개인 설정
- [ ] _(여기에 개인적으로 필요한 설정들 추가)_
- [ ] _(예: 특정 IDE 설정, 개인 스크립트 실행 등)_

### 프로젝트별 특수 요구사항  
- [ ] _(프로젝트별로 추가로 확인해야 할 사항들)_

이 영역은 개인의 작업 스타일에 맞게 자유롭게 수정하여 사용하세요.