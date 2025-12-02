import 'choices.dart';

class Question {
  final int id;
  final String title;
  final List<Choices> choices;

  Question({required this.id, required this.title, required this.choices});
}
