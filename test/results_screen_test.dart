import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';
import 'package:sight_reading_app/screens/results_screen.dart';

void main() {
  testWidgets('Check that the title is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ResultsScreen(title: "Congratulations!", score: 0.42),
      ),
    );
    expect(find.text("Congratulations!"), findsOneWidget);
  });

  testWidgets('Check that the score percentage is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ResultsScreen(title: "Congratulations!", score: 0.42),
      ),
    );
    expect(find.text('You got 42.0%'), findsOneWidget);
  });

  testWidgets(
      'Check that the tick icon is displayed when the score is high enough',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ResultsScreen(title: "Congratulations!", score: 0.42),
      ),
    );
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
  });

  testWidgets(
      'Check that the cross icon is displayed when the score below the pass threshold',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ResultsScreen(
            title: "Congratulations!", score: passThreshold - 0.01),
      ),
    );
    expect(find.byIcon(Icons.cancel), findsOneWidget);
  });

  testWidgets('Check that the "Exit" button is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ResultsScreen(title: "Congratulations!", score: 0.42),
      ),
    );
    expect(find.text('Exit'), findsOneWidget);
  });

  // TODO: Add test checking that pressing the "Exit" button takes the user back to the main menu screen

  testWidgets('Check that the "Review Answers" is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ResultsScreen(title: "Congratulations!", score: 0.42),
      ),
    );
    expect(find.text('Review Answers'), findsOneWidget);
  });

  // TODO: Add test for "Review Answers" functionality once implemented

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
