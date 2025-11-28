import 'package:quiz_app/data/repository/repo_base.dart';
import 'package:quiz_app/model/quiz.dart';

class QuizRepository extends RepositoryBase<Quiz> {
  QuizRepository() : super('quiz.json');

  @override
  Quiz fromJson(Map<String, dynamic> json) {
    final questionsJson = (json['questions'] as List<dynamic>? ?? [])
        .map((question) => Map<String, dynamic>.from(question as Map))
        .toList();
    return Quiz(
      id: json['id'] as int,
      title: json['title'] as String,
      timer: json['timer'] as int,
      questions: questionsJson.map((questionJson) {
        final choicesJson = (questionJson['choices'] as List<dynamic>? ?? [])
            .map((choice) => Map<String, dynamic>.from(choice as Map))
            .toList();
        return Question(
          id: questionJson['id'] as int,
          title: questionJson['title'] as String,
          choices: choicesJson
              .map(
                (choiceJson) => Choices(
                  id: choiceJson['id'] as int,
                  title: choiceJson['title'] as String,
                  isCorrect: choiceJson['isCorrect'] as bool,
                ),
              )
              .toList(),
        );
      }).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson(Quiz entity) {
    return {
      'id': entity.id,
      'title': entity.title,
      'timer': entity.timer,
      'questions': entity.questions
          .map(
            (question) => {
              'id': question.id,
              'title': question.title,
              'choices': question.choices
                  .map(
                    (choice) => {
                      'id': choice.id,
                      'title': choice.title,
                      'isCorrect': choice.isCorrect,
                    },
                  )
                  .toList(),
            },
          )
          .toList(),
    };
  }
}
