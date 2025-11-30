import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';
import 'package:quiz_app/ui/widgets/back_button.dart';
import 'package:quiz_app/ui/widgets/question_card.dart';
import 'package:quiz_app/ui/widgets/question_navigator.dart';

enum MoveDirection { previous, next }

class QuestionScreen extends StatefulWidget {
  final List<Question> questions;
  List<QuestionHistory> questionHistories = [];
  int currentQuestionIndex = 0;
  Map<int, int> selectedChoiceIds = {};
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
  void handleChoiceClick(int questionId, int selectedChoiceId) {
    setState(() {
      widget.selectedChoiceIds[questionId] = selectedChoiceId;
      if (!widget.questionHistories.any(
        (history) => history.questionId == questionId,
      )) {
        widget.questionHistories.add(
          QuestionHistory(
            questionId: questionId,
            selectedChoiceId: selectedChoiceId,
          ),
        );
      } else {
        widget.questionHistories.removeWhere(
          (history) => history.questionId == questionId,
        );
        widget.questionHistories.add(
          QuestionHistory(
            questionId: questionId,
            selectedChoiceId: selectedChoiceId,
          ),
        );
      }
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
      spacing: 20,
      children: [
        AppBackButton(onPressed: widget.onBack),

        QuestionCard(
          question: widget.questions[widget.currentQuestionIndex],
          selectedChoiceId:
              widget.selectedChoiceIds.containsKey(
                widget.questions[widget.currentQuestionIndex].id,
              )
              ? widget.selectedChoiceIds[widget
                    .questions[widget.currentQuestionIndex]
                    .id]
              : null,
          onChoiceClicked: handleChoiceClick,
        ),
        QuestionNavigator(
          quizQuestionLength: widget.questions.length,
          currentQuestionIndex: widget.currentQuestionIndex,
          onMoveQuestion: handleMoveQuestion,
        ),
      ],
    );
  }
}
