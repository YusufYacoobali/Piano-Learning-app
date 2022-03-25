import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/sheet_music_components/note.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_brain.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import 'package:sight_reading_app/screens/review_answers_screen.dart';

void main() {
  QuestionBrain setQuestionBrain() {
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
    mockQuestionBrain.goBackToBeginning();
    mockQuestionBrain.setAnswer(userAnswer: 'C4');
    mockQuestionBrain.goToNextQuestion();
    mockQuestionBrain.setAnswer(userAnswer: 'C4');
    return mockQuestionBrain;
  }

  testWidgets('Check that the review answers screen is being displayed',
      (WidgetTester tester) async {
    QuestionBrain testQuestionBrain = setQuestionBrain();
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

  testWidgets('Check that all result cards are generated',
      (WidgetTester tester) async {
    QuestionBrain testQuestionBrain = setQuestionBrain();
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
    QuestionBrain testQuestionBrain = setQuestionBrain();
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
  // TODO: Test each lesson card to see if all contents are there
  // Test result
  // test correct answer
  // test user answer
  // TODO: Test that there are the exact amount of cards available according to number of questions
}
