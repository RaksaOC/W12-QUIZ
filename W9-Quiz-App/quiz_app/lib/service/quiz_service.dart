import 'package:quiz_app/data/repository/quiz_repository.dart';
import 'package:quiz_app/model/quiz.dart';

class QuizService {
  final QuizRepository _quizRepository = QuizRepository();
  QuizService();

  Quiz getQuiz(int quizId) {
    return _quizRepository.loadAll().firstWhere((quiz) => quiz.id == quizId);
  }

  List<Quiz> getQuizzes() {
    return _quizRepository.loadAll();
  }
}
