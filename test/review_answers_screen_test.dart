import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
//mport 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/question_brain.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
//import 'package:sight_reading_app/screens/review_answers_screen.dart';
import 'package:sight_reading_app/questions.dart';

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
  // TODO: Test each lesson card to see if all contents are there
  // Test result
  // test correct answer
  // test user answer
  // TODO: Test that there are the exact amount of cards available according to number of questions

  // Check this to get the review answers screen

  // testWidgets('Check that the "Exit" button takes the user to the menu page',
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(
  //     const MaterialApp(
  //       home: ResultsScreen(title: "Congratulations!", score: 0.42),
  //     ),
  //   );
  //   await tester.tap(find.text('Exit'));
  //   await tester.pumpAndSettle();
  //   //expect(find.text('Read That Sheet'), findsOneWidget);
  //   expect(find.byType(MenuScreen), findsOneWidget);
  // });
}
