# ⏭️ 이후 작업을 위한 추가 문서 제안

이 문서는 `o4o-platform`, `common-core`, `ai-services`, `rpa-service` 개발이 진행됨에 따라
추가로 작성하면 좋을 문서들을 사전에 정리한 안내 자료입니다.  
각 문서는 해당 기능의 기획, 설계, 연동 구조 등을 인공지능 도우미에게 전달하기 위한 용도로 사용됩니다.

---

## ✅ 제안 문서 목록

| 문서 이름 | 저장 위치 제안 | 설명 |
|----------|----------------|------|
| `deployment-overview.md` | `docs-hub/overview/` | AWS Lightsail 인프라 구성, 배포 흐름, 도메인/Nginx 설정 요약 |
| `task-guide.md` | `docs-hub/tasks/` | Task 문서 작성 가이드. 작업 목적, 순서, 구조 표준화 |
| `admin-subdomain-plan.md` | `docs-hub/services/` | `admin.neture.co.kr` 내 관리자 기능 모듈 분리 구조 정리 |
| `editor-plan.md` | `docs-hub/services/` | Tiptap 기반 편집기 기능 기획 및 페이지 구성 설계 |
| `media-policy.md` | `docs-hub/overview/` | 이미지, 동영상 등 미디어 자산의 저장 방식과 접근 정책 |
| `error-log-policy.md` | `docs-hub/overview/` 또는 `docs-hub/common-core/` | 오류 처리/로그 수집 및 알림 정책 |

---

## 📌 작성 및 관리 방안

- 우선순위는 현재 진행 중인 기능 흐름에 따라 설정 (예: 로그인 → 인증 연동 → 관리자 기능 → 편집기)
- 문서가 생성될 때마다 위 위치에 저장하여 인공지능 도우미와 협업 기반으로 관리
- 저장소 이동, 문서 갯수 증가에 따라 별도 태그나 이름 규칙을 함께 정의

---

## 🗂️ 저장 위치 안내

이 문서는 다음 위치에 저장하는 것을 권장합니다:

```
Coding/docs-hub/overview/next-docs-plan.md
```

---

이 문서는 정기적으로 업데이트될 수 있으며, 새로운 요구사항이나 협업 흐름이 정해질 때마다 항목을 보완해 나갑니다.
