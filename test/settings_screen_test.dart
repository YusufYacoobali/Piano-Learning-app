import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  _goToSettingsScreen(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();
  }

  testWidgets('Check that the settings page is displayed when the button is pressed.',
          (WidgetTester tester) async {
        await _goToSettingsScreen(tester);
        expect(find.text('Settings'), findsOneWidget);
      });

  testWidgets('Check that the volume slider displays on the screen.',
          (WidgetTester tester) async {
        await _goToSettingsScreen(tester);

        expect(find.byIcon(Icons.volume_up), findsOneWidget);
        expect(find.text('Volume'), findsOneWidget);
        expect(find.byType(Slider), findsOneWidget);
      });

  testWidgets('Check that the theme selector displays on the screen.',
          (WidgetTester tester) async {
        await _goToSettingsScreen(tester);

        expect(find.byIcon(Icons.format_paint), findsOneWidget);
        expect(find.text('Theme'), findsOneWidget);
        expect(find.byKey(const Key('theme selector')), findsOneWidget);
      });

  testWidgets('Check that changing the volume saves the correct value to storage.',
          (WidgetTester tester) async {

        SharedPreferences.setMockInitialValues({});
        final SharedPreferences pref = await SharedPreferences.getInstance();

        await _goToSettingsScreen(tester);

        expect(pref.get('volume'), '100');

        await tester.drag(find.byType(Slider), const Offset(-100, 0));
        await tester.pump();

        if (pref.get('volume') == '100') {
          fail('The volume should not be 100');
        }
      });

  testWidgets('Check that changing the theme saves the correct value to storage.',
          (WidgetTester tester) async {

        SharedPreferences.setMockInitialValues({});
        final SharedPreferences pref = await SharedPreferences.getInstance();

        await _goToSettingsScreen(tester);

        expect(pref.get('theme'), 'Dark');

        // Check that the initial theme of the app is dark
        expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.dark);

        await tester.tap(find.text('Dark'));
        await tester.pump();
        await tester.tap(find.text('Light').last);
        await tester.pumpAndSettle();

        expect(pref.get('theme'), 'Light');

        // Check that the theme has changed
        expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.light);
      });

  testWidgets('Check that resetting the settings sets their values to default.',
          (WidgetTester tester) async {

        SharedPreferences.setMockInitialValues({});
        final SharedPreferences pref = await SharedPreferences.getInstance();

        await _goToSettingsScreen(tester);
        
        expect(pref.get('volume'), '100');
        expect(pref.get('theme'), 'Dark');

        // Check that the initial theme of the app is dark
        expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.dark);
        
        await tester.drag(find.byType(Slider), const Offset(-100, 0));
        await tester.pump();
        await tester.tap(find.text('Dark'));
        await tester.pump();
        await tester.tap(find.text('Light').last);
        await tester.pumpAndSettle();
        
        if (pref.get('volume') == '100') fail('The volume should not be 100');
        expect(pref.get('theme'), 'Light');

        // Check that the theme changes
        expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.light);

        await tester.tap(find.text('Reset Progress'));
        await tester.pump();
        await tester.tap(find.text('Confirm'));
        await tester.pumpAndSettle();
        
        expect(pref.get('volume'), '100');
        expect(pref.get('theme'), 'Dark');

        // Check that the theme changes
        expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.dark);
      });

  testWidgets('Check that cancelling a reset keeps the values the same.',
          (WidgetTester tester) async {

        SharedPreferences.setMockInitialValues({});
        final SharedPreferences pref = await SharedPreferences.getInstance();

        await _goToSettingsScreen(tester);
        
        expect(pref.get('volume'), '100');
        expect(pref.get('theme'), 'Dark');

        // Check that the initial theme of the app is dark
        expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.dark);

        await tester.drag(find.byType(Slider), const Offset(-100, 0));
        await tester.pump();
        await tester.tap(find.text('Dark'));
        await tester.pump();
        await tester.tap(find.text('Light').last);
        await tester.pumpAndSettle();
        
        if (pref.get('volume') == '100') fail('The volume should not be 100');
        expect(pref.get('theme'), 'Light');

        // Check that the theme changes
        expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.light);

        await tester.tap(find.text('Reset Progress'));
        await tester.pump();
        await tester.tap(find.text('Cancel'));
        await tester.pump();

        if (pref.get('volume') == '100') fail('The volume should not be 100');
        expect(pref.get('theme'), 'Light');

        // Check that the theme stays the same
        expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.light);
      });

  testWidgets('Check that loading settings from storage displays correctly.',
          (WidgetTester tester) async {

        SharedPreferences.setMockInitialValues({'volume': '50', 'difficulty': 'Expert', 'theme': 'Light', });
        final SharedPreferences pref = await SharedPreferences.getInstance();

        await _goToSettingsScreen(tester);
        
        expect(pref.get('volume'), '50');
        expect(pref.get('theme'), 'Light');

        // Check that the initial theme of the app is light
        expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.light);

        expect(find.text('50'), findsOneWidget);
        expect(find.text('Dark'), findsOneWidget);
      });
}
