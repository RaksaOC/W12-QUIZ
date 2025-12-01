import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';
import 'package:quiz_app/ui/widgets/back_button.dart';
import 'package:quiz_app/ui/widgets/quiz_history_card.dart';

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
    return ListView(
      children: [
        AppBackButton(onPressed: onBack),
        ...submissions.map(
          (submission) => QuizHistoryCard(submission: submission),
        ),
      ],
    );
  }
}
