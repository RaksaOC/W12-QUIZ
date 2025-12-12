# Architecture Questions

## Q3 – Widget Properties

| WIDGET                 | TYPE (SL/SF) | PARAMETERS                                                                                                                                                   | STATES                                                                                                       |
| ---------------------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------ |
| **AppButton**          | SL           | `String label` (required)<br>`void Function() onPressed` (required)<br>`IconData? icon` (optional)<br>`Key? key` (optional)                                  | None (Stateless)                                                                                             |
| **AppInput**           | SL           | `String label` (required)<br>`void Function(String) onChanged` (required)<br>`String? placeholder` (optional)<br>`Key? key` (optional)                       | None (Stateless)                                                                                             |
| **AppBackButton**      | SL           | `VoidCallback onPressed` (required)<br>`Key? key` (optional)                                                                                                 | None (Stateless)                                                                                             |
| **MenuButton**         | SL           | `Pages page` (required)<br>`void Function(String) onPressed` (required)<br>`Key? key` (optional)                                                             | None (Stateless)                                                                                             |
| **QuizCard**           | SL           | `Quiz quiz` (required)<br>`Function(int) onPressed` (required)<br>`Key? key` (optional)                                                                      | None (Stateless)                                                                                             |
| **QuestionCard**       | SL           | `Question question` (required)<br>`int? selectedChoiceId` (optional)<br>`Function(int, int) onChoiceClicked` (required)<br>`Key? key` (optional)             | None (Stateless)                                                                                             |
| **QuestionNavigator**  | SL           | `int quizQuestionLength` (required)<br>`int currentQuestionIndex` (required)<br>`Function(MoveDirection) onMoveQuestion` (required)<br>`Key? key` (optional) | None (Stateless)                                                                                             |
| **QuestionResultCard** | SL           | `Question question` (required)<br>`int? selectedChoiceId` (optional)<br>`Key? key` (optional)                                                                | None (Stateless)                                                                                             |
| **QuizHistoryCard**    | SL           | `Submission submission` (required)<br>`Key? key` (optional)                                                                                                  | None (Stateless)                                                                                             |
| **QuestionScreen**     | SF           | `List<Question> questions` (required)<br>`Function(List<QuestionHistory>) onSubmit` (required)<br>`VoidCallback onBack` (required)<br>`Key? key` (optional)  | `List<QuestionHistory> questionHistories`<br>`int currentQuestionIndex`<br>`Map<int, int> selectedChoiceIds` |

**Legend:** SL = StatelessWidget, SF = StatefulWidget

---

## Q5 – Navigation Management

### Navigation Overview

- **Question Navigation:** Managed in `QuestionScreen` using local state (`currentQuestionIndex`). `QuestionNavigator` provides Previous/Next/Submit, and answer selection is tracked in state vars.
- **Result Navigation:** On submit, `QuestionScreen` calls `onSubmit`, which in `QuizApp` saves the submission and switches to the result screen (`Pages.result`).

_Navigation logic: questions = `QuestionScreen` (local); screen = `QuizApp` (global)._

---

## Q6 – Reusable Widgets

| WIDGET                 | TYPE (SL/SF) | PARAMETERS                                                                                                                                                   | STATES           |
| ---------------------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------- |
| **AppButton**          | SL           | `String label` (required)<br>`void Function() onPressed` (required)<br>`IconData? icon` (optional)<br>`Key? key` (optional)                                  | None (Stateless) |
| **AppInput**           | SL           | `String label` (required)<br>`void Function(String) onChanged` (required)<br>`String? placeholder` (optional)<br>`Key? key` (optional)                       | None (Stateless) |
| **AppBackButton**      | SL           | `VoidCallback onPressed` (required)<br>`Key? key` (optional)                                                                                                 | None (Stateless) |
| **MenuButton**         | SL           | `Pages page` (required)<br>`void Function(String) onPressed` (required)<br>`Key? key` (optional)                                                             | None (Stateless) |
| **QuizCard**           | SL           | `Quiz quiz` (required)<br>`Function(int) onPressed` (required)<br>`Key? key` (optional)                                                                      | None (Stateless) |
| **QuestionCard**       | SL           | `Question question` (required)<br>`int? selectedChoiceId` (optional)<br>`Function(int, int) onChoiceClicked` (required)<br>`Key? key` (optional)             | None (Stateless) |
| **QuestionNavigator**  | SL           | `int quizQuestionLength` (required)<br>`int currentQuestionIndex` (required)<br>`Function(MoveDirection) onMoveQuestion` (required)<br>`Key? key` (optional) | None (Stateless) |
| **QuestionResultCard** | SL           | `Question question` (required)<br>`int? selectedChoiceId` (optional)<br>`Key? key` (optional)                                                                | None (Stateless) |
| **QuizHistoryCard**    | SL           | `Submission submission` (required)<br>`Key? key` (optional)                                                                                                  | None (Stateless) |

**Usage Across Screens:**

- **AppButton**: Used in Welcome, Question, and Result screens
- **AppInput**: Used in Auth screen for email/password
- **AppBackButton**: Used in Quiz, Question, Result, and History screens
- **MenuButton**: Used in Welcome screen for navigation
- **QuizCard**: Used in Quiz screen to display quiz list
- **QuestionCard**: Used in Question screen
- **QuestionNavigator**: Used in Question screen for question navigation
- **QuestionResultCard**: Used in Result and History screens
- **QuizHistoryCard**: Used in History screen

**Legend:** SL = StatelessWidget, SF = StatefulWidget
