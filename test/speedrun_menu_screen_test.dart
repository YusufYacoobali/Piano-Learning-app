import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';
import 'package:sight_reading_app/screens/practice_screen.dart';
import 'package:sight_reading_app/screens/settings_screen.dart';
import 'package:sight_reading_app/screens/speedrun_menu_screen.dart';
import 'package:sight_reading_app/components/app_bar_with_settings_icon.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Check that the speedrun menu screen is being displayed',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        // Navigates to the speedrun menu screen.
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(
            find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
        await tester.pumpAndSettle();

        expect(find.byType(SpeedrunMenuScreen), findsOneWidget);
      });

  testWidgets('Check that the instruction text for the screen is displayed',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        // Navigates to the speedrun menu screen.
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(
            find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
        await tester.pumpAndSettle();
        expect(find.text('Choose a duration:'), findsOneWidget);
      });

  testWidgets(
      'Check that the settings icon is present on the play along menu screen',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        // Navigates to the speedrun menu screen.
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(
            find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
        await tester.pumpAndSettle();

        expect(find.byKey(AppBarWithSettingsIcon.navigateToSettingsButtonKey),
            findsOneWidget);
      });

  testWidgets(
      'Check that the settings icon navigates to the settings screen once clicked.',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());

        // Navigates to the speedrun menu screen.
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(
            find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
        await tester.pumpAndSettle();

        // Navigates to the settings screen using the app bar's button.
        await tester.tap(
            find.byKey(AppBarWithSettingsIcon.navigateToSettingsButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(SettingsScreen), findsOneWidget);
      });

  testWidgets('Check that all the mode buttons are generated',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        // Navigates to the speedrun menu screen
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(
            find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
        await tester.pumpAndSettle();

        // Tests every button.
        for (Key modeButtonKey in modeButtonKeys) {
          // Scrolls the screen to reach the desired widget.
          await tester.scrollUntilVisible(
            find.byKey(modeButtonKey),
            500.0,
            scrollable: find.byType(Scrollable),
          );
          expect(find.byKey(modeButtonKey), findsOneWidget);
        }
      });

  testWidgets(
      'Check that the speedrun mode buttons Text is displayed correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        // Navigates to the speedrun menu screen.
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(
            find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
        await tester.pumpAndSettle();

        // Tests every button.
        for (var i = 0; i < modeButtonKeys.length; i++) {
          // Scrolls the screen to reach the desired widget.
          await tester.scrollUntilVisible(
              find.byKey(modeButtonKeys[i]),
              500.0,
              scrollable: find.byType(Scrollable)
          );
          expect(find.text(modes[i].toString() + ' seconds'), findsWidgets);
        }
      }
  );

  testWidgets(
      'Check that the records for each speedrun mode are displayed on the screen correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        // Navigates to the speedrun menu screen.
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(
            find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
        await tester.pumpAndSettle();

        // Tests every button.
        for (var i = 0; i < modeButtonKeys.length; i++) {
          // Scrolls the screen until the widget to be tested is visible on screen.
          await tester.scrollUntilVisible(
              find.byKey(modeButtonKeys[i]),
              500.0,
              scrollable: find.byType(Scrollable)
          );
          expect(find.text('Record: ${modeRecords[i]}'), findsWidgets);
        }
      }
  );

  testWidgets(
      'Check that pressing a speedrun mode option navigates you to the speedrun screen with the selected mode',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        // Navigates to the speedrun menu screen.
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(
            find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
        await tester.pumpAndSettle();

        // Navigates to the speedrun screen.
        await tester.tap(find.byKey(modeButtonKeys[0]));
        await tester.pumpAndSettle();

        //TODO: Fix.
        // expect(find.byType(SpeedrunScreen), findsOneWidget);
        // SpeedrunScreen finalScreen = tester.firstWidget(find.byType(SpeedrunScreen));
        // expect(finalScreen.timerDuration, modes[0]);
      }
  );

  testWidgets(
      'Check that changes to user records are reflected on the menu screen',
          (WidgetTester tester) async {
        tester.runAsync(() async {
          //Sets mock values for relevant shared preferences so that we do not override any existing ones.
          SharedPreferences.setMockInitialValues(
              {
                '10_second_speedrun_record': 'N/A',
                '20_second_speedrun_record': 'N/A',
                '30_second_speedrun_record': 'N/A',
                '40_second_speedrun_record': 'N/A',
                '50_second_speedrun_record': 'N/A',
                '60_second_speedrun_record': 'N/A',
              }
          );
          final prefs = await SharedPreferences.getInstance();

          // Navigates to the speedrun menu screen.
          await tester.pumpWidget(const SightReadingApp());
          await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
          await tester.pumpAndSettle();
          await tester.tap(
              find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
          await tester.pumpAndSettle();


          //Gets the old record for the first speedrun mode as an integer.
          int oldRecord;
          if (modeRecords[0] == 'N/A') {
            oldRecord = -1;
          } else {
            oldRecord = int.parse(modeRecords[0]);
          }

          //Checks to make sure the records are being displayed correctly (before any changes).
          expect(find.text('Record: ${modeRecords[0]}'), findsWidgets);

          //Changes the user record for the first speedrun mode.
          final newRecord = oldRecord + 1;
          prefs.setInt('${modes[0]}_second_speedrun_record', newRecord);
          await tester.runAsync(() async =>
          await Future.delayed(const Duration(milliseconds: 100)));
          await tester.pumpAndSettle();

          //Checks to make sure the change is reflected on the screen.
          expect(find.text('Record: $newRecord'), findsOneWidget);
        });
      }
  );
}