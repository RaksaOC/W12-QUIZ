import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';

class ResultScreen extends StatelessWidget {
  final Submission result;
  final VoidCallback onBack;
  const ResultScreen({super.key, required this.result, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(onPressed: onBack, child: Icon(Icons.arrow_back)),
        Text("Result Screen"),
        Text("Score: ${result.score}/ ${result.questionHistories.length}"),
        Text(
          "Question Histories: ${result.questionHistories.map((questionHistory) => questionHistory.questionId).join(", ")}",
        ),
      ],
    );
  }
}
