import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  _goToPracticeScreen(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Practice'));
    await tester.pumpAndSettle();
  }

  testWidgets(
      'check for practice instruction screen showing in practice menu on icon click',
      (WidgetTester tester) async {
    await _goToPracticeScreen(tester);
    await tester.tap(find.byIcon(Icons.help_outline));
    await tester.pumpAndSettle();
    expect(find.byType(Overlay), findsOneWidget);
    expect(find.text('Practice Your Skills!'), findsOneWidget);
  });

  testWidgets(
      'check for play along instructions being shown on icon click in the play along screen',
      (WidgetTester tester) async {
    await _goToPracticeScreen(tester);
    await tester.tap(find.text('Play along'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.help_outline));
    await tester.pumpAndSettle();
    expect(find.byType(Overlay), findsOneWidget);
    expect(find.text('Play Along Mode'), findsOneWidget);
  });

  testWidgets(
      'check for speedrun instructions being shown on icon click in the play along screen',
      (WidgetTester tester) async {
    await _goToPracticeScreen(tester);
    await tester.tap(find.text('Speedrun'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.help_outline));
    await tester.pumpAndSettle();
    expect(find.byType(Overlay), findsOneWidget);
    expect(find.text('Speedrun Mode'), findsOneWidget);
  });

  testWidgets(
      'check for quiz instructions being shown on icon click in the play along screen',
      (WidgetTester tester) async {
    await _goToPracticeScreen(tester);
    await tester.tap(find.text('Take a Quiz'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.help_outline));
    await tester.pumpAndSettle();
    expect(find.byType(Overlay), findsOneWidget);
    expect(find.text('Quiz Mode'), findsOneWidget);
  });

  testWidgets(
      'check practice instruction pop-up closes when exit button is pressed',
      (WidgetTester tester) async {
    await _goToPracticeScreen(tester);
    await tester.tap(find.byIcon(Icons.help_outline));
    await tester.pumpAndSettle();
    expect(find.byType(Overlay), findsOneWidget);
    expect(find.text('Practice Your Skills!'), findsOneWidget);
    await tester.tap(find.text('Exit'));
    await tester.pumpAndSettle();
    expect(find.text('Practice Your Skills!'), findsNothing);
  });

  testWidgets(
      'check play along instruction pop-up closes when exit button is pressed',
      (WidgetTester tester) async {
    await _goToPracticeScreen(tester);
    await tester.tap(find.text('Play along'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.help_outline));
    await tester.pumpAndSettle();
    expect(find.byType(Overlay), findsOneWidget);
    expect(find.text('Play Along Mode'), findsOneWidget);
    await tester.tap(find.text('Exit'));
    await tester.pumpAndSettle();
    expect(find.text('Play Along Mode'), findsNothing);
  });

  testWidgets(
      'check speed-run instruction pop-up closes when exit button is pressed',
      (WidgetTester tester) async {
    await _goToPracticeScreen(tester);
    await tester.tap(find.text('Speedrun'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.help_outline));
    await tester.pumpAndSettle();
    expect(find.byType(Overlay), findsOneWidget);
    expect(find.text('Speedrun Mode'), findsOneWidget);
    await tester.tap(find.text('Exit'));
    await tester.pumpAndSettle();
    expect(find.text('Speedrun Mode'), findsNothing);
  });

  testWidgets(
      'check quiz instruction pop-up closes when exit button is pressed',
      (WidgetTester tester) async {
    await _goToPracticeScreen(tester);
    await tester.tap(find.text('Take a Quiz'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.help_outline));
    await tester.pumpAndSettle();
    expect(find.byType(Overlay), findsOneWidget);
    expect(find.text('Quiz Mode'), findsOneWidget);
    await tester.tap(find.text('Exit'));
    await tester.pumpAndSettle();
    expect(find.text('Quiz Mode'), findsNothing);
  });
}
