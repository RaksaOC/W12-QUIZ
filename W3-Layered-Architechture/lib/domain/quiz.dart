import 'package:uuid/uuid.dart';

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int points;

  Question({
    String? id,
    required this.title,
    required this.choices,
    required this.goodChoice,
    required this.points,
  }) : id = id ?? const Uuid().v4();

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as String,
      title: json['title'] as String,
      choices: List<String>.from(json['choices']),
      goodChoice: json['goodChoice'] as String,
      points: json['points'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'choices': choices,
      'goodChoice': goodChoice,
      'points': points,
    };
  }
}

class Answer {
  final String id;
  final String questionId;
  final String answerChoice;

  Answer({
    String? id,
    required this.questionId,
    required this.answerChoice,
  }) : id = id ?? const Uuid().v4();

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'] as String,
      questionId: json['questionId'] as String,
      answerChoice: json['answerChoice'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questionId': questionId,
      'answerChoice': answerChoice,
    };
  }

  bool isGood(Quiz quiz) {
    Question? question = quiz.getQuestionById(questionId);
    return question != null && answerChoice == question.goodChoice;
  }
}

class Quiz {
  final String id;
  List<Question> questions;

  Quiz({
    String? id,
    required this.questions,
  }) : id = id ?? const Uuid().v4();

  factory Quiz.fromJson(Map<String, dynamic> json) {
    var questionsJson = json['questions'] as List;
    var questions = questionsJson.map((q) => Question.fromJson(q)).toList();

    return Quiz(
      id: json['id'] as String,
      questions: questions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }

  Question? getQuestionById(String questionId) {
    try {
      return questions.firstWhere((q) => q.id == questionId);
    } catch (e) {
      return null;
    }
  }
}

class Session {
  final String id;
  String username;
  int scoreInPercentages;
  int scoreInPoints;
  List<Answer> answers = [];

  Session({
    String? id,
    required this.username,
    required this.scoreInPercentages,
    required this.scoreInPoints,
  }) : id = id ?? const Uuid().v4();

  factory Session.fromJson(Map<String, dynamic> json) {
    var answersJson = json['answers'] as List? ?? [];
    var answers = answersJson.map((a) => Answer.fromJson(a)).toList();

    return Session(
      id: json['id'] as String,
      username: json['username'] as String,
      scoreInPercentages: json['scoreInPercentages'] as int,
      scoreInPoints: json['scoreInPoints'] as int,
    )..answers = answers;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'scoreInPercentages': scoreInPercentages,
      'scoreInPoints': scoreInPoints,
      'answers': answers.map((a) => a.toJson()).toList(),
    };
  }

  void addAnswer(Answer answer) {
    answers.add(answer);
  }

  int getScoreInPercentage(Quiz quiz) {
    int totalScore = 0;
    for (Answer answer in answers) {
      if (answer.isGood(quiz)) {
        totalScore++;
      }
    }
    return quiz.questions.isNotEmpty
        ? ((totalScore / quiz.questions.length) * 100).toInt()
        : 0;
  }

  int getScoreInPoints(Quiz quiz) {
    int totalScore = 0;
    for (Answer answer in answers) {
      if (answer.isGood(quiz)) {
        Question? question = quiz.getQuestionById(answer.questionId);
        if (question != null) {
          totalScore += question.points;
        }
      }
    }
    return totalScore;
  }
}
