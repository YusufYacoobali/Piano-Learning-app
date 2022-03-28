import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';
import 'package:sight_reading_app/screens/practice_screen.dart';
import 'package:sight_reading_app/screens/settings_screen.dart';
import 'package:sight_reading_app/components/app_bar_with_settings_icon.dart';

void main() {
  Future<void> _goToPracticeMenuScreen(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.byKey(navigateToPracticeMainMenuButtonKey));
    await tester.pumpAndSettle();
  }

  testWidgets(
      'Check that the practice main menu page is displayed when the button is pressed.',
      (WidgetTester tester) async {
    await _goToPracticeMenuScreen(tester);
    expect(find.byType(PracticeScreen), findsOneWidget);
  });

  testWidgets(
      'Check that the ${"Play Along"} button is present on the practice menu screen',
      (WidgetTester tester) async {
    await _goToPracticeMenuScreen(tester);
    expect(find.byKey(PracticeScreen.navigateToPlayAlongMenuButtonKey),
        findsOneWidget);
  });

  testWidgets(
      'Check that the ${"Speedrun"} button is present on the practice menu screen',
      (WidgetTester tester) async {
    await _goToPracticeMenuScreen(tester);
    expect(find.byKey(PracticeScreen.navigateToSpeedrunMenuButtonKey),
        findsOneWidget);
  });

  testWidgets(
      'Check that the ${"Take a Quiz"} button is present on the practice menu screen',
      (WidgetTester tester) async {
    await _goToPracticeMenuScreen(tester);
    expect(find.byKey(PracticeScreen.navigateToQuizSelectionButtonKey),
        findsOneWidget);
  });

  testWidgets(
      'Check that the ${"Endless"} button is present on the practice menu screen',
      (WidgetTester tester) async {
    await _goToPracticeMenuScreen(tester);
    expect(find.byKey(PracticeScreen.navigateToEndlessModeButtonKey),
        findsOneWidget);
  });

  testWidgets(
      'Check that the settings icon is present on the practice menu screen',
      (WidgetTester tester) async {
    await _goToPracticeMenuScreen(tester);
    expect(find.byKey(AppBarWithSettingsIcon.navigateToSettingsButtonKey),
        findsOneWidget);
  });

  testWidgets(
      'Check that the settings icon navigates to the settings screen once clicked.',
      (WidgetTester tester) async {
    await _goToPracticeMenuScreen(tester);
    await tester
        .tap(find.byKey(AppBarWithSettingsIcon.navigateToSettingsButtonKey));
    await tester.pumpAndSettle();
    expect(find.byType(SettingsScreen), findsOneWidget);
  });
}
