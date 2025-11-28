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

class Question {
  final int id;
  final String title;
  final List<Choices> choices;

  Question({required this.id, required this.title, required this.choices});
}

class QuestionHistory {
  final int questionId;
  final int selectedChoiceId;

  QuestionHistory({required this.questionId, required this.selectedChoiceId});
}

class Choices {
  final int id;
  final String title;
  final bool isCorrect;

  Choices({required this.id, required this.title, required this.isCorrect});
}

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

class User {
  final int id;
  final String name;
  final String email;
  final String password;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });
}
