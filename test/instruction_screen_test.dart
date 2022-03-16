import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sight_reading_app/components/instruction_pop_up_content/play_along_instructions.dart';
import 'package:sight_reading_app/components/instruction_pop_up_content/practice_menu_instructions.dart';
import 'package:sight_reading_app/components/instruction_pop_up_content/quiz_instructions.dart';
import 'package:sight_reading_app/components/instruction_pop_up_content/speedrun_menu_instructions.dart';
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
    expect(find.byType(PracticeMenuInstructions), findsOneWidget);
  });

  testWidgets(
      'check for play along instructions being shown on icon click in the play along screen',
      (WidgetTester tester) async {
    await _goToPracticeScreen(tester);
    await tester.tap(find.text('Play along'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.help_outline));
    await tester.pumpAndSettle();
    expect(find.byType(PlayAlongInstructions), findsOneWidget);
  });

  testWidgets(
      'check for speedrun instructions being shown on icon click in the play along screen',
      (WidgetTester tester) async {
    await _goToPracticeScreen(tester);
    await tester.tap(find.text('Speedrun'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.help_outline));
    await tester.pumpAndSettle();
    expect(find.byType(SpeedrunMenuInstructions), findsOneWidget);
  });

  testWidgets(
      'check for quiz instructions being shown on icon click in the play along screen',
      (WidgetTester tester) async {
    await _goToPracticeScreen(tester);
    await tester.tap(find.text('Take a Quiz'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.help_outline));
    await tester.pumpAndSettle();
    expect(find.byType(QuizInstructions), findsOneWidget);
  });
}
