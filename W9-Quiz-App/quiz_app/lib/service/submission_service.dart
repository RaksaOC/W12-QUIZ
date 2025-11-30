import 'package:quiz_app/data/repository/submission_repository.dart';
import 'package:quiz_app/model/quiz.dart';
import 'package:quiz_app/service/session_service.dart';

class SubmissionService {
  final SubmissionRepository _submissionRepository = SubmissionRepository();
  SubmissionService();

  void saveSubmission(List<QuestionHistory> questionHistories) {
    final session = SessionService();
    if (session.currentUser == null) {
      return;
    }
    int score = 0;
    for (QuestionHistory questionHistory in questionHistories) {
      if (session
          .currentQuiz!
          .questions[questionHistory.questionId]
          .choices[questionHistory.selectedChoiceId]
          .isCorrect) {
        score += 1;
      }
    }
    _submissionRepository.create(
      Submission(
        userId: session.currentUser!.id,
        quizId: session.currentQuiz!.id,
        questionHistories: questionHistories,
        score: score,
      ),
    );
  }

  List<Submission> getSubmissions() {
    return _submissionRepository.loadAll();
  }
}
