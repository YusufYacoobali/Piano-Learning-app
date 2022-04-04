import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';
import 'package:sight_reading_app/screens/practice_screen.dart';
import 'package:sight_reading_app/screens/settings_screen.dart';
import 'package:sight_reading_app/screens/speedrun_menu_screen.dart';
import 'package:sight_reading_app/components/app_bar_with_settings_icon.dart';
import 'package:sight_reading_app/screens/speedrun_screen.dart';

void main() {
  Future<void> _goToSpeedrunMenuScreen(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
    await tester.pumpAndSettle();
    await tester
        .tap(find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
    await tester.pumpAndSettle();
  }

  testWidgets('Check that the speedrun menu screen is being displayed',
      (WidgetTester tester) async {
    await _goToSpeedrunMenuScreen(tester);
    expect(find.byType(SpeedrunMenuScreen), findsOneWidget);
  });

  testWidgets('Check that the instruction text for the screen is displayed',
      (WidgetTester tester) async {
    await _goToSpeedrunMenuScreen(tester);
    expect(find.text('Choose a duration:'), findsOneWidget);
  });

  testWidgets(
      'Check that the settings icon is present on the play along menu screen',
      (WidgetTester tester) async {
    await _goToSpeedrunMenuScreen(tester);
    expect(find.byKey(AppBarWithSettingsIcon.navigateToSettingsButtonKey),
        findsOneWidget);
  });

  testWidgets(
      'Check that the settings icon navigates to the settings screen once clicked.',
      (WidgetTester tester) async {
    await _goToSpeedrunMenuScreen(tester);
    // Navigates to the settings screen using the app bar's button.
    await tester
        .tap(find.byKey(AppBarWithSettingsIcon.navigateToSettingsButtonKey));
    await tester.pumpAndSettle();
    expect(find.byType(SettingsScreen), findsOneWidget);
  });

  testWidgets('Check that all the mode buttons are generated',
      (WidgetTester tester) async {
    await _goToSpeedrunMenuScreen(tester);
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
    await _goToSpeedrunMenuScreen(tester);
    // Tests every button.
    for (var i = 0; i < modeButtonKeys.length; i++) {
      // Scrolls the screen to reach the desired widget.
      await tester.scrollUntilVisible(find.byKey(modeButtonKeys[i]), 500.0,
          scrollable: find.byType(Scrollable));
      expect(find.text(modes[i].toString() + ' seconds'), findsWidgets);
    }
  });

  testWidgets(
      'Check that the records for each speedrun mode are displayed on the screen correctly',
      (WidgetTester tester) async {
    await _goToSpeedrunMenuScreen(tester);
    // Tests every button.
    for (var i = 0; i < modeButtonKeys.length; i++) {
      // Scrolls the screen until the widget to be tested is visible on screen.
      await tester.scrollUntilVisible(find.byKey(modeButtonKeys[i]), 500.0,
          scrollable: find.byType(Scrollable));
      await tester.pumpAndSettle();
      expect(find.text('Record: ${modeRecords[i]}'), findsWidgets);
    }
  });

  testWidgets(
      'Check that pressing a speedrun mode option navigates you to the speedrun screen with the selected mode',
      (WidgetTester tester) async {
    await _goToSpeedrunMenuScreen(tester);
    // Navigates to the speedrun screen.
    await tester.tap(find.byKey(modeButtonKeys[0]));
    await tester.pumpAndSettle();
    expect(find.byType(SpeedrunScreen), findsOneWidget);
    SpeedrunScreen finalScreen =
        tester.firstWidget(find.byType(SpeedrunScreen));
    expect(finalScreen.timerDuration, modes[0]);
  });
}
