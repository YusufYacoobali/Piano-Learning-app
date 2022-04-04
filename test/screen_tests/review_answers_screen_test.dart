import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/sheet_music_components/note.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_brain.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import 'package:sight_reading_app/screens/review_answers_screen.dart';

void main() {
  QuestionBrain _setQuestionBrainWithoutAnswers() {
    List<Question> mockQuestions = [
      Question(
        clef: Clef.treble,
        question: 'What note is this?',
        correctAnswer: Note(name: 'C4', duration: 4),
        questionID: 1,
        lessonID: 1,
      ),
      Question(
        clef: Clef.treble,
        question: 'What note is this?',
        correctAnswer: Note(name: 'D4', duration: 4),
        questionID: 2,
        lessonID: 1,
      ),
    ];
    QuestionBrain mockQuestionBrain = QuestionBrain(questions: mockQuestions);
    return mockQuestionBrain;
  }

  QuestionBrain _setQuestionBrain() {
    QuestionBrain mockQuestionBrain = _setQuestionBrainWithoutAnswers();
    mockQuestionBrain.goBackToBeginning();
    mockQuestionBrain.setAnswer(userAnswer: 'C4');
    mockQuestionBrain.goToNextQuestion();
    mockQuestionBrain.setAnswer(userAnswer: 'E4');
    return mockQuestionBrain;
  }

  testWidgets('Check that the review answers screen is being displayed',
      (WidgetTester tester) async {
    QuestionBrain testQuestionBrain = _setQuestionBrain();
    await tester.pumpWidget(
      MaterialApp(
        home: ResultsScreen(
            title: "Congratulations!",
            score: 0.5,
            questionBrain: testQuestionBrain),
      ),
    );
    await tester.tap(find.text('Review Answers'));
    await tester.pumpAndSettle();
    expect(find.text('Review Answers'), findsOneWidget);
  });

  testWidgets(
      'Check that a message is displayed when user did not answer any questions',
      (WidgetTester tester) async {
    QuestionBrain testQuestionBrain = _setQuestionBrainWithoutAnswers();
    await tester.pumpWidget(
      MaterialApp(
        home: ReviewAnswersScreen(questionBrain: testQuestionBrain),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('You did not answer any questions'), findsOneWidget);
  });

  testWidgets('Check that all result cards are generated',
      (WidgetTester tester) async {
    QuestionBrain testQuestionBrain = _setQuestionBrain();
    await tester.pumpWidget(
      MaterialApp(
        home: ReviewAnswersScreen(questionBrain: testQuestionBrain),
      ),
    );
    await tester.pumpAndSettle();

    // Tests every card.
    for (Key resultCardKey in resultCardKeys) {
      // Scrolls the screen to reach the desired widget.
      await tester.scrollUntilVisible(
        find.byKey(resultCardKey),
        500.0,
        scrollable: find.byType(Scrollable),
      );
      expect(find.byKey(resultCardKey), findsOneWidget);
    }
  });

  testWidgets('Check that a result card has question number accurate',
      (WidgetTester tester) async {
    QuestionBrain testQuestionBrain = _setQuestionBrain();
    await tester.pumpWidget(
      MaterialApp(
        home: ReviewAnswersScreen(questionBrain: testQuestionBrain),
      ),
    );
    await tester.pumpAndSettle();

    // Tests every card.
    for (Key resultCardKey in resultCardKeys) {
      // Scrolls the screen to reach the desired widget.
      await tester.scrollUntilVisible(
        find.byKey(resultCardKey),
        500.0,
        scrollable: find.byType(Scrollable),
      );
      expect(find.byKey(resultCardKey), findsOneWidget);
    }
  });

  testWidgets(
      'Check that result box will display correct if a user answers correctly',
      (WidgetTester tester) async {
    QuestionBrain testQuestionBrain = _setQuestionBrain();
    await tester.pumpWidget(
      MaterialApp(
        home: ReviewAnswersScreen(questionBrain: testQuestionBrain),
      ),
    );
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.byKey(resultCardKeys[0]),
      500.0,
      scrollable: find.byType(Scrollable),
    );
    expect(find.text('Correct'), findsOneWidget);
  });

  testWidgets(
      'Check that result box will display incorrect if a user answers incorrectly',
      (WidgetTester tester) async {
    QuestionBrain testQuestionBrain = _setQuestionBrain();
    await tester.pumpWidget(
      MaterialApp(
        home: ReviewAnswersScreen(questionBrain: testQuestionBrain),
      ),
    );
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.byKey(resultCardKeys[1]),
      500.0,
      scrollable: find.byType(Scrollable),
    );
    expect(find.text('Incorrect'), findsOneWidget);
  });

  testWidgets('Check that question number on result card is shown correctly',
      (WidgetTester tester) async {
    QuestionBrain testQuestionBrain = _setQuestionBrain();
    await tester.pumpWidget(
      MaterialApp(
        home: ReviewAnswersScreen(questionBrain: testQuestionBrain),
      ),
    );
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.byKey(resultCardKeys[0]),
      500.0,
      scrollable: find.byType(Scrollable),
    );
    testQuestionBrain.goBackToBeginning();
    expect(
        find.text(
            'Question ${testQuestionBrain.getQuestionNum()} of ${testQuestionBrain.getTotalNumberOfQuestions()}'),
        findsOneWidget);
  });

  testWidgets('Check that correct answer is shown correctly',
      (WidgetTester tester) async {
    QuestionBrain testQuestionBrain = _setQuestionBrain();
    await tester.pumpWidget(
      MaterialApp(
        home: ReviewAnswersScreen(questionBrain: testQuestionBrain),
      ),
    );
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.byKey(resultCardKeys[0]),
      500.0,
      scrollable: find.byType(Scrollable),
    );
    testQuestionBrain.goBackToBeginning();
    String correctAnswer = testQuestionBrain.getCorrectAnswerWithoutOctave();
    expect(find.text('Correct Answer: $correctAnswer'), findsOneWidget);
  });

  testWidgets('Check that user answer is shown correctly',
      (WidgetTester tester) async {
    QuestionBrain testQuestionBrain = _setQuestionBrain();
    await tester.pumpWidget(
      MaterialApp(
        home: ReviewAnswersScreen(questionBrain: testQuestionBrain),
      ),
    );
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.byKey(resultCardKeys[0]),
      500.0,
      scrollable: find.byType(Scrollable),
    );
    expect(find.text('Your Answer: C'), findsOneWidget);
  });
}
