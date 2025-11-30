import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';
import 'package:quiz_app/ui/widgets/quiz_card.dart';
import 'package:quiz_app/ui/widgets/back_button.dart';

class QuizScreen extends StatelessWidget {
  final List<Quiz> quizzes;
  final Function(int) onPressed;
  final VoidCallback onBack;

  const QuizScreen({
    super.key,
    required this.onPressed,
    required this.quizzes,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBackButton(onPressed: onBack),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: quizzes
                .map(
                  (quiz) => QuizCard(
                    quiz: quiz,
                    onPressed: (quizId) => onPressed(quizId),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
