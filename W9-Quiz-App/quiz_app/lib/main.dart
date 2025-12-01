import 'package:flutter/material.dart';
import 'package:quiz_app/data/repository/quiz_repository.dart';
import 'package:quiz_app/data/repository/submission_repository.dart';
import 'package:quiz_app/data/repository/users_repository.dart';
import 'package:quiz_app/data/repository/repo_base.dart';
import 'ui/quiz_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize documents directory for mobile platforms
  await RepositoryBase.initializeDocumentsDirectory();

  await RepositoryBase.clearFile('submission.json');
  await RepositoryBase.clearFile('users.json');
  await RepositoryBase.clearFile('quiz.json');

  // Initialize asset data (copy from bundle to documents directory)
  final usersRepository = UsersRepository();
  await usersRepository.initializeAsset();

  final quizRepository = QuizRepository();
  await quizRepository.initializeAsset();

  final submissionRepository = SubmissionRepository();
  await submissionRepository.initializeAsset();

  // 1 - Load the quiz data
  final quizzes = quizRepository.loadAll();

  // 2 - Display the quiz
  runApp(QuizApp(quizzes: quizzes, currentPage: Pages.auth));
}
