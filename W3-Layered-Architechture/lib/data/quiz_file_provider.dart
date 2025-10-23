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

    return Quiz.fromJson(data);
  }

  void writeQuiz(Quiz quiz) {
    final file = File(filePath);
    final encoder = JsonEncoder.withIndent('  ');
    final jsonString = encoder.convert(quiz.toJson());
    file.writeAsStringSync(jsonString);
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
      return data.map((sessionJson) => Session.fromJson(sessionJson)).toList();
    }
    return [];
  }

  void writeSessions(List<Session> sessions) {
    final file = File(filePath);
    final encoder = JsonEncoder.withIndent('  ');
    final jsonString =
        encoder.convert(sessions.map((s) => s.toJson()).toList());
    file.writeAsStringSync(jsonString);
  }

  void addSession(Session session) {
    List<Session> sessions = readSessions();
    sessions.add(session);
    writeSessions(sessions);
  }
}
