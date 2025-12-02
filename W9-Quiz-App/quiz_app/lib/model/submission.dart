import 'question_history.dart';

class Submission {
  int? id;
  int? userId;
  final int quizId;
  final List<QuestionHistory> questionHistories;
  final int score;

  Submission({
    this.id,
    this.userId,
    required this.quizId,
    required this.questionHistories,
    required this.score,
  });
}

