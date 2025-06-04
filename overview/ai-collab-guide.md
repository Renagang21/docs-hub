# AI 협업 가이드 (`ai-collab-guide.md`)

이 문서는 ChatGPT, Claude, Gemini와 같은 범용 또는 특화형 인공지능 도구들과의 협업을 효율적으로 수행하기 위한 가이드입니다.  
특히, o4o-platform 및 관련 저장소 개발을 AI와 공동작업할 때 필요한 입력 문서 구성, 대화 방식, 폴더 구조 맥락 설명 방식 등을 포함합니다.

---

## 🤖 협업 대상 AI 도구

| 분류 | 도구명 | 특징 |
|------|--------|------|
| 범용 | ChatGPT (GPT-4o) | 설명력, 정리력 우수. 개발자와 대화형 기획/정리 적합 |
| 범용 | Claude | 긴 문서 분석에 강점, 자연어 문맥 이해 우수 |
| 범용 | Gemini | Google 기반, 코드 생성과 파일 편집 능력 활용 |
| 특화 | Cursor IDE + GPT | 실시간 코드 생성, Task 문서 기반 자동 처리 |

---

## 📁 폴더 구조 전달 기준

AI가 프로젝트 문맥을 이해하려면 **다음 디렉터리 구조 및 저장소 구분**을 명확히 설명해야 함:

- Coding/o4o-platform/...
- Coding/ai-services/
- Coding/rpa-service/
- Coding/common-core/
- Coding/docs-hub/...

각 저장소의 역할, 주요 서비스 폴더 이름, tasks 문서의 위치 등도 명확히 전달해야 함

---

## 📄 문서 활용 예시

### 1. 초기 상황 설명 시
```
현재 로그인 인증 기능 개발 중이며, api-server는 common-core/auth를 공유합니다.
디렉터리 구조는 다음과 같습니다:
Coding/o4o-platform/services/api-server/
Coding/common-core/auth/...
```

### 2. Task 문서 전달 예시
```
📁 Coding/o4o-platform/docs-hub/tasks/main-site/login-task.md
```

---

## ✅ 협업 시 유의사항

- **중복 방지**: 이미 설명한 내용은 반복하지 않도록 한 문서에서 참조
- **상태 명확화**: 기능 진행 순서, 완료 여부를 구체적으로 표현
- **파일명 정확성**: 경로 오타/혼동 방지를 위해 항상 복사해서 전달
- **로컬과 GitHub 구조 일치 여부**도 AI에게 전달

---

## 🌐 향후 활용

이 문서는 `docs-hub`의 표준 협업 가이드 문서로 활용되며,  
GitHub 이슈 생성, Claude/Gemini 프롬프트 작성 시 참고 용도로 사용됩니다.
