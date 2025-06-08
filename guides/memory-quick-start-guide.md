# 🚀 Claude Memory 빠른 시작 가이드

> Claude와 ChatGPT 협업을 위한 memory 시스템 사용법

## 📋 매일 루틴 (2분으로 끝!)

### 🌅 **작업 시작할 때**
```plaintext
Claude야, 오늘 작업할 문서들 불러와줘:

memory.get("project-roadmap")
memory.get("admin-dashboard-plan") 
memory.get("api-guide")

오늘 작업 계획 알려줘.
```

### 🌙 **작업 마무리할 때**
```plaintext
Claude야, 오늘 작성한 문서들을 memory에 저장해줘:

memory.set("admin-dashboard-plan", file("https://github.com/Renagang21/docs-hub/blob/main/plan/admin-dashboard.md"))
memory.set("product-api-guide", file("https://github.com/Renagang21/docs-hub/blob/main/api/product-api.md"))

저장 완료 후 memory.list()로 확인해줘.
```

---

## 🎯 핵심 명령어 치트시트

| 명령어 | 용도 | 예시 |
|--------|------|------|
| `memory.set()` | 새 문서 저장 | `memory.set("api-guide", file("경로"))` |
| `memory.get()` | 문서 불러오기 | `memory.get("api-guide")` |
| `memory.update()` | 기존 문서 업데이트 | `memory.update("api-guide", file("경로"))` |
| `memory.list()` | 전체 목록 보기 | `memory.list()` |
| `memory.remove()` | 문서 삭제 | `memory.remove("api-guide")` |

---

## 💡 실전 활용 시나리오

### 📊 **프로젝트 시작 시**
```plaintext
Claude야, 새 프로젝트 memory 셋업해줘:

memory.set("project-overview", file("https://github.com/Renagang21/docs-hub/blob/main/overview/project-overview.md"))
memory.set("tech-stack", file("https://github.com/Renagang21/docs-hub/blob/main/tech/tech-stack.md"))
memory.set("folder-structure", file("https://github.com/Renagang21/docs-hub/blob/main/structure/folder-structure.md"))

프로젝트 컨텍스트 정리해서 보여줘.
```

### 🔄 **개발 진행 중**
```plaintext
Claude야, 진행상황 업데이트:

memory.update("api-progress", file("https://github.com/Renagang21/docs-hub/blob/main/progress/api-progress.md"))
memory.get("next-tasks")

다음 할 일 정리해줘.
```

### 🎉 **마일스톤 달성 시**
```plaintext
Claude야, 마일스톤 기록해줘:

memory.set("milestone-v1", file("https://github.com/Renagang21/docs-hub/blob/main/milestones/v1-complete.md"))
memory.get("project-roadmap")

다음 단계 계획 보여줘.
```

---

## 🔗 ChatGPT 연계 전략

### 📝 **ChatGPT에게 문서 전달하는 법**
```plaintext
ChatGPT에게 이렇게 말하세요:

"이 GitHub 문서들을 참조해서 작업해줘:
- 프로젝트 개요: https://github.com/Renagang21/docs-hub/blob/main/overview/project-overview.md
- API 설계: https://github.com/Renagang21/docs-hub/blob/main/api/api-design.md
- 기능 명세: https://github.com/Renagang21/docs-hub/blob/main/specs/feature-specs.md"
```

### 🔄 **Claude ↔ ChatGPT 워크플로우**
1. **Claude**: 기술 구현, 코드 작성, 아키텍처 설계
2. **ChatGPT**: 기획, 문서화, 사용자 스토리 작성
3. **공통 문서**: GitHub에 저장하여 양쪽에서 참조
4. **Claude Memory**: 기술적 진행상황 추적
5. **매일 동기화**: 두 AI가 같은 문서를 보고 작업

---

## ⚡ 자주 사용하는 템플릿

### 🗂️ **문서 카테고리별 저장**
```plaintext
# 📋 기획 문서
memory.set("project-roadmap", file("https://github.com/Renagang21/docs-hub/blob/main/plan/roadmap.md"))
memory.set("feature-specs", file("https://github.com/Renagang21/docs-hub/blob/main/specs/features.md"))

# 🔧 기술 문서  
memory.set("api-design", file("https://github.com/Renagang21/docs-hub/blob/main/api/design.md"))
memory.set("database-schema", file("https://github.com/Renagang21/docs-hub/blob/main/db/schema.md"))

# 🚀 배포 문서
memory.set("deployment-guide", file("https://github.com/Renagang21/docs-hub/blob/main/deploy/guide.md"))
memory.set("server-config", file("https://github.com/Renagang21/docs-hub/blob/main/config/server.md"))
```

### 📊 **주간 정리**
```plaintext
Claude야, 이번 주 work summary 만들어줘:

memory.list()
memory.get("weekly-progress")

이번 주 성과와 다음 주 계획 정리해줘.
```

---

**🎯 이제 Claude Memory 마스터입니다! 매일 2분만 투자하면 완벽한 프로젝트 컨텍스트를 유지할 수 있어요! 🚀**
