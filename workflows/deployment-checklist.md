# 배포 체크리스트 워크플로우

이 문서는 서버에 새로운 버전을 배포할 때 안전하고 확실하게 진행하기 위한 체크리스트입니다.

## 🎯 목표
- 무중단 또는 최소 중단 시간으로 배포
- 배포 실패 시 빠른 롤백 가능
- 배포 과정 및 결과 문서화
- 사용자 영향 최소화

---

## 📋 배포 전 준비사항 (Pre-deployment)

### 1. 로컬 환경 검증 (15분)
- [ ] **로컬에서 모든 테스트 통과 확인**
  ```bash
  npm test
  npm run lint
  npm run type-check
  ```
- [ ] **빌드 성공 확인**
  ```bash
  npm run build
  ```
- [ ] **로컬에서 프로덕션 모드 테스트**
  ```bash
  npm start
  # 또는 docker-compose up
  ```
- [ ] **주요 기능 수동 테스트**
  - 로그인/로그아웃
  - 핵심 API 엔드포인트
  - 데이터베이스 연결

### 2. 코드 품질 확인 (10분)
- [ ] **코드 리뷰 완료 (팀 작업 시)**
- [ ] **커밋 메시지 명확성 확인**
- [ ] **불필요한 파일 제거**
  ```bash
  git clean -fd  # 추적되지 않는 파일 정리
  ```
- [ ] **민감한 정보 노출 여부 확인**
  - API 키, 비밀번호 등

### 3. CI/CD 파이프라인 확인 (5분)
- [ ] **GitHub Actions 상태 확인**
- [ ] **자동 테스트 결과 확인**
- [ ] **Docker 이미지 빌드 성공 확인**
- [ ] **보안 스캔 결과 확인**

---

## 🛡️ 배포 전 백업 및 안전 조치 (10분)

### 1. 데이터베이스 백업
- [ ] **현재 데이터베이스 백업 생성**
  ```bash
  # PostgreSQL 예시
  pg_dump -U username -h hostname dbname > backup_$(date +%Y%m%d_%H%M%S).sql
  
  # MongoDB 예시
  mongodump --host hostname --db dbname --out backup_$(date +%Y%m%d_%H%M%S)
  ```
- [ ] **백업 파일 안전한 위치에 저장**
- [ ] **백업 파일 무결성 확인**

### 2. 서버 상태 스냅샷
- [ ] **현재 실행 중인 서비스 목록 기록**
  ```bash
  docker ps > pre_deploy_services.txt
  systemctl list-units --state=running > pre_deploy_systemd.txt
  ```
- [ ] **현재 환경 변수 백업**
- [ ] **설정 파일들 백업**

### 3. 롤백 계획 준비
- [ ] **이전 버전 태그/커밋 ID 확인**
- [ ] **롤백 스크립트 준비**
- [ ] **예상 롤백 시간 계산**

---

## 🚀 배포 실행 단계 (20분)

### 1. 서버 접속 및 상태 확인 (5분)
- [ ] **서버 SSH 접속**
  ```bash
  ssh user@your-server-ip
  ```
- [ ] **서버 리소스 상태 확인**
  ```bash
  df -h          # 디스크 사용량
  free -h        # 메모리 사용량  
  top            # CPU 사용량
  ```
- [ ] **현재 서비스 상태 확인**
  ```bash
  docker ps
  systemctl status your-service
  ```

### 2. 코드 업데이트 (5분)
- [ ] **최신 코드 pull**
  ```bash
  cd /path/to/your/project
  git pull origin main
  ```
- [ ] **변경사항 확인**
  ```bash
  git log --oneline -5
  git diff HEAD~1
  ```
- [ ] **의존성 업데이트 (필요시)**
  ```bash
  npm install
  # 또는 docker-compose pull
  ```

### 3. 빌드 및 배포 (10분)
- [ ] **새 버전 빌드**
  ```bash
  npm run build
  # 또는 docker-compose build
  ```
- [ ] **환경 변수 설정 확인**
  ```bash
  cat .env.production
  ```
- [ ] **서비스 재시작**
  ```bash
  # Docker 사용 시
  docker-compose down
  docker-compose up -d
  
  # PM2 사용 시
  pm2 restart all
  
  # Systemd 사용 시
  sudo systemctl restart your-service
  ```

---

## ✅ 배포 후 검증 (15분)

### 1. 서비스 상태 확인 (5분)
- [ ] **모든 컨테이너/서비스가 정상 실행 중인지 확인**
  ```bash
  docker ps
  docker logs container-name
  systemctl status your-service
  ```
- [ ] **포트 바인딩 확인**
  ```bash
  netstat -tlnp | grep :80
  netstat -tlnp | grep :443
  ```
- [ ] **프로세스 메모리 사용량 확인**

### 2. 기능 테스트 (10분)
- [ ] **웹사이트 접속 확인**
  ```bash
  curl -I https://your-domain.com
  ```
- [ ] **API 엔드포인트 테스트**
  ```bash
  curl -X GET https://your-domain.com/api/health
  curl -X POST https://your-domain.com/api/test
  ```
- [ ] **데이터베이스 연결 확인**
- [ ] **로그인/인증 기능 테스트**
- [ ] **핵심 비즈니스 로직 테스트**

### 3. 모니터링 및 로그 확인
- [ ] **애플리케이션 로그 확인**
  ```bash
  tail -f /var/log/your-app.log
  docker logs -f container-name
  ```
- [ ] **에러 로그 검색**
  ```bash
  grep -i error /var/log/your-app.log
  ```
- [ ] **성능 지표 확인**
  - 응답 시간
  - 메모리 사용량
  - CPU 사용률

---

## 📊 배포 완료 후 작업 (10분)

### 1. 문서화 및 기록
- [ ] **배포 내역 기록**
  - 배포 시간
  - 배포된 버전/커밋 ID
  - 주요 변경사항
  - 배포 담당자
- [ ] **문제점 및 개선사항 기록**
- [ ] **다음 배포를 위한 메모 작성**

### 2. 팀 커뮤니케이션 (해당시)
- [ ] **배포 완료 알림**
- [ ] **주요 변경사항 공유**
- [ ] **알려진 이슈나 주의사항 공유**

### 3. 모니터링 설정
- [ ] **향후 24시간 모니터링 계획**
- [ ] **알림 설정 확인**
- [ ] **로그 레벨 조정 (필요시)**

---

## 🆘 문제 발생 시 롤백 절차

### 긴급 롤백 (5분 이내)
```bash
# 1. 즉시 이전 버전으로 롤백
git checkout previous-version-tag
docker-compose down && docker-compose up -d

# 2. 또는 이전 이미지로 롤백  
docker-compose down
docker tag your-image:previous your-image:latest
docker-compose up -d

# 3. 서비스 상태 확인
docker ps
curl -I https://your-domain.com
```

### 데이터베이스 롤백 (필요시)
```bash
# PostgreSQL 복원
psql -U username -h hostname dbname < backup_file.sql

# MongoDB 복원  
mongorestore --host hostname --db dbname backup_directory/
```

---

## 📋 환경별 배포 가이드

### 개발 환경 (Development)
- [ ] 테스트가 덜 엄격해도 됨
- [ ] 실험적 기능 포함 가능
- [ ] 다운타임 허용 가능

### 스테이징 환경 (Staging)  
- [ ] 프로덕션과 동일한 배포 절차
- [ ] 완전한 기능 테스트 필수
- [ ] 성능 테스트 수행

### 프로덕션 환경 (Production)
- [ ] 모든 체크리스트 필수 준수
- [ ] 무중단 배포 고려
- [ ] 사용자 트래픽이 적은 시간 선택
- [ ] 상세한 모니터링 및 기록

---

## 💡 배포 성공을 위한 팁

### 1. 배포 타이밍
- 트래픽이 적은 시간대 선택
- 주말이나 휴일 피하기 (긴급 대응 어려움)
- 충분한 시간 여유 확보

### 2. 점진적 배포 (가능한 경우)
- 일부 사용자에게만 먼저 배포
- 문제 없으면 전체 사용자로 확장
- Blue-Green 배포 고려

### 3. 자동화 개선
- 자주 반복되는 작업은 스크립트화
- CI/CD 파이프라인 지속적 개선
- 배포 과정의 표준화

---

## 🔗 관련 문서
- `end-of-work-sync.md` - 배포 전 코드 동기화
- `troubleshooting-steps.md` - 문제 발생 시 대응
- `weekly-maintenance.md` - 정기적 서버 점검

---

## 📞 비상 연락처 및 참고 자료
- 서버 관리 업체 연락처
- 도메인/DNS 관리 업체
- 주요 API 서비스 상태 페이지
- 백업 복구 가이드