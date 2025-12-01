import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';
import 'package:quiz_app/service/session_service.dart';
import 'package:quiz_app/service/submission_service.dart';
import 'package:quiz_app/ui/screens/auth_screen.dart';
import 'package:quiz_app/ui/screens/question_screen.dart';
import 'package:quiz_app/ui/screens/quiz_screen.dart';
import 'package:quiz_app/ui/screens/result_screen.dart';
import 'package:quiz_app/ui/screens/history_screen.dart';
import 'package:quiz_app/ui/screens/welcome_screen.dart';
import 'package:quiz_app/ui/widgets/app_button.dart';

enum Pages {
  welcome('welcome', 'Welcome', Icons.home, Colors.blue),
  quiz('quiz', 'Quiz', Icons.quiz, Colors.green),
  question('question', 'Question', Icons.question_answer, Colors.yellow),
  result('result', 'Result', Icons.check_circle, Colors.green),
  history('history', 'History', Icons.history, Colors.blue),
  auth('auth', 'Log Out', Icons.lock, Colors.red);

  final String id;
  final String title;
  final IconData icon;
  final Color backgroundColor;
  const Pages(this.id, this.title, this.icon, this.backgroundColor);
}

class QuizApp extends StatefulWidget {
  final List<Quiz> quizzes;
  Pages currentPage;
  final SubmissionService submissionService = SubmissionService();
  final SessionService sessionService = SessionService();

  bool isLogInError = false;

  QuizApp({super.key, required this.quizzes, required this.currentPage});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  String getPageTitle(Pages page) {
    switch (page) {
      case Pages.welcome:
        return "AMAZON QUIZZES";
      case Pages.quiz:
        return "AMAZON QUIZZES";
      case Pages.question:
        return widget.sessionService.currentQuiz!.title;
      case Pages.result:
        return widget.sessionService.currentQuiz!.title + " Result";
      case Pages.history:
        return "History";
      case Pages.auth:
        return "Authentication";
      default:
        return "";
    }
  }

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
        widget.currentPage = Pages.welcome;
      });
    } else {
      setState(() {
        widget.currentPage = Pages.auth;
      });
    }
  }

  void handleNavigateToPage(String id) {
    setState(() {
      widget.currentPage = Pages.values.firstWhere((page) => page.id == id);
    });
  }

  void handleNavigateToPageWithQuizId(int quizId) {
    setState(() {
      widget.currentPage = Pages.question;
      widget.sessionService.currentQuiz = widget.quizzes.firstWhere(
        (quiz) => quiz.id == quizId,
      );
    });
  }

  void handleOnSubmit(List<QuestionHistory> questionHistories) {
    widget.submissionService.saveSubmission(questionHistories);
    setState(() {
      widget.currentPage = Pages.result;
    });
  }

  void handleBack(Pages page) {
    setState(() {
      widget.currentPage = page;
      widget.sessionService.currentQuiz = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            getPageTitle(widget.currentPage),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          centerTitle: false,
          actions: [
            if (widget.sessionService.isUserLoggedIn)
              IconButton(
                onPressed: () => {
                  widget.sessionService.logout(),
                  setState(() {
                    widget.currentPage = Pages.auth;
                  }),
                },
                icon: Icon(Icons.logout),
              ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: () {
            if (widget.isLogInError) {
              return Column(
                children: [
                  const Text("Invalid email or password"),
                  AppButton(
                    "Try Again",
                    onPressed: () => setState(() {
                      widget.isLogInError = false;
                    }),
                  ),
                ],
              );
            }
            switch (widget.currentPage) {
              case Pages.welcome:
                return WelcomeScreen(
                  pages: [Pages.quiz, Pages.history, Pages.auth],
                  onItemSelected: handleNavigateToPage,
                );
              case Pages.quiz:
                return QuizScreen(
                  quizzes: widget.quizzes,
                  onPressed: (quizId) => handleNavigateToPageWithQuizId(quizId),
                  onBack: () => handleBack(Pages.welcome),
                );
              case Pages.question:
                return QuestionScreen(
                  questions: widget.sessionService.currentQuiz!.questions,
                  onSubmit: (questionHistories) =>
                      handleOnSubmit(questionHistories),
                  onBack: () => handleBack(Pages.quiz),
                );
              case Pages.result:
                return ResultScreen(
                  result: widget.submissionService.getSubmissions().last,
                  onBack: () => handleBack(Pages.welcome),
                );
              case Pages.history:
                return HistoryScreen(
                  submissions: widget.submissionService.getSubmissions(),
                  onBack: () => handleBack(Pages.welcome),
                );
              case Pages.auth:
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
