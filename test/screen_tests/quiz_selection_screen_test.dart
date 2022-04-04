import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/main.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';
import 'package:sight_reading_app/screens/practice_quiz_screen.dart';
import 'package:sight_reading_app/screens/practice_screen.dart';
import 'package:sight_reading_app/screens/quiz_selection_screen.dart';
import 'package:sight_reading_app/screens/random_quiz_screen.dart';
import 'package:sight_reading_app/screens/settings_screen.dart';
import 'package:sight_reading_app/components/app_bar_with_settings_icon.dart';

void main() {
  Future<void> _goToQuizSelectionScreen(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
    await tester.pumpAndSettle();
    await tester
        .tap(find.byKey(PracticeScreen.navigateToQuizSelectionButtonKey));
    await tester.pumpAndSettle();
  }

  testWidgets(
      'Check that the quiz selection page is displayed when the button to go to the screen is pressed.',
      (WidgetTester tester) async {
    await _goToQuizSelectionScreen(tester);
    expect(find.byType(QuizSelectionScreen), findsOneWidget);
  });

  testWidgets('Check that the instruction text is displayed.',
      (WidgetTester tester) async {
    await _goToQuizSelectionScreen(tester);
    expect(find.text('Choose a quiz:'), findsOneWidget);
  });

  testWidgets(
      'Check that the settings icon is present on the quiz selection screen.',
      (WidgetTester tester) async {
    await _goToQuizSelectionScreen(tester);
    expect(find.byKey(AppBarWithSettingsIcon.navigateToSettingsButtonKey),
        findsOneWidget);
  });

  testWidgets(
      'Check that the settings icon navigates to the settings screen once clicked.',
      (WidgetTester tester) async {
    await _goToQuizSelectionScreen(tester);
    await tester
        .tap(find.byKey(AppBarWithSettingsIcon.navigateToSettingsButtonKey));
    await tester.pumpAndSettle();
    expect(find.byType(SettingsScreen), findsOneWidget);
  });

  testWidgets('Check that all the ListView quiz buttons are generated',
      (WidgetTester tester) async {
    await _goToQuizSelectionScreen(tester);
    for (Key quizButtonKey in quizButtonKeys) {
      await tester.scrollUntilVisible(
        find.byKey(quizButtonKey),
        500.0,
        scrollable: find.byType(Scrollable),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(quizButtonKey), findsOneWidget);
    }
  });

  testWidgets('Check that the quiz buttons display the correct text',
      (WidgetTester tester) async {
    await _goToQuizSelectionScreen(tester);
    for (var i = 0; i < quizButtonKeys.length; i++) {
      await tester.scrollUntilVisible(
        find.byKey(quizButtonKeys[i]),
        500.0,
        scrollable: find.byType(Scrollable),
      );
      await tester.pumpAndSettle();
      expect(find.text(quizzes[i]), findsWidgets);
      expect(
          find.text(
              'Record: ${quizRecords[i]} / $numOfQuestionsInPracticeQuiz'),
          findsWidgets);
    }
  });

  testWidgets(
      'Check that clicking a quiz button navigates you to the quiz screen.',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await _goToQuizSelectionScreen(tester);
    await tester.tap(find.byKey(quizButtonKeys[0]));
    await tester.pumpAndSettle();
    expect(find.byType(PracticeQuizScreen), findsOneWidget);
  });

  testWidgets('Check that the ${"random quiz button"} is displayed on screen.',
      (WidgetTester tester) async {
    await _goToQuizSelectionScreen(tester);
    expect(find.byKey(randomQuizSelectedKey), findsOneWidget);
  });

  testWidgets(
      'Check that the ${"random quiz button"} displays the correct text',
      (WidgetTester tester) async {
    await _goToQuizSelectionScreen(tester);
    expect(find.text('Random mixed quiz'), findsOneWidget);
  });

  testWidgets('Check that scrolling does not move the random quiz button',
      (WidgetTester tester) async {
    await _goToQuizSelectionScreen(tester);
    final buttonFinder = find.byKey(randomQuizSelectedKey);
    final startPos = tester.getCenter(buttonFinder);
    final gesture = await tester.startGesture(const Offset(0, 300));
    await gesture.moveBy(const Offset(0, -300)); //Scrolls the screen
    await tester.pumpAndSettle();
    expect(
        startPos,
        equals(tester.getCenter(
            buttonFinder))); //Checks that the position of the button has not changed.
  });

  testWidgets(
      'Check that clicking the random quiz button navigates you to a random quiz screen.',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await _goToQuizSelectionScreen(tester);
    await tester.tap(find.byKey(randomQuizSelectedKey));
    await tester.pumpAndSettle();
    expect(find.byType(RandomQuizScreen), findsOneWidget);
  });
}
