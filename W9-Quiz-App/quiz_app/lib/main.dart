import 'package:flutter/material.dart';
import 'package:quiz_app/data/repository/quiz_repository.dart';
import 'package:quiz_app/data/repository/repo_base.dart';
import 'ui/quiz_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize documents directory for mobile platforms
  await RepositoryBase.initializeDocumentsDirectory();

  // 1 - Load the quiz data
  final quizRepository = QuizRepository();
  final quizzes = quizRepository.loadAll();

  // 2 - Display the quiz
  runApp(QuizApp(quizzes: quizzes, currentPage: QuizPage.auth));
}
