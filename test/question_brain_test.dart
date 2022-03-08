import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_list.dart';
import 'package:sight_reading_app/question.dart';
import 'package:sight_reading_app/question_brain.dart';

void main() {
  QuestionList getFakeQuestions() {
    return QuestionList(lessonID: 1, questionList: [
      Question(
        image: 'Tr_MidC.jpeg',
        question:
            'This is our first note. The name is C (Do). Now press C in the option box.',
        correctAnswer: 'C',
      ),
      Question(
        image: 'Tr_D.jpeg',
        question:
            'This is our second note. The name is D (Re). Now press D in the option box.',
        correctAnswer: 'D',
      ),
      Question(
        image: 'Tr_E.jpeg',
        question:
            'This is our third note. The name is E (Mi). Now press E in the option box.',
        correctAnswer: 'E',
      ),
    ]);
  }

  test('Check that getImageName() correctly returns the name of the image', () {
    SharedPreferences.setMockInitialValues({});
    QuestionList fakeQuestions = getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    String imageName = qb.getImageName();
    expect(imageName, fakeQuestions.questionList[0].image);
  });

  test('Check that getImagePath() correctly returns the path of the image', () {
    SharedPreferences.setMockInitialValues({});
    QuestionList fakeQuestions = getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    String imagePath = qb.getImagePath();
    expect(
        imagePath, 'assets/note_images/${fakeQuestions.questionList[0].image}');
  });

  test('Check that getImage() correctly returns the image', () {
    SharedPreferences.setMockInitialValues({});
    QuestionList fakeQuestions = getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    AssetImage image = qb.getImage();
    expect(
        image,
        AssetImage(
            'assets/note_images/${fakeQuestions.questionList[0].image}'));
  });

  test('Check that getQuestionText() correctly returns the question text', () {
    SharedPreferences.setMockInitialValues({});
    QuestionList fakeQuestions = getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    String questionText = qb.getQuestionText();
    expect(questionText, fakeQuestions.questionList[0].question);
  });

  test(
      'Check that getCorrectAnswer() correctly returns the answer to the question',
      () {
    SharedPreferences.setMockInitialValues({});
    QuestionList fakeQuestions = getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    String answer = qb.getCorrectAnswer();
    expect(answer, fakeQuestions.questionList[0].correctAnswer);
  });

  test('Check that getQuestionNumber() correctly returns the question number',
      () {
    SharedPreferences.setMockInitialValues({});
    QuestionBrain qb = QuestionBrain(questions: getFakeQuestions());
    int questionNum = qb.getQuestionNum();
    expect(questionNum, 1);
  });

  test('Check that goToNextQuestion() correctly increments the question number',
      () {
    SharedPreferences.setMockInitialValues({});
    QuestionBrain qb = QuestionBrain(questions: getFakeQuestions());
    int beforeQuestionNum = qb.getQuestionNum();
    qb.goToNextQuestion();
    int afterQuestionNum = qb.getQuestionNum();
    expect(afterQuestionNum, beforeQuestionNum + 1);
  });

  test(
      'Check that goToNextQuestion() does not increment the question number if we are at the last question',
      () {
    SharedPreferences.setMockInitialValues({});
    QuestionList fakeQuestions = getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    for (int i = 0; i < fakeQuestions.questionList.length; ++i) {
      qb.goToNextQuestion();
    }
    int beforeQuestionNum = qb.getQuestionNum();
    qb.goToNextQuestion();
    int afterQuestionNum = qb.getQuestionNum();
    expect(beforeQuestionNum, afterQuestionNum);
  });

  test(
      'Check that getTotalNumberOfQuestions() correctly returns the total number of questions',
      () {
    SharedPreferences.setMockInitialValues({});
    QuestionList fakeQuestions = getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    int numOfQuestions = qb.getTotalNumberOfQuestions();
    expect(numOfQuestions, fakeQuestions.questionList.length);
  });

  test('Check that getScore() correctly starts at 0', () {
    SharedPreferences.setMockInitialValues({});
    QuestionBrain qb = QuestionBrain(questions: getFakeQuestions());
    int score = qb.getScore();
    expect(score, 0);
  });

  test(
      'Check that setAnswer() correctly increments the score if the answer is correct',
      () {
    SharedPreferences.setMockInitialValues({});
    QuestionList fakeQuestions = getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    int beforeScore = qb.getScore();
    qb.setAnswer(fakeQuestions.questionList[0].correctAnswer);
    int afterScore = qb.getScore();
    expect(afterScore, beforeScore + 1);
  });

  test(
      'Check that setAnswer() does not increment the score if the answer is incorrect',
      () {
    SharedPreferences.setMockInitialValues({});
    QuestionList fakeQuestions = getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    int beforeScore = qb.getScore();
    qb.setAnswer("H");
    int afterScore = qb.getScore();
    expect(afterScore, beforeScore);
  });

  test(
      'Check that checkAnswer() correctly returns true if the answer is correct',
      () {
    SharedPreferences.setMockInitialValues({});
    QuestionList fakeQuestions = getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    bool result = qb.checkAnswer(fakeQuestions.questionList[0].correctAnswer);
    expect(result, true);
  });

  test(
      'Check that checkAnswer() correctly returns false if the answer is incorrect',
      () {
    SharedPreferences.setMockInitialValues({});
    QuestionList fakeQuestions = getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    bool result = qb.checkAnswer("H");
    expect(result, false);
  });

  test(
      'Check that isLastQuestion() correctly returns true if we are at the last question',
      () {
    SharedPreferences.setMockInitialValues({});
    QuestionList fakeQuestions = getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    for (int i = 0; i < fakeQuestions.questionList.length; ++i) {
      qb.goToNextQuestion();
    }
    bool result = qb.isLastQuestion();
    expect(result, true);
  });

  test(
      'Check that isLastQuestion() correctly returns false if we are not at the last question',
      () {
    SharedPreferences.setMockInitialValues({});
    QuestionList fakeQuestions = getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    bool result = qb.isLastQuestion();
    expect(result, false);
  });

  test(
      'Check that when the quiz is completed with all answers correct, the score is saved to storage.',
      () async {
    SharedPreferences.setMockInitialValues({});
    final SharedPreferences pref = await SharedPreferences.getInstance();

    //make tester complete quiz
    QuestionBrain qb = QuestionBrain(questions: getFakeQuestions());

    // TODO: find a better way to deal with the IO delay
    await Future.delayed(const Duration(milliseconds: 1000));
    //before complete questions, check it is 0
    expect(pref.get('lesson 1'), '0');

    qb.setAnswer("C");
    qb.goToNextQuestion();
    qb.setAnswer("D");
    qb.goToNextQuestion();
    qb.setAnswer("E");

    // TODO: find a better way to deal with the IO delay
    await Future.delayed(const Duration(milliseconds: 1000));

    // after complete, check score is correct
    expect(pref.get('lesson 1'), '3');
  });

  test(
      'Check that when the quiz is completed with some answers correct, the score is saved to storage.',
      () async {
    SharedPreferences.setMockInitialValues({});
    final SharedPreferences pref = await SharedPreferences.getInstance();

    //make tester complete quiz
    QuestionBrain qb = QuestionBrain(questions: getFakeQuestions());

    // TODO: find a better way to deal with the IO delay
    await Future.delayed(const Duration(milliseconds: 1000));
    //before complete questions, check it is 0
    expect(pref.get('lesson 1'), '0');

    qb.setAnswer("C");
    qb.goToNextQuestion();
    qb.setAnswer("A");
    qb.goToNextQuestion();
    qb.setAnswer("E");

    // TODO: find a better way to deal with the IO delay
    await Future.delayed(const Duration(milliseconds: 1000));

    // after complete, check score is correct
    expect(pref.get('lesson 1'), '2');
  });

  test(
      'Check that when the quiz is completed with no answers correct, the score is saved to storage.',
      () async {
    SharedPreferences.setMockInitialValues({});
    final SharedPreferences pref = await SharedPreferences.getInstance();

    //make tester complete quiz
    QuestionBrain qb = QuestionBrain(questions: getFakeQuestions());

    // TODO: find a better way to deal with the IO delay
    await Future.delayed(const Duration(milliseconds: 1000));
    //before complete questions, check it is 0
    expect(pref.get('lesson 1'), '0');

    qb.setAnswer("H");
    qb.goToNextQuestion();
    qb.setAnswer("T");
    qb.goToNextQuestion();
    qb.setAnswer("W");

    // TODO: find a better way to deal with the IO delay
    await Future.delayed(const Duration(milliseconds: 1000));

    // after complete, check score is correct
    expect(pref.get('lesson 1'), '0');
  });

  // testWidgets('Check that changing the difficulty saves the correct value to storage.',
  //         (WidgetTester tester) async {
  //
  //       SharedPreferences.setMockInitialValues({});
  //       final SharedPreferences pref = await SharedPreferences.getInstance();
  //
  //       //make tester complete quiz
  //
  //       expect(pref.get('difficulty'), 'Beginner');
  //
  //       await tester.tap(find.byKey(const Key('difficulty selector')));
  //       await tester.pump();
  //       await tester.tap(find.text('Expert').last);
  //       await tester.pump();
  //
  //       expect(pref.get('difficulty'), 'Expert');
  //     });
  //
  // testWidgets('Check that changing the theme saves the correct value to storage.',
  //         (WidgetTester tester) async {
  //
  //       SharedPreferences.setMockInitialValues({});
  //       final SharedPreferences pref = await SharedPreferences.getInstance();
  //
  //       //make tester complete quiz
  //
  //       expect(pref.get('theme'), 'Dark');
  //
  //       // Check that the initial theme of the app is dark
  //       expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.dark);
  //
  //       await tester.tap(find.text('Dark'));
  //       await tester.pump();
  //       await tester.tap(find.text('Light').last);
  //       await tester.pumpAndSettle();
  //
  //       expect(pref.get('theme'), 'Light');
  //
  //       // Check that the theme has changed
  //       expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.light);
  //     });
  //
  // testWidgets('Check that resetting the settings sets their values to default.',
  //         (WidgetTester tester) async {
  //
  //       SharedPreferences.setMockInitialValues({});
  //       final SharedPreferences pref = await SharedPreferences.getInstance();
  //
  //       //make tester complete quiz
  //
  //       expect(pref.get('volume'), 100);
  //       expect(pref.get('difficulty'), 'Beginner');
  //       expect(pref.get('theme'), 'Dark');
  //
  //       // Check that the initial theme of the app is dark
  //       expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.dark);
  //
  //       await tester.drag(find.byType(Slider), const Offset(-100, 0));
  //       await tester.pump();
  //       await tester.tap(find.text('Beginner'));
  //       await tester.pump();
  //       await tester.tap(find.text('Expert').last);
  //       await tester.pump();
  //       await tester.tap(find.text('Dark'));
  //       await tester.pump();
  //       await tester.tap(find.text('Light').last);
  //       await tester.pumpAndSettle();
  //
  //       if (pref.get('volume') == 100) fail('The volume should not be 100');
  //       expect(pref.get('difficulty'), 'Expert');
  //       expect(pref.get('theme'), 'Light');
  //
  //       // Check that the theme changes
  //       expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.light);
  //
  //       await tester.tap(find.text('Reset Progress'));
  //       await tester.pump();
  //       await tester.tap(find.text('Confirm'));
  //       await tester.pumpAndSettle();
  //
  //       expect(pref.get('volume'), 100);
  //       expect(pref.get('difficulty'), 'Beginner');
  //       expect(pref.get('theme'), 'Dark');
  //
  //       // Check that the theme changes
  //       expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.dark);
  //     });
  //
  // testWidgets('Check that cancelling a reset keeps the values the same.',
  //         (WidgetTester tester) async {
  //
  //       SharedPreferences.setMockInitialValues({});
  //       final SharedPreferences pref = await SharedPreferences.getInstance();
  //
  //       //make tester complete quiz
  //
  //       expect(pref.get('volume'), 100);
  //       expect(pref.get('difficulty'), 'Beginner');
  //       expect(pref.get('theme'), 'Dark');
  //
  //       // Check that the initial theme of the app is dark
  //       expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.dark);
  //
  //       await tester.drag(find.byType(Slider), const Offset(-100, 0));
  //       await tester.pump();
  //       await tester.tap(find.text('Beginner'));
  //       await tester.pump();
  //       await tester.tap(find.text('Expert').last);
  //       await tester.pump();
  //       await tester.tap(find.text('Dark'));
  //       await tester.pump();
  //       await tester.tap(find.text('Light').last);
  //       await tester.pumpAndSettle();
  //
  //       if (pref.get('volume') == 100) fail('The volume should not be 100');
  //       expect(pref.get('difficulty'), 'Expert');
  //       expect(pref.get('theme'), 'Light');
  //
  //       // Check that the theme changes
  //       expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.light);
  //
  //       await tester.tap(find.text('Reset Progress'));
  //       await tester.pump();
  //       await tester.tap(find.text('Cancel'));
  //       await tester.pump();
  //
  //       if (pref.get('volume') == 100) fail('The volume should not be 100');
  //       expect(pref.get('difficulty'), 'Expert');
  //       expect(pref.get('theme'), 'Light');
  //
  //       // Check that the theme stays the same
  //       expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.light);
  //     });
  //
  // testWidgets('Check that loading settings from storage displays correctly.',
  //         (WidgetTester tester) async {
  //
  //       SharedPreferences.setMockInitialValues({'volume': 50, 'difficulty': 'Intermediate', 'theme': 'Light', });
  //       final SharedPreferences pref = await SharedPreferences.getInstance();
  //
  //       //make tester complete quiz
  //
  //       expect(pref.get('volume'), 50);
  //       expect(pref.get('difficulty'), 'Intermediate');
  //       expect(pref.get('theme'), 'Light');
  //
  //       // Check that the initial theme of the app is light
  //       expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.light);
  //
  //       expect(find.text('50'), findsOneWidget);
  //       expect(find.text('Dark'), findsOneWidget);
  //       expect(find.text('Intermediate'), findsOneWidget);
  //     });
}
