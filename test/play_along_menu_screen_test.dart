import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';
import 'package:sight_reading_app/screens/play_along_menu_screen.dart';
import 'package:sight_reading_app/screens/practice_screen.dart';
import 'package:sight_reading_app/screens/settings_screen.dart';
import 'package:sight_reading_app/components/app_bar_with_settings_icon.dart';

void main() {
  testWidgets(
      'Check that the instruction text for the play along menu screen is displayed',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToPlayAlongMenuButtonKey));
        await tester.pumpAndSettle();
        expect(find.text('Select a track:'), findsOneWidget);
      }
  );

  testWidgets(
      'Check that the play along menu page is displayed when the button is pressed.',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToPlayAlongMenuButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(PlayAlongMenuScreen), findsOneWidget);
      }
  );

  testWidgets(
      'Check that the settings icon is present on the play along menu screen',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToPlayAlongMenuButtonKey));
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
        await tester.tap(find.byKey(PracticeScreen.navigateToPlayAlongMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(AppBarWithSettingsIcon.navigateToSettingsButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(SettingsScreen), findsOneWidget);
      }
  );

  testWidgets(
      'Check that all the track buttons are generated',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToPlayAlongMenuButtonKey));
        await tester.pumpAndSettle();
        for (Key trackButtonKey in trackButtonKeys) {
          await tester.scrollUntilVisible(
            find.byKey(trackButtonKey),
            500.0,
            scrollable: find.byType(Scrollable),
          );
          expect(find.byKey(trackButtonKey), findsOneWidget);
        }
      }
  );

  testWidgets(
      'Check that the track buttons display the correct Text',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(PracticeScreen.navigateToPlayAlongMenuButtonKey));
        await tester.pumpAndSettle();
        for (var i = 0; i < trackButtonKeys.length; i++) {
          await tester.scrollUntilVisible(
              find.byKey(trackButtonKeys[i]),
              500.0,
              scrollable: find.byType(Scrollable)
          );
          expect(find.text(trackNames[i]), findsWidgets);
          expect(find.text('Record: ${trackRecords[i]}'), findsWidgets);
        }
      }
  );
  //TODO: Create tests to make sure correct context data is passed in for each quiz button
}