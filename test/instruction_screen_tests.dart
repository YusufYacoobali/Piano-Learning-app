import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';
import 'package:sight_reading_app/screens/instruction_screens/play_along_instruction_screen.dart';
import 'package:sight_reading_app/screens/instruction_screens/practice_instruction_screen.dart';
import 'package:sight_reading_app/screens/instruction_screens/quiz_instruction_screen.dart';
import 'package:sight_reading_app/screens/instruction_screens/speedrun_instructions_screen.dart';

void main() {
  _goToPracticeScreen(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Practice'));
    await tester.pumpAndSettle();
  }
  
  testWidgets('check for practice instruction screen showing in practice menu on icon click', 
      (WidgetTester tester) async {
    await _goToPracticeScreen(tester);
    await tester.tap(find.byIcon(Icons.help_outline));
    await tester.pumpAndSettle();
    expect(find.byType(PracticeInstructions), findsOneWidget);
      });
  
  testWidgets('check for play along instructions being shown on icon click in the play along screen',
      (WidgetTester tester) async{
    await _goToPracticeScreen(tester);
    await tester.tap(find.text('Play along'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.help_outline));
    await tester.pumpAndSettle();
    expect(find.byType(PlayAlongInstructions), findsOneWidget);
      });

  testWidgets('check for speedrun instructions being shown on icon click in the play along screen',
          (WidgetTester tester) async{
        await _goToPracticeScreen(tester);
        await tester.tap(find.text('Speedrun'));
        await tester.pumpAndSettle();
        await tester.tap(find.byIcon(Icons.help_outline));
        await tester.pumpAndSettle();
        expect(find.byType(SpeedrunInstructions), findsOneWidget);
      });

  testWidgets('check for quiz instructions being shown on icon click in the play along screen',
          (WidgetTester tester) async{
        await _goToPracticeScreen(tester);
        await tester.tap(find.text('Take a Quiz'));
        await tester.pumpAndSettle();
        await tester.tap(find.byIcon(Icons.help_outline));
        await tester.pumpAndSettle();
        expect(find.byType(QuizInstruction), findsOneWidget);
      });

  // testWidgets('check for endless instruction screen',
  //     (WidgetTester tester) async{
  //   await _goToPracticeScreen(tester);
  //   await tester.tap(find.text('Endless'));
  //   await tester.pumpAndSettle();
  //   expect(find.byType(EndlessInstructions), findsOneWidget);
  //     });
}