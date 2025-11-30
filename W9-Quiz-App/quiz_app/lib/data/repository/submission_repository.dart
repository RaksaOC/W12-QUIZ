import 'package:quiz_app/data/repository/repo_base.dart';
import 'package:quiz_app/model/quiz.dart';

class SubmissionRepository extends RepositoryBase<Submission> {
  SubmissionRepository() : super('submission.json', assetPath: 'lib/data/db/submission.json');

  @override
  Submission fromJson(Map<String, dynamic> json) {
    final historyJson = (json['questionHistories'] as List<dynamic>? ?? [])
        .map((history) => Map<String, dynamic>.from(history as Map))
        .toList();
    return Submission(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      quizId: json['quizId'] as int,
      questionHistories: historyJson
          .map(
            (history) => QuestionHistory(
              questionId: history['questionId'] as int,
              selectedChoiceId: history['selectedChoiceId'] as int,
            ),
          )
          .toList(),
      score: json['score'] as int,
    );
  }

  @override
  Map<String, dynamic> toJson(Submission entity) {
    return {
      'id': entity.id,
      'userId': entity.userId,
      'quizId': entity.quizId,
      'questionHistories': entity.questionHistories
          .map(
            (history) => {
              'questionId': history.questionId,
              'selectedChoiceId': history.selectedChoiceId,
            },
          )
          .toList(),
      'score': entity.score,
    };
  }
}
