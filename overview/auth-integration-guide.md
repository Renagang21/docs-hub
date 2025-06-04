# 인증 통합 가이드 (`auth-integration-guide.md`)

이 문서는 o4o-platform의 로그인 및 인증 기능이 어떻게 여러 서비스와 연동되어 작동하는지를 정리한 문서입니다.  
공통 인증 모듈(`common-core/auth`)을 중심으로, o4o-platform, ai-services, rpa-service가 어떻게 인증을 공유하고 처리하는지를 다룹니다.

---

## 🔐 인증 구조 개요

- **공통 인증 모듈 위치**: `Coding/common-core/auth/`
- **주요 포함 기능**:
  - 사용자 로그인 (`/auth/login`)
  - 회원가입 (`/auth/register`)
  - 로그인 상태 확인 (`/auth/me`)
  - JWT 발급 및 검증
  - Local 전략 기반 로그인 및 Middleware 보호 기능 포함

---

## 📁 연동 서비스 및 구조

| 서비스 | 저장소 | 인증 방식 | 연동 구조 설명 |
|--------|--------|-----------|----------------|
| o4o-platform | `o4o-platform/services/api-server/` | Local 전략 (JWT) | `common-core/auth`의 라우터 및 미들웨어를 import하여 직접 라우팅에 통합 |
| ai-services | 별도 저장소 (`ai-services/`) | SSO or Shared Token | API 서버 인증 라우터를 직접 호출 또는 공용 인증 모듈을 라이브러리처럼 사용 |
| rpa-service | 별도 저장소 (`rpa-service/`) | Shared Token 기반 | 로그인 없이 API 접근 시 `/auth/me` 보호된 라우트 통해 사용자 검증 |

---

## 🧩 연동 예시 (o4o-platform)

```ts
// api-server/index.ts 또는 routes.ts 등에서

import { authRouter, authMiddleware } from 'common-core/auth';

app.use('/auth', authRouter); // 로그인/회원가입/검증 API

app.use('/api/protected-route', authMiddleware, protectedHandler);
```

---

## 🔑 JWT 구조 및 보호 처리

- 토큰 생성 시:
  - 유저 ID, 역할 포함 (`userId`, `role`)
- 클라이언트는 `Authorization: Bearer <token>` 헤더에 토큰 포함
- 보호된 라우터에서 유효성 검증
- 에러 시 401 반환 및 redirect 처리

---

## 📦 향후 확장 고려

- Google OAuth, Phone 인증 등 전략 모듈 `common-core/auth/strategies/`에 추가
- 인증 연동 라이브러리화 (예: `@yaksa/auth-core`)
- 쿠키/세션 기반 전략 도입 가능성 (WebPOS 등 장치별 상황에 따라)

---

## 📍 관련 문서

- `common-core-overview.md`
- `login-task.md` (프론트 로그인 작업 상세)
- `auth-api-map.md` (API 명세 정리용)
