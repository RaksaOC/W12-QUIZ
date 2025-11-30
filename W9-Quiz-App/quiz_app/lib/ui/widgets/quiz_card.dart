import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';

class QuizCard extends StatelessWidget {
  final Quiz quiz;
  final Function(int) onPressed;
  const QuizCard({super.key, required this.quiz, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onPressed: () => onPressed(quiz.id),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.quiz, size: 20),
          Text(
            quiz.title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
