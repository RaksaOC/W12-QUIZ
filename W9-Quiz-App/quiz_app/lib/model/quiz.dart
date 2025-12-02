// before refactor this file contains all models
// to prevent all files import changes use this file as all models exporter with the quiz definition inside

export 'choices.dart';
export 'question.dart';
export 'question_history.dart';
export 'submission.dart';
export 'user.dart';

import 'question.dart';

class Quiz {
  final int id;
  final String title;
  final List<Question> questions;
  final int timer;

  Quiz({
    required this.id,
    required this.questions,
    required this.title,
    required this.timer,
  });
}
