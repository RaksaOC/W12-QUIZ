import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';

class HistoryScreen extends StatelessWidget {
  final List<Submission> submissions;
  final VoidCallback onBack;
  const HistoryScreen({
    super.key,
    required this.submissions,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(onPressed: onBack, child: Icon(Icons.arrow_back)),
        Text("History Screen"),
        ...submissions.map((submission) => Text(submission.score.toString())),
        ...submissions.map(
          (submission) => Text(
            submission.questionHistories
                .map((questionHistory) => questionHistory.questionId)
                .join(", "),
          ),
        ),
        ...submissions.map(
          (submission) => Text(
            submission.questionHistories
                .map((questionHistory) => questionHistory.selectedChoiceId)
                .join(", "),
          ),
        ),
      ],
    );
  }
}
