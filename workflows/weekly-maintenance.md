# 주간 정기 점검 워크플로우

이 문서는 매주 정기적으로 수행해야 할 시스템 점검 및 유지보수 작업들을 정리한 가이드입니다.

## 🎯 목표
- 시스템 안정성 및 성능 유지
- 잠재적 문제 조기 발견 및 예방
- 개발 환경 최적화
- 기술 부채 관리

## ⏰ 권장 실행 시간
- **매주 금요일 오후** 또는 **주말**
- 소요 시간: **1-2시간**
- 월말에는 더 상세한 점검 실시

---

## 📋 주간 점검 체크리스트

### 1. 시스템 리소스 점검 (20분)

#### 서버 리소스 확인
- [ ] **디스크 사용량 확인**
  ```bash
  df -h
  du -sh /var/log/*  # 로그 파일 크기 확인
  ```
- [ ] **메모리 사용량 분석**
  ```bash
  free -h
  top -o %MEM  # 메모리 사용량 높은 프로세스
  ```
- [ ] **CPU 사용률 확인**
  ```bash
  top -o %CPU
  iostat 1 5  # I/O 상태 확인
  ```
- [ ] **네트워크 상태 점검**
  ```bash
  netstat -tlnp
  ss -tuln
  ```

#### 로컬 개발 환경
- [ ] **로컬 디스크 정리**
  - 불필요한 파일 삭제
  - Docker 이미지/컨테이너 정리
  ```bash
  docker system prune -f
  docker image prune -a
  ```
- [ ] **임시 파일 정리**
  ```bash
  npm cache clean --force
  rm -rf node_modules/.cache
  ```

### 2. 의존성 및 보안 업데이트 (30분)

#### Node.js 의존성 점검
- [ ] **outdated 패키지 확인**
  ```bash
  npm outdated
  npm audit
  ```
- [ ] **보안 취약점 수정**
  ```bash
  npm audit fix
  ```
- [ ] **주요 라이브러리 버전 확인**
  - React, Express, TypeScript 등
  - 호환성 확인 후 업데이트

#### 시스템 보안 업데이트
- [ ] **OS 업데이트 확인**
  ```bash
  # Ubuntu/Debian
  sudo apt update && sudo apt list --upgradable
  
  # Windows (PowerShell)
  Get-WindowsUpdate
  ```
- [ ] **Docker 이미지 업데이트**
  ```bash
  docker-compose pull
  ```
- [ ] **SSL 인증서 만료일 확인**
  ```bash
  openssl s_client -connect your-domain.com:443 -servername your-domain.com | openssl x509 -noout -dates
  ```

### 3. 데이터베이스 점검 (20분)

#### PostgreSQL 점검
- [ ] **데이터베이스 크기 확인**
  ```sql
  SELECT pg_database.datname, pg_size_pretty(pg_database_size(pg_database.datname)) AS size 
  FROM pg_database;
  ```
- [ ] **느린 쿼리 분석**
  ```sql
  SELECT query, calls, total_time, mean_time 
  FROM pg_stat_statements 
  ORDER BY total_time DESC LIMIT 10;
  ```
- [ ] **인덱스 사용률 확인**
- [ ] **백업 상태 확인**

#### MongoDB 점검 (해당시)
- [ ] **컬렉션 크기 확인**
- [ ] **인덱스 효율성 점검**
- [ ] **복제본 상태 확인**

#### Redis 점검 (해당시)
- [ ] **메모리 사용량 확인**
- [ ] **키 만료 설정 점검**
- [ ] **연결 상태 확인**

### 4. 로그 분석 및 모니터링 (25분)

#### 애플리케이션 로그 분석
- [ ] **에러 로그 검토**
  ```bash
  grep -i error /var/log/your-app.log | tail -20
  grep -i exception /var/log/your-app.log | tail -20
  ```
- [ ] **성능 관련 로그 확인**
- [ ] **비정상적인 접근 패턴 분석**
  ```bash
  tail -1000 /var/log/nginx/access.log | awk '{print $1}' | sort | uniq -c | sort -nr | head -10
  ```

#### 시스템 로그 점검
- [ ] **시스템 에러 로그**
  ```bash
  journalctl -p err -since "1 week ago"
  dmesg | grep -i error
  ```
- [ ] **보안 관련 로그**
  ```bash
  grep -i failed /var/log/auth.log | tail -20
  ```

#### 웹 서버 로그 (Nginx/Apache)
- [ ] **접속 통계 분석**
- [ ] **404 에러 페이지 확인**
- [ ] **응답 시간 분석**

### 5. 백업 및 복구 점검 (15분)

#### 백업 상태 확인
- [ ] **자동 백업 실행 상태**
  ```bash
  crontab -l  # 크론잡 확인
  systemctl status backup-service
  ```
- [ ] **백업 파일 무결성 검증**
- [ ] **백업 저장 공간 확인**
- [ ] **오래된 백업 파일 정리**

#### 복구 테스트 (월간)
- [ ] **소규모 복구 테스트 실행**
- [ ] **복구 절차 문서 업데이트**

### 6. 성능 및 모니터링 (20분)

#### 웹사이트 성능 테스트
- [ ] **페이지 로딩 속도 확인**
  ```bash
  curl -w "@curl-format.txt" -o /dev/null -s "https://your-domain.com"
  ```
- [ ] **Core Web Vitals 측정**
- [ ] **모바일 반응성 테스트**

#### API 성능 테스트
- [ ] **주요 API 엔드포인트 응답 시간**
- [ ] **동시 접속 처리 능력**
- [ ] **에러율 확인**

#### 모니터링 도구 점검
- [ ] **알림 설정 확인**
- [ ] **대시보드 업데이트**
- [ ] **임계값 조정 (필요시)**

---

## 📊 정기 점검 결과 기록

### 체크리스트 템플릿
```markdown
# 주간 점검 보고서 - YYYY-MM-DD

## 시스템 상태 요약
- 서버 상태: ✅ 정상 / ⚠️ 주의 / ❌ 문제
- 성능: ✅ 양호 / ⚠️ 주의 / ❌ 개선 필요
- 보안: ✅ 양호 / ⚠️ 업데이트 필요 / ❌ 취약점 발견

## 발견된 이슈
1. [이슈 설명]
   - 심각도: 높음/보통/낮음
   - 조치 계획: [해결 방법]

## 수행한 업데이트
- 의존성 업데이트: [목록]
- 보안 패치: [목록]
- 설정 변경: [목록]

## 다음 주 계획
- [ ] [할 일 1]
- [ ] [할 일 2]
```

---

## 🔧 자동화 가능한 점검 항목

### 자동 모니터링 스크립트
```bash
#!/bin/bash
# weekly-check.sh

echo "=== 주간 시스템 점검 시작 ==="

# 1. 디스크 사용량 체크 (80% 이상 시 경고)
disk_usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ $disk_usage -gt 80 ]; then
    echo "⚠️ 디스크 사용량 높음: ${disk_usage}%"
fi

# 2. 메모리 사용량 체크
free -h

# 3. 서비스 상태 체크
systemctl is-active --quiet nginx && echo "✅ Nginx 정상" || echo "❌ Nginx 문제"
systemctl is-active --quiet postgresql && echo "✅ PostgreSQL 정상" || echo "❌ PostgreSQL 문제"

# 4. 로그 에러 체크
error_count=$(grep -c -i error /var/log/your-app.log)
echo "📊 이번 주 에러 발생 횟수: $error_count"

echo "=== 점검 완료 ==="
```

---

## 📈 월간 추가 점검 항목

### 월말 정기 점검 (추가 1시간)
- [ ] **전체 시스템 성능 리포트 생성**
- [ ] **기술 부채 평가 및 정리 계획**
- [ ] **보안 감사 실시**
- [ ] **재해 복구 계획 점검**
- [ ] **비용 분석 및 최적화**
- [ ] **문서 업데이트 및 정리**

### 분기별 점검 (추가 2시간)
- [ ] **전체 아키텍처 리뷰**
- [ ] **성능 벤치마크 테스트**
- [ ] **보안 침투 테스트**
- [ ] **백업 전체 복구 테스트**

---

## 💡 효율적인 점검을 위한 팁

### 1. 체크리스트 커스터마이징
- 프로젝트 특성에 맞게 항목 조정
- 자주 발생하는 문제에 대한 특별 점검 추가
- 계절별 특수 점검 항목 추가

### 2. 도구 활용
- 모니터링 대시보드 구성
- 자동화 스크립트 작성
- 알림 시스템 설정

### 3. 문제 예방
- 임계값 사전 설정
- 정기적 업데이트 일정 수립
- 문제 발생 패턴 분석

---

## 🆘 문제 발생 시 대응

### 즉시 조치가 필요한 상황
- 서비스 중단
- 보안 취약점 발견  
- 데이터 손실 위험
- 디스크 용량 부족

### 도움 요청 방법
문제가 발견되면 다음과 같이 요청하세요:
- `"주간 점검에서 성능 이슈가 발견됐어"`
- `"디스크 사용량이 높은데 정리 도움이 필요해"`
- `"보안 업데이트를 적용하고 싶어"`

---

## 📚 관련 문서
- `troubleshooting-steps.md` - 문제 해결 가이드
- `deployment-checklist.md` - 배포 시 점검사항  
- `daily-workflows.md` - 일일 워크플로우

정기적인 점검을 통해 안정적이고 효율적인 개발 환경을 유지하세요! 🚀