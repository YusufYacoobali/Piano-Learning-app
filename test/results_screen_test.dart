import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
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
      'Check that the tick icon is displayed when the score is high enough',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ResultsScreen(title: "Congratulations!", score: 0.24),
      ),
    );
    expect(find.byIcon(Icons.cancel), findsOneWidget);
  });
}
