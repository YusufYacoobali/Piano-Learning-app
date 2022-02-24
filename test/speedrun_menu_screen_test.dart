import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';
import 'package:sight_reading_app/screens/practice_screen.dart';
import 'package:sight_reading_app/screens/settings_screen.dart';
import 'package:sight_reading_app/screens/speedrun_menu_screen.dart';
import 'package:sight_reading_app/components/app_bar_with_settings_icon.dart';

void main() {
  testWidgets(
      'Check that the speedrun menu screen is being displayed',
      (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(SpeedrunMenuScreen), findsOneWidget);
      }
  );

  testWidgets(
      'Check that the instruction text for the screen is displayed',
      (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
        await tester.pumpAndSettle();
        expect(find.text('Choose a duration:'), findsOneWidget);
      }
  );

  testWidgets(
      'Check that the settings icon is present on the play along menu screen',
      (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
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
        await tester.tap(find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(AppBarWithSettingsIcon.navigateToSettingsButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(SettingsScreen), findsOneWidget);
      }
  );

  testWidgets(
      'Check that all the mode buttons are generated',
      (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
        await tester.pumpAndSettle();
        for (Key modeButtonKey in modeButtonKeys) {
          await tester.scrollUntilVisible(
            find.byKey(modeButtonKey),
            500.0,
            scrollable: find.byType(Scrollable),
          );
          expect(find.byKey(modeButtonKey), findsOneWidget);
        }
      }
  );

  testWidgets(
      'Check that the mode option buttons display the correct Text',
      (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
        await tester.pumpAndSettle();
        for (var i = 0; i < modeButtonKeys.length; i++) {
          await tester.scrollUntilVisible(
              find.byKey(modeButtonKeys[i]),
              500.0,
              scrollable: find.byType(Scrollable)
          );
          expect(find.text(modes[i]), findsWidgets);
          expect(find.text('Record: ${modeRecords[i]}'), findsWidgets);
        }
      }
  );
  //TODO: Create tests to make sure correct context data is passed in for each quiz button
}