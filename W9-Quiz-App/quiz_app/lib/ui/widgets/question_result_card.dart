import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';

class QuestionResultCard extends StatelessWidget {
  final Question question;
  int? selectedChoiceId;

  QuestionResultCard({
    super.key,
    required this.question,
    this.selectedChoiceId,
  });

  Color getChoiceColor(bool isCorrect) {
    if (isCorrect) {
      return Colors.green;
    } else {
      return Colors.red;
    }
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
          Text(
            '${question.title}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(), // to disable scroll
            children: question.choices
                .map(
                  (choice) => ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor:
                          selectedChoiceId == choice.id && choice.isCorrect
                          ? Colors.green
                          : selectedChoiceId == choice.id && !choice.isCorrect
                          ? Colors.red
                          : choice.isCorrect
                          ? Colors.green
                          : Colors.grey.shade300,
                      foregroundColor:
                          selectedChoiceId == choice.id && choice.isCorrect
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
