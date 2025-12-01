import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';
import 'package:quiz_app/service/quiz_service.dart';
import 'package:quiz_app/service/submission_service.dart';
import 'package:quiz_app/ui/widgets/back_button.dart';
import 'package:quiz_app/ui/widgets/question_result_card.dart';

class ResultScreen extends StatelessWidget {
  final Submission result;
  final VoidCallback onBack;
  const ResultScreen({super.key, required this.result, required this.onBack});

  Question? getQuestion(int questionId) {
    final QuizService quizService = QuizService();

    final List<Quiz> quizzes = quizService.getQuizzes();
    return quizzes
        .firstWhere((quiz) => quiz.id == result.quizId)
        .questions
        .firstWhere((question) => question.id == questionId);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AppBackButton(onPressed: onBack),
        Column(
          spacing: 20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Result',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Score: ${result.score}/ ${result.questionHistories.length}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ...result.questionHistories.map(
              (questionHistory) => QuestionResultCard(
                question: getQuestion(questionHistory.questionId)!,
                selectedChoiceId: questionHistory.selectedChoiceId,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
