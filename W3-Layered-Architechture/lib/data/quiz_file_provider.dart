import 'dart:io';
import 'dart:convert';
import '../domain/quiz.dart';

class QuizRepository {
  final String filePath;

  QuizRepository(this.filePath);

  Quiz readQuiz() {
    final file = File(filePath);
    final content = file.readAsStringSync();
    final data = jsonDecode(content);

    return quizFromJson(data);
  }

  void writeQuiz(Quiz quiz) {
    final file = File(filePath);
    final encoder = JsonEncoder.withIndent('  ');
    final jsonString = encoder.convert(quizToJson(quiz));
    file.writeAsStringSync(jsonString);
  }

  Quiz quizFromJson(Map<String, dynamic> json) {
    var questionsJson = json['questions'] as List;
    var questions = questionsJson.map((q) => Question.fromJson(q)).toList();

    return Quiz(
      id: json['id'] as String,
      questions: questions,
    );
  }

  Map<String, dynamic> quizToJson(Quiz quiz) {
    return {
      'id': quiz.id,
      'questions': quiz.questions.map((q) => q.toJson()).toList(),
    };
  }
}

class SessionRepository {
  final String filePath;

  SessionRepository(this.filePath);

  List<Session> readSessions() {
    final file = File(filePath);
    if (!file.existsSync()) {
      return [];
    }

    final content = file.readAsStringSync();
    final data = jsonDecode(content);

    if (data is List) {
      return data.map((sessionJson) => sessionFromJson(sessionJson)).toList();
    }
    return [];
  }

  void writeSessions(List<Session> sessions) {
    final file = File(filePath);
    final encoder = JsonEncoder.withIndent('  ');
    final jsonString =
        encoder.convert(sessions.map((s) => sessionToJson(s)).toList());
    file.writeAsStringSync(jsonString);
  }

  void addSession(Session session) {
    List<Session> sessions = readSessions();
    sessions.add(session);
    writeSessions(sessions);
  }

  Session sessionFromJson(Map<String, dynamic> json) {
    var answersJson = json['answers'] as List? ?? [];
    var answers = answersJson.map((a) => Answer.fromJson(a)).toList();

    return Session(
      id: json['id'] as String,
      username: json['username'] as String,
      scoreInPercentages: json['scoreInPercentages'] as int,
      scoreInPoints: json['scoreInPoints'] as int,
    )..answers = answers;
  }

  Map<String, dynamic> sessionToJson(Session session) {
    return {
      'id': session.id,
      'username': session.username,
      'scoreInPercentages': session.scoreInPercentages,
      'scoreInPoints': session.scoreInPoints,
      'answers': session.answers.map((a) => a.toJson()).toList(),
    };
  }
}
