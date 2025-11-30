import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  int? selectedChoiceId;
  final Function(int, int) onChoiceClicked;

  QuestionCard({
    super.key,
    required this.question,
    this.selectedChoiceId,
    required this.onChoiceClicked,
  });

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
          Text(
            '${question.title}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: question.choices
                .map(
                  (choice) => ElevatedButton(
                    onPressed: () {
                      onChoiceClicked(question.id, choice.id);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: selectedChoiceId == choice.id && selectedChoiceId != null
                          ? Colors.deepPurple
                          : Colors.grey.shade300,
                      foregroundColor: selectedChoiceId == choice.id && selectedChoiceId != null
                          ? Colors.white
                          : Colors.grey.shade800,
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    child: Text(
                      choice.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
