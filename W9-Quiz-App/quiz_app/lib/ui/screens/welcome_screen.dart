import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';

class WelcomeScreen extends StatelessWidget {
  final List<Quiz> quizzes;
  final Function(int) onPressed;

  const WelcomeScreen({
    super.key,
    required this.onPressed,
    required this.quizzes,
  });

  Widget getButtons() {
    return Column(
      children: quizzes
          .map(
            (quiz) => Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: Center(
                child: TextButton(
                  onPressed: () => onPressed(quiz.id),
                  child: Text(quiz.title.toString()),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('AMAZON Quizzes!!!'),
        Text("SELECT A QUIZ!!"),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: getButtons(),
        ),
      ],
    );
  }
}
