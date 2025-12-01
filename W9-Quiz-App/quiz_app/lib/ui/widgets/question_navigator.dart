import 'package:flutter/material.dart';
import 'package:quiz_app/ui/screens/question_screen.dart';
import 'package:quiz_app/ui/widgets/app_button.dart';

class QuestionNavigator extends StatelessWidget {
  final int quizQuestionLength;
  final int currentQuestionIndex;
  final Function(MoveDirection) onMoveQuestion;
  const QuestionNavigator({
    super.key,
    required this.quizQuestionLength,
    required this.currentQuestionIndex,
    required this.onMoveQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        AppButton(
          icon: Icons.arrow_back,
          'Back',
          onPressed: () {
            if (currentQuestionIndex > 0) {
              onMoveQuestion(MoveDirection.previous);
            }
          },
        ),
        AppButton(
          icon: Icons.arrow_forward,
          currentQuestionIndex < quizQuestionLength - 1 ? 'Next' : 'Submit',
          onPressed: () {
            onMoveQuestion(MoveDirection.next);
          },
        ),
      ],
    );
  }
}
