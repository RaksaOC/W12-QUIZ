import 'dart:io';
import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import 'data/quiz_file_provider.dart';

void main() {
  createSampleQuizFile();

  QuizRepository quizRepository = QuizRepository('data/quiz_data.json');
  SessionRepository sessionRepository = SessionRepository('data/sessions.json');

  Quiz quiz = quizRepository.readQuiz();
  List<Session> sessions = sessionRepository.readSessions();

  while (true) {
    Quiz currentQuiz = Quiz(questions: quiz.questions);
    QuizConsole console = QuizConsole(
      quiz: currentQuiz,
      sessions: sessions,
      isFinished: false,
    );
    console.startQuiz();

    if (sessions.isNotEmpty) {
      sessionRepository.writeSessions(sessions);
    }
  }
}

void createSampleQuizFile() {
  List<Question> questions = [
    Question(
      title: "Capital of France?",
      choices: ["Paris", "London", "Rome"],
      goodChoice: "Paris",
      points: 10,
    ),
    Question(
      title: "2 + 2 = ?",
      choices: ["2", "4", "5"],
      goodChoice: "4",
      points: 10,
    ),
  ];

  Quiz sampleQuiz = Quiz(questions: questions);
  QuizRepository repository = QuizRepository('data/quiz_data.json');

  if (!File('data/quiz_data.json').existsSync()) {
    repository.writeQuiz(sampleQuiz);
  }
}
