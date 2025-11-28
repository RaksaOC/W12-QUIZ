import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';

enum MoveDirection { previous, next }

class QuestionScreen extends StatefulWidget {
  final List<Question> questions;
  List<QuestionHistory> questionHistories = [];
  int currentQuestionIndex = 0;
  Function(List<QuestionHistory>) onSubmit;
  final VoidCallback onBack;
  QuestionScreen({
    super.key,
    required this.questions,
    required this.onSubmit,
    required this.onBack,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  void addQuestionHistory(int questionId, int selectedChoiceId) {
    setState(() {
      widget.questionHistories.add(
        QuestionHistory(
          questionId: questionId,
          selectedChoiceId: selectedChoiceId,
        ),
      );
    });
  }

  void handleMoveQuestion(MoveDirection direction) {
    setState(() {
      switch (direction) {
        case MoveDirection.previous:
          widget.currentQuestionIndex--;
          break;
        case MoveDirection.next:
          if (widget.currentQuestionIndex + 1 == widget.questions.length) {
            widget.onSubmit(widget.questionHistories);
            return;
          }
          widget.currentQuestionIndex++;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(onPressed: widget.onBack, child: Icon(Icons.arrow_back)),
        Text('Question ${widget.questions[widget.currentQuestionIndex].title}'),
        ...widget.questions[widget.currentQuestionIndex].choices.map(
          (choice) => ElevatedButton(
            onPressed: () {
              setState(() {
                addQuestionHistory(
                  widget.questions[widget.currentQuestionIndex].id,
                  choice.id,
                );
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: choice.isCorrect ? Colors.green : Colors.red,
              foregroundColor: choice.isCorrect ? Colors.white : Colors.white,
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: Text(choice.title),
          ),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                handleMoveQuestion(MoveDirection.previous);
              },
              child: Text('<'),
            ),
            ElevatedButton(
              onPressed: () {
                handleMoveQuestion(MoveDirection.next);
              },
              child: widget.currentQuestionIndex < widget.questions.length - 1
                  ? Text('>')
                  : Text('Submit'),
            ),
          ],
        ),
      ],
    );
  }
}
