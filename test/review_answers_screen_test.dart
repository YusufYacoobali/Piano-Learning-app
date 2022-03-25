import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
//import 'package:sight_reading_app/lessons_and_quizzes/question_finder.dart';
//mport 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/question_brain.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
//import 'package:sight_reading_app/screens/review_answers_screen.dart';
import 'package:sight_reading_app/questions.dart';
//import 'package:sight_reading_app/screens/review_answers_screen.dart';

void main() {
  testWidgets('Check that the review answers screen is being displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ResultsScreen(
            title: "Congratulations!",
            score: 0.42,
            questionBrain: QuestionBrain(questions: questions)),
      ),
    );
    await tester.tap(find.text('Review Answers'));
    await tester.pumpAndSettle();
    expect(find.text('Review Answers'), findsOneWidget);
  });

  /*testWidgets('Check that all result cards are generated',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ResultsScreen(
            title: "Congratulations!",
            score: 0.42,
            questionBrain: QuestionBrain(questions: questions)),
      ),
    );
    await tester.tap(find.text('Review Answers'));
    await tester.pumpAndSettle();

    // Tests every button.
    for (Key resultCardKey in resultCardKeys) {
      // Scrolls the screen to reach the desired widget.
      await tester.scrollUntilVisible(
        find.byKey(resultCardKey),
        500.0,
        scrollable: find.byType(Scrollable),
      );
      expect(find.byKey(resultCardKey), findsOneWidget);
    }
  });*/
  // TODO: Test each lesson card to see if all contents are there
  // Test result
  // test correct answer
  // test user answer
  // TODO: Test that there are the exact amount of cards available according to number of questions
}
