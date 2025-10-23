import 'dart:io';
import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;
  List<Session> sessions;
  bool isFinished;

  QuizConsole({
    required this.quiz,
    required this.sessions,
    required this.isFinished,
  });

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');
    stdout.write('Enter your name: ');
    String? username = stdin.readLineSync();
    if (username == null || username.trim().isEmpty) {
      finishQuiz();
      return;
    }

    Session currentSession = Session(
      username: username,
      scoreInPercentages: 0,
      scoreInPoints: 0,
    );
    sessions.add(currentSession);

    for (var question in quiz.questions) {
      print('Question: ${question.title} - (${question.points} points)');
      print('Choices: ${question.choices}');
      stdout.write('Your answer: ');
      String? userInput = stdin.readLineSync();

      if (userInput != null && userInput.isNotEmpty) {
        Answer answer = Answer(
          questionId: question.id,
          answerChoice: userInput,
        );
        currentSession.addAnswer(answer);
      } else {
        print('No answer entered. Skipping question.');
      }
      print('');
    }

    int score = currentSession.getScoreInPercentage(quiz);
    int points = currentSession.getScoreInPoints(quiz);

    currentSession.scoreInPercentages = score;
    currentSession.scoreInPoints = points;
  }

  void finishQuiz() {
    print('--- Quiz Finished ---');
    for (int i = 0; i < sessions.length; i++) {
      print(
          '${sessions[i].username}, your score in percentage is ${sessions[i].scoreInPercentages}');
      print(
          '${sessions[i].username}, your score in points is ${sessions[i].scoreInPoints}');
    }
    exit(0);
  }
}
