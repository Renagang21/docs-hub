# 공통 모듈(`common-core`) 분류 기준 설명

이 문서는 `common-core` 저장소의 내부 폴더 구조 중 헷갈리기 쉬운 항목들의 차이점과 책임 영역을 명확히 설명하고, 앞으로의 설계 방향을 안내합니다.

---

## 🔐 `token` vs `payment`

| 항목 | `token` | `payment` |
|------|---------|-----------|
| ✅ 목적 | 인증(Authentication), 인가(Authorization) | 결제 및 금전 거래 처리 |
| 🔧 역할 | 사용자 식별을 위한 **JWT 발급·검증** | **결제 모듈 연동, 거래 처리, 영수증** 등 |
| 📦 예시 함수 | `createAccessToken()`, `verifyToken()` | `requestPayment()`, `refundTransaction()` |
| 📂 폴더 위치 | `common-core/auth/tokens/` | `common-core/payment/` *(필요 시 생성)* |

---

## 🛡️ `security` 폴더가 별도로 필요한가?

| 항목 | 설명 |
|------|------|
| 🔍 일반적인 보안 로직 위치 | `auth/`, `middleware/` 내부에 포함 |
| 🔐 별도 폴더가 필요한 경우 | CSRF/XSS 필터, 암호화 유틸, IP 필터링 등 **범용 보안 로직** 존재 시 |
| 📦 현재 추천 위치 | `auth/` 또는 `middleware/` 하위로 포함시키고, 필요 시 `security/` 폴더 추가 |

---

## 📝 `logging`은 어디에?

| 항목 | 설명 |
|------|------|
| 📦 주요 기능 | `logError()`, `logInfo()`, `logToFile()`, `logToRemote()` |
| 🔁 공통 사용 여부 | ✅ 모든 서비스에서 공통으로 사용함 |
| 📂 폴더 추천 위치 | `common-core/logging/` 로 독립 운영 |

---

## 🧭 폴더 이름 변경의 이유

| 변경 대상 | 기존 | 변경 | 변경 이유 |
|-----------|------|------|------------|
| 문서 이름 | `platform-structure.md` | `service-architecture.md` | 더 구체적으로, 서비스 중심 설계 구조를 나타내기 위해 |
| 인증 전략 | `auth/strategies/` | `auth/passport/` | 구현이 Passport.js 기반으로 이루어져 있어, 더 명확하게 명명 |

---

## 📌 결론 요약

| 모듈 | 폴더 추천 위치 | 주된 책임 |
|-------|----------------|------------|
| `token` | `auth/tokens/` | JWT 등 인증 토큰 처리 |
| `payment` | `payment/` *(예정)* | PG 연동, 결제 처리 |
| `security` | `auth/` 또는 `middleware/` | 보안 정책, 필터링 등 |
| `logging` | `logging/` | 로그 기록 및 분석 |

---

이 기준은 `common-core` 저장소의 구조 정비, 문서 작성, 인공지능에게 전달할 문서의 기준으로도 함께 적용됩니다.
