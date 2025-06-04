# o4o-platform 통합 구조 및 도메인 설계

본 문서는 `neture.co.kr`을 중심으로 구성된 **O4O 플랫폼**의 전체 기술 아키텍처와  
도메인/저장소 간 연관성, 인증 흐름, 서비스 분리를 설명합니다.  
이 문서는 이후 모든 하위 문서의 기반 구조로 기능하고,  
AI, RPA, 전자상거래, 크라우드펀딩 등 다양한 서비스가 어디에 배치되는지를 이해하는 데 도움을 줍니다.

---

## 🌐 도메인 구조 (기준: neture.co.kr)

| 도메인 또는 경로 | 설명 | 관련 서비스 |
|------------------|------|--------------|
| `neture.co.kr` | 메인 사용자 사이트 (SPA) | main-site |
| `admin.neture.co.kr` | 관리자 전용 도메인 | main-site (관리자 모드) |
| `/store` | B2C 쇼핑몰 접근 진입점 | ecommerce |
| `/seller`, `/supplier` | 셀러/공급자 전용 관리자 페이지 | ecommerce |
| `/funding` | 크라우드펀딩 기능 | funding-service |
| `/forum`, `/edu` | 포럼 및 교육(LMS) | 추후 확장 예정 |
| `ai.neture.co.kr` | AI 자동화 서비스 | ai-service |
| `rpa.neture.co.kr` (예정) | 백오피스 자동화 RPA 서비스 | rpa-service |
| `api.neture.co.kr` | 인증 및 API 서버 | api-server (Medusa 등) |

---

## 🏗️ 플랫폼 구성 요소

### 1. Frontend Web

| 저장소 | 설명 |
|--------|------|
| `main-site` | neture.co.kr 기반 React SPA |
| `ecommerce` | 멀티스토어 전자상거래 UI |
| `funding-ui` (예정) | 크라우드 펀딩 UI |
| `admin-ui` | 관리자용 인터페이스 통합 |
| `ai-service-ui` | AI 서비스 사용 화면 (챗봇, 요약 등) |
| `rpa-console-ui` (예정) | 작업 스케줄링 및 자동화 플로우 UI |

---

### 2. Backend API

| 저장소 | 설명 |
|--------|------|
| `api-server` | 인증, 유저, 상품, 주문 API 제공 (Medusa 기반) |
| `ai-service` | 텍스트 분석, 요약, 응답 생성 등 AI 처리 |
| `rpa-service` | 반복 작업, 스케줄링, 외부 연동 자동화 처리 |

---

### 3. 공통 모듈 및 인증

| 저장소 | 설명 |
|--------|------|
| `common-core` | auth, logging, security, design, utils 등 공통 기능 |
| `docs-hub` | 문서 통합 저장소 |

---

## 🔐 인증/권한 흐름

- 로그인/가입은 모두 `api-server`에서 처리 (JWT 발급)
- 발급된 토큰은 각 프론트 앱에서 활용 (header or localStorage)
- 역할 기반 접근 제어 (예: `user`, `seller`, `administrator`, `operator` 등)
- 약사 인증(면허번호)은 yaksa 특화 기능으로 `yaksa.neture.co.kr`에 위치할 수도 있음

---

## 🔗 저장소 관계 맵 (요약)

```
📁 o4o-platform/
├── services/
│   ├── main-site/
│   ├── ecommerce/
│   ├── funding/
│   └── api-server/
├── ai-service/ (별도 저장소)
├── rpa-service/ (별도 저장소)
├── common-core/
└── docs-hub/
```

---

## 🧭 향후 확장 구조

- LMS, 포럼, 사이니지 등 모듈이 `services/` 아래로 추가될 예정
- 각 서비스는 API 우선 구조로 만들되, 인증/권한은 통합 구조 유지
- Medusa 외 GraphQL API 도입 가능성도 고려
