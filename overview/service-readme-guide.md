# 서비스 저장소용 README 작성 가이드 (`service-readme-guide.md`)

이 문서는 `o4o-platform`, `ai-services`, `rpa-service` 등의 각 저장소에 작성될 README.md의 구성 가이드를 정의합니다.  
GitHub 상에서 AI 도구 및 개발자 협업 시 **초기 이해를 돕는 핵심 설명서** 역할을 수행합니다.

---

## ✅ 필수 구성 요소

| 섹션 제목 | 내용 요약 |
|-----------|------------|
| 프로젝트 설명 | 이 저장소가 다루는 서비스의 개요, 목적 |
| 주요 기능 | 핵심 기능 리스트 (요약 bullet list) |
| 디렉터리 구조 | 최상위 폴더 트리 및 주요 폴더 설명 |
| 설치 및 실행 방법 | 로컬 설치 방법, 의존성, 실행 명령 |
| 인증 정보 | SSO 또는 common-core 연동 방식 요약 |
| API 문서 링크 | 외부 API 문서, Swagger, Postman 등 |
| 예시/스크린샷 | 실제 사용 예시 또는 주요 UI 이미지 |
| 기타 | 기여 가이드, 로드맵, 라이선스 등 (선택) |

---

## 📁 예시 README 구성

```
# rpa-service

RPA 기반 약국/매장 업무 자동화 서비스. 반복적 작업을 최소화하여 업무 효율을 높입니다.

## 주요 기능
- 주문 동기화 봇
- 명세서 PDF 자동 정리
- 예약 자동화 등

## 디렉터리 구조
src/
├── bots/
├── workers/
...

## 설치 방법
git clone ...
npm install
npm run dev

## 인증 연동
→ common-core/auth 공유 / JWT 기반 인증 구조

## API 문서
[Swagger 문서 링크](#)

...

```

---

## 📌 적용 대상

- `o4o-platform/services/` 하위 서비스 전반
- `ai-services`, `rpa-service` 저장소
- `common-core`, 향후 생성될 서비스 저장소

---

이 가이드는 각 저장소 최초 생성 시 README.md 작성 기준 문서로 활용합니다.
