import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

// AI HELPED GENRATE NAMES AND CONTENT
main() {
  test('Testing the quiz with ID-based references', () {
    Question question1 = Question(
      title: 'What is 1 + 1?',
      choices: ['1', '2', '3'],
      goodChoice: '2',
      points: 10,
    );
    Question question2 = Question(
      title: 'What is 2 + 2?',
      choices: ['2', '4', '6'],
      goodChoice: '4',
      points: 20,
    );

    Quiz quiz = Quiz(questions: [question1, question2]);
    Session session = Session(
      username: 'TestUser',
      scoreInPercentages: 0,
      scoreInPoints: 0,
    );

    Answer answer1 = Answer(questionId: question1.id, answerChoice: '2');
    Answer answer2 = Answer(questionId: question2.id, answerChoice: '4');

    session.addAnswer(answer1);
    session.addAnswer(answer2);

    int percentageScore = session.getScoreInPercentage(quiz);
    int pointsScore = session.getScoreInPoints(quiz);

    expect(percentageScore, equals(100));
    expect(pointsScore, equals(30));
  });

  test('Testing question retrieval by ID', () {
    Question question1 = Question(
      title: 'Test question',
      choices: ['A', 'B', 'C'],
      goodChoice: 'A',
      points: 10,
    );

    Quiz quiz = Quiz(questions: [question1]);

    Question? retrievedQuestion = quiz.getQuestionById(question1.id);
    expect(retrievedQuestion, isNotNull);
    expect(retrievedQuestion!.title, equals('Test question'));

    Question? nonExistentQuestion = quiz.getQuestionById('non-existent-id');
    expect(nonExistentQuestion, isNull);
  });

  test('Testing JSON serialization and deserialization', () {
    Question question1 = Question(
      title: 'Test question',
      choices: ['A', 'B', 'C'],
      goodChoice: 'A',
      points: 10,
    );

    Quiz originalQuiz = Quiz(questions: [question1]);
    Session originalSession = Session(
      username: 'TestUser',
      scoreInPercentages: 0,
      scoreInPoints: 0,
    );
    Answer answer1 = Answer(questionId: question1.id, answerChoice: 'A');
    originalSession.addAnswer(answer1);

    Map<String, dynamic> quizJson = originalQuiz.toJson();
    Map<String, dynamic> sessionJson = originalSession.toJson();

    Quiz deserializedQuiz = Quiz.fromJson(quizJson);
    Session deserializedSession = Session.fromJson(sessionJson);

    expect(deserializedQuiz.questions.length, equals(1));
    expect(deserializedQuiz.questions[0].title, equals('Test question'));
    expect(deserializedSession.answers.length, equals(1));
    expect(deserializedSession.answers[0].answerChoice, equals('A'));
    expect(deserializedSession.getScoreInPercentage(deserializedQuiz),
        equals(100));
  });
}
