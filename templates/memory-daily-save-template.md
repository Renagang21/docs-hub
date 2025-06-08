# 📚 Claude Memory 일일 저장 템플릿

> 매일 작업 종료 시 Claude에게 복사-붙여넣기로 전달하는 memory 저장 요청서

## 🎯 Claude에게 전달할 메시지

```plaintext
Claude야, 오늘 작성한 문서들을 memory에 저장해줘.
아래 memory.set(...) 명령어들을 실행해서 저장하고, 
내일 memory.get(...)으로 불러올 수 있게 해줘.

# 📝 오늘 저장할 문서들 (필요한 것만 수정/추가)

memory.set("admin-dashboard-plan", file("https://github.com/Renagang21/docs-hub/blob/main/plan/admin-dashboard.md"))
memory.set("product-api-guide", file("https://github.com/Renagang21/docs-hub/blob/main/api/product-api.md"))
memory.set("user-auth-flow", file("https://github.com/Renagang21/docs-hub/blob/main/auth/user-auth-flow.md"))
memory.set("database-schema", file("https://github.com/Renagang21/docs-hub/blob/main/database/schema-design.md"))
memory.set("deployment-checklist", file("https://github.com/Renagang21/docs-hub/blob/main/deployment/daily-checklist.md"))

# 🔄 기존 문서 업데이트 (내용이 변경된 경우)
memory.update("mcp-integration-overview", file("https://github.com/Renagang21/docs-hub/blob/main/overview/mcp-integration-overview.md"))
memory.update("cicd-guide", file("https://github.com/Renagang21/docs-hub/blob/main/plan/cicd-implementation-guide.md"))

# ✅ 저장 완료 후 확인
memory.list() 로 현재 저장된 모든 문서 목록을 보여줘.

저장 완료되면 "✅ 오늘의 문서들이 memory에 저장되었습니다!" 라고 알려줘.
```

---

## 📋 일반적인 저장 패턴

### 🗂️ 자주 사용되는 memory 키 패턴

| 영역 | memory 키 예시 | 설명 |
|------|---------------|------|
| **계획/기획** | `project-roadmap`, `feature-spec`, `admin-dashboard-plan` | 프로젝트 로드맵, 기능 명세서 |
| **API 문서** | `product-api-guide`, `user-api-spec`, `payment-api-docs` | REST API 문서, GraphQL 스키마 |
| **인증/보안** | `auth-integration-guide`, `user-auth-flow`, `security-policy` | 인증 시스템, 보안 정책 |
| **데이터베이스** | `database-schema`, `migration-guide`, `data-model` | DB 스키마, 마이그레이션 |
| **배포/운영** | `deployment-checklist`, `server-config`, `monitoring-setup` | 배포 가이드, 서버 설정 |
| **UI/UX** | `design-system`, `component-library`, `user-journey` | 디자인 시스템, 컴포넌트 |
| **테스트** | `test-scenarios`, `api-test-cases`, `e2e-test-guide` | 테스트 케이스, 시나리오 |

### 🔄 업데이트 vs 새로 저장

```plaintext
# 🆕 새 문서 저장 (처음)
memory.set("새로운키", file("경로"))

# 🔄 기존 문서 업데이트 (내용 변경됨)
memory.update("기존키", file("경로"))

# 🗑️ 더이상 필요없는 문서 삭제
memory.remove("삭제할키")
```

---

## 🚀 빠른 복사용 템플릿

### 📅 매일 저장용 (기본)

```plaintext
Claude야, 오늘 작성한 문서들을 memory에 저장해줘:

memory.set("", file(""))
memory.set("", file(""))
memory.set("", file(""))

저장 완료 후 memory.list()로 확인해줘.
```

### 📅 매주 정리용 (대량 저장)

```plaintext
Claude야, 이번 주 작성한 모든 문서들을 memory에 정리해서 저장해줘:

# 📋 이번 주 신규 문서들
memory.set("", file(""))
memory.set("", file(""))
memory.set("", file(""))

# 🔄 업데이트된 기존 문서들  
memory.update("", file(""))
memory.update("", file(""))

# 📊 저장 현황 리포트
memory.list()로 전체 목록 보여주고, 이번 주 저장한 문서들 요약해줘.
```

---

## 💡 사용 팁

### ✅ 효과적인 사용법
1. **매일 작업 종료 전** 5분간 이 템플릿 사용
2. **파일 경로**만 실제 경로로 바꿔서 복사-붙여넣기
3. **memory 키**는 영어로, 간단명료하게 작성
4. **중요한 문서**는 즉시 저장, 사소한 메모는 주 단위로 정리

### ⚠️ 주의사항
- GitHub 경로가 정확한지 확인
- memory 키는 중복되지 않게 관리
- 너무 많은 문서를 한번에 저장하지 말고 중요도순으로 선별

### 🔗 ChatGPT 연계 활용
ChatGPT에게는 다음과 같이 말하면 됩니다:
```plaintext
이 GitHub 문서를 참조해서 작업해줘:
https://github.com/Renagang21/docs-hub/blob/main/plan/admin-dashboard.md
```

---

**💾 이 템플릿을 북마크해두고 매일 사용하세요!**
