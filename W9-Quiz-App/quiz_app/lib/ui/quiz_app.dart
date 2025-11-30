import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';
import 'package:quiz_app/service/session_service.dart';
import 'package:quiz_app/service/submission_service.dart';
import 'package:quiz_app/ui/screens/auth_screen.dart';
import 'package:quiz_app/ui/screens/question_screen.dart';
import 'package:quiz_app/ui/screens/result_screen.dart';
import 'package:quiz_app/ui/screens/history_screen.dart';
import 'package:quiz_app/ui/screens/welcome_screen.dart';

enum QuizPage { welcome, quiz, result, history, auth }

class QuizApp extends StatefulWidget {
  final List<Quiz> quizzes;
  QuizPage currentPage;
  int currentQuizId = 0;
  final SubmissionService submissionService = SubmissionService();
  final SessionService sessionService = SessionService();

  bool isLogInError = false;

  QuizApp({super.key, required this.quizzes, required this.currentPage});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  void handleAppLogIn(String email, String password) {
    final User? user = widget.sessionService.loginUser(email, password);
    if (user == null) {
      setState(() {
        widget.isLogInError = true;
      });
      return;
    }
    if (widget.sessionService.isUserLoggedIn) {
      setState(() {
        widget.currentPage = QuizPage.welcome;
      });
    } else {
      setState(() {
        widget.currentPage = QuizPage.auth;
      });
    }
  }

  void handleNavigateToQuestion(int id) {
    setState(() {
      widget.currentPage = QuizPage.quiz;
      widget.currentQuizId = id;
    });
  }

  void handleOnSubmit(List<QuestionHistory> questionHistories) {
    int score = 0;
    for (QuestionHistory questionHistory in questionHistories) {
      if (widget
          .quizzes[widget.currentQuizId]
          .questions[questionHistory.questionId]
          .choices[questionHistory.selectedChoiceId]
          .isCorrect) {
        score += 1;
      }
    }
    Submission submission = Submission(
      // will change to optional with proper dto
      quizId: widget.currentQuizId,
      questionHistories: questionHistories,
      score: score,
    );
    widget.submissionService.saveSubmission(submission);
    setState(() {
      widget.currentPage = QuizPage.result;
    });
  }

  void handleBack() {
    setState(() {
      widget.currentPage = QuizPage.welcome;
      widget.currentQuizId = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.sessionService.isUserLoggedIn
                ? "Quiz App"
                : "Authentication",
          ),
          actions: [
            if (widget.sessionService.isUserLoggedIn)
              IconButton(
                onPressed: () => {
                  widget.sessionService.logout(),
                  setState(() {
                    widget.currentPage = QuizPage.auth;
                  }),
                },
                icon: Icon(Icons.logout),
              ),
          ],
        ),
        body: Center(
          child: () {
            if (widget.isLogInError) {
              return Column(
                children: [
                  const Text("Invalid email or password"),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.isLogInError = false;
                      });
                    },
                    child: const Text("Try again"),
                  ),
                ],
              );
            }
            switch (widget.currentPage) {
              case QuizPage.welcome:
                return WelcomeScreen(
                  quizzes: widget.quizzes,
                  onPressed: handleNavigateToQuestion,
                );
              case QuizPage.quiz:
                return QuestionScreen(
                  questions: widget.quizzes[widget.currentQuizId].questions,
                  onSubmit: (questionHistories) =>
                      handleOnSubmit(questionHistories),
                  onBack: handleBack,
                );
              case QuizPage.result:
                return ResultScreen(
                  result: widget.submissionService.getSubmissions().last,
                  onBack: handleBack,
                );
              case QuizPage.history:
                return HistoryScreen(
                  submissions: widget.submissionService.getSubmissions(),
                  onBack: handleBack,
                );
              case QuizPage.auth:
                return AuthScreen(onLogIn: handleAppLogIn);
              default:
                return const SizedBox();
            }
          }(),
        ),
      ),
    );
  }
}
