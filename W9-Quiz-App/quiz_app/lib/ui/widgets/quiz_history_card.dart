import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';
import 'package:quiz_app/service/quiz_service.dart';
import 'package:quiz_app/ui/widgets/question_result_card.dart';

class QuizHistoryCard extends StatelessWidget {
  final Submission submission;
  const QuizHistoryCard({super.key, required this.submission});

  Question? getQuestion(int questionId) {
    final QuizService quizService = QuizService();

    final List<Quiz> quizzes = quizService.getQuizzes();
    return quizzes
        .firstWhere((quiz) => quiz.id == submission.quizId)
        .questions
        .firstWhere((question) => question.id == questionId);
  }

  Quiz? getQuiz(int quizId) {
    final QuizService quizService = QuizService();
    return quizService.getQuiz(quizId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${getQuiz(submission.quizId)!.title}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                "Score: ${submission.score}/ ${submission.questionHistories.length}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          ...submission.questionHistories.map(
            (questionHistory) => QuestionResultCard(
              question: getQuestion(questionHistory.questionId)!,
              selectedChoiceId: questionHistory.selectedChoiceId,
            ),
          ),
        ],
      ),
    );
  }
}
