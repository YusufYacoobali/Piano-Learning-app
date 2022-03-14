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
    await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
    await tester.pumpAndSettle();
    await tester
        .tap(find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
    await tester.pumpAndSettle();
    expect(find.byType(SpeedrunMenuScreen), findsOneWidget);
  });

  testWidgets('Check that the instruction text for the screen is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
    await tester.pumpAndSettle();
    await tester
        .tap(find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
    await tester.pumpAndSettle();
    expect(find.text('Choose a duration:'), findsOneWidget);
  });

  testWidgets(
      'Check that the settings icon is present on the play along menu screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
    await tester.pumpAndSettle();
    await tester
        .tap(find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
    await tester.pumpAndSettle();
    expect(find.byKey(AppBarWithSettingsIcon.navigateToSettingsButtonKey),
        findsOneWidget);
  });

  testWidgets(
      'Check that the settings icon navigates to the settings screen once clicked.',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
    await tester.pumpAndSettle();
    await tester
        .tap(find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
    await tester.pumpAndSettle();
    await tester
        .tap(find.byKey(AppBarWithSettingsIcon.navigateToSettingsButtonKey));
    await tester.pumpAndSettle();
    expect(find.byType(SettingsScreen), findsOneWidget);
  });

  testWidgets('Check that all the mode buttons are generated',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
    await tester.pumpAndSettle();
    await tester
        .tap(find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
    await tester.pumpAndSettle();
    for (Key modeButtonKey in modeButtonKeys) {
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
          expect(find.text(modes[i].toString() + ' seconds'), findsWidgets);
        }
      }
  );

  testWidgets(
      'Check that the records for each speedrun mode are displayed on the screen correctly',
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
          expect(find.text('Record: ${modeRecordsCopy[i]}'), findsWidgets);
        }
      }
  );

  testWidgets(
    'Check that changes to user records are reflected on the menu screen',
  (WidgetTester tester) async {
      tester.runAsync(() async {
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

    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey));
    await tester.pumpAndSettle();


    int oldRecord;
    if (modeRecordsCopy[0] == 'N/A') {
      oldRecord = -1;
    } else {
      oldRecord = int.parse(modeRecordsCopy[0]);
    }

    for (String key in prefs.getKeys()) {
      print(key + "value:" + prefs.get(key).toString());
    }


    expect(find.text('Record: ${modeRecordsCopy[0]}'), findsWidgets);

    final newRecord = oldRecord + 1;
    prefs.setInt('${modes[0]}_second_speedrun_record', newRecord);
    await tester.runAsync(() async => await Future.delayed(const Duration(milliseconds: 100)));
    await tester.pumpAndSettle();

    expect(find.text('Record: $newRecord'), findsOneWidget);
    });
          }
  );
}
