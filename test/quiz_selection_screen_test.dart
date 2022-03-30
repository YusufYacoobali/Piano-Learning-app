import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';
import 'package:sight_reading_app/screens/practice_screen.dart';
import 'package:sight_reading_app/screens/quiz_selection_screen.dart';
import 'package:sight_reading_app/screens/settings_screen.dart';
import 'package:sight_reading_app/components/app_bar_with_settings_icon.dart';

void main() {
  testWidgets(
      'Check that the quiz selection page is displayed when the button to go to the screen is pressed.',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToQuizSelectionButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(QuizSelectionScreen), findsOneWidget);
      }
  );

  testWidgets(
      'Check that the instruction text is displayed.',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToQuizSelectionButtonKey));
        await tester.pumpAndSettle();
        expect(find.text('Choose a quiz:'), findsOneWidget); //TODO: Would need to re-write to support multiple languages
      }
  );

  testWidgets(
      'Check that the settings icon is present on the quiz selection screen.',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToQuizSelectionButtonKey));
        await tester.pumpAndSettle();
        expect(find.byKey(AppBarWithSettingsIcon.navigateToSettingsButtonKey), findsOneWidget);
      }
  );

  testWidgets(
      'Check that the settings icon navigates to the settings screen once clicked.',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToQuizSelectionButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(AppBarWithSettingsIcon.navigateToSettingsButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(SettingsScreen), findsOneWidget);
      }
  );

  testWidgets(
      'Check that all the ListView quiz buttons are generated',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToQuizSelectionButtonKey));
        await tester.pumpAndSettle();
        for (Key quizButtonKey in quizButtonKeys) {
          await tester.scrollUntilVisible(
            find.byKey(quizButtonKey),
            500.0,
            scrollable: find.byType(Scrollable),
          );
          await tester.pumpAndSettle();
          expect(find.byKey(quizButtonKey), findsOneWidget);
        }
      }
  );

  testWidgets(
      'Check that the quiz buttons display the correct text',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToQuizSelectionButtonKey));
        await tester.pumpAndSettle();
        for (var i = 0; i < quizButtonKeys.length; i++) {
          await tester.scrollUntilVisible(
            find.byKey(quizButtonKeys[i]),
            500.0,
            scrollable: find.byType(Scrollable),
          );
          await tester.pumpAndSettle();
          expect(find.text(quizzes[i]), findsWidgets);
          expect(find.text('Record: ${quizRecords[i]}'), findsWidgets);
        }
      }
  );

  //TODO: Fix
  // testWidgets(
  //     'Check that clicking a quiz button navigates you to the quiz screen.',
  //     (WidgetTester tester) async {
  //       await tester.pumpWidget(const SightReadingApp());
  //       await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
  //       await tester.pumpAndSettle();
  //       await tester.tap(find.byKey(PracticeScreen.navigateToQuizSelectionButtonKey));
  //       await tester.pumpAndSettle();
  //       await tester.tap(find.byKey(quizButtonKeys[0]));
  //       await tester.pumpAndSettle();
  //       //TODO: Fix
  //       //expect(find.byType(PracticeQuizScreen), findsOneWidget);
  //     }
  // );

  testWidgets(
      'Check that the ${"random quiz button"} is displayed on screen.',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToQuizSelectionButtonKey));
        await tester.pumpAndSettle();
        expect(find.byKey(randomQuizSelectedKey), findsOneWidget);
      }
  );

  testWidgets(
      'Check that the ${"random quiz button"} displays the correct text',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToQuizSelectionButtonKey));
        await tester.pumpAndSettle();
        expect(find.text('Random mixed quiz'), findsOneWidget);
      }
  );

  testWidgets(
      'Check that scrolling does not move the random quiz button',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToQuizSelectionButtonKey));
        await tester.pumpAndSettle();
        final buttonFinder = find.byKey(randomQuizSelectedKey);
        final startPos = tester.getCenter(buttonFinder);
        final gesture = await tester.startGesture(const Offset(0, 300));
        await gesture.moveBy(const Offset(0, -300)); //Scrolls the screen
        await tester.pumpAndSettle();
        expect(startPos, equals(tester.getCenter(buttonFinder))); //Checks that the position of the button has not changed.
      }
  );

  testWidgets(
      'Check that clicking the random quiz button navigates you to a random quiz screen.',
      (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToQuizSelectionButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(randomQuizSelectedKey));
        await tester.pumpAndSettle();
        //TODO: Fix.
        // expect(find.byType(RandomQuizScreen), findsOneWidget);
      }
  );

  //TODO: Is this test needed? Changing records isn't part of the standard functionality so this wouldn't ever happen.
  // testWidgets(
  //     'Check that changes to user records are reflected on the menu screen',
  //         (WidgetTester tester) async {
  //       tester.runAsync(() async {
  //         //Sets mock values for relevant shared preferences so that we do not override any existing ones.
  //         List<String> tempQuizRecordKeys = replaceSpacesWithUnderscoresFromStrings(quizzes);
  //         Map<String, Object> mockValues = {};
  //         for (String key in tempQuizRecordKeys) {
  //           mockValues[key] = 'N/A';
  //         }
  //         SharedPreferences.setMockInitialValues(mockValues);
  //         final prefs = await SharedPreferences.getInstance();
  //
  //         await tester.pumpWidget(
  //           const MaterialApp(
  //             home: QuizSelectionScreen(),
  //           ),
  //         );
  //
  //         //Gets the old record for the first speedrun mode as an integer.
  //         int oldRecord;
  //         if (quizRecords[0] == 'N/A') {
  //           oldRecord = -1;
  //         } else {
  //           oldRecord = int.parse(quizRecords[0]);
  //         }
  //
  //         //Checks to make sure the records are being displayed correctly (before any changes).
  //         expect(find.text('Record: ${quizRecords[0]}'), findsWidgets);
  //
  //         //Changes the user record for the first speedrun mode.
  //         final newRecord = oldRecord + 1;
  //         prefs.setInt(tempQuizRecordKeys[0], newRecord);
  //         await tester.runAsync(() async =>
  //         await Future.delayed(const Duration(milliseconds: 1000)));
  //         await tester.pumpAndSettle();
  //
  //         //Checks to make sure the change is reflected on the screen.
  //         expect(find.text('Record: $newRecord'), findsOneWidget);
  //       });
  //     }
  // );
}