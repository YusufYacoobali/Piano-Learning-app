import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  testWidgets('Check that the settings page is displayed when the button is pressed.',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byIcon(Icons.settings));
        await tester.pumpAndSettle();
        expect(find.text('Settings'), findsOneWidget);
      });

  testWidgets('Checks that the sound toggle displays on the screen.',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byIcon(Icons.settings));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.music_note_outlined), findsOneWidget);
        expect(find.text('Sound'), findsOneWidget);
        expect(find.byKey(const Key('sound toggle')), findsOneWidget);
      });

  testWidgets('Checks that the volume slider displays on the screen.',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byIcon(Icons.settings));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.volume_up), findsOneWidget);
        expect(find.text('Volume'), findsOneWidget);
        expect(find.byType(Slider), findsOneWidget);
      });

  testWidgets('Checks that the difficulty selector displays on the screen.',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byIcon(Icons.settings));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.signal_cellular_alt_rounded), findsOneWidget);
        expect(find.text('Difficulty'), findsOneWidget);
        expect(find.byKey(const Key('difficulty selector')), findsOneWidget);
      });

  testWidgets('Checks that the theme selector displays on the screen.',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byIcon(Icons.settings));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.format_paint), findsOneWidget);
        expect(find.text('Theme'), findsOneWidget);
        expect(find.byKey(const Key('theme selector')), findsOneWidget);
      });

  testWidgets('Checks that the reset button resets the settings.',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byIcon(Icons.settings));
        await tester.pumpAndSettle();

        await tester.drag(find.byType(Slider), const Offset(-50, 0));
        await tester.tap(find.text('Reset'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Confirm'));
        await tester.pumpAndSettle();
        expect(find.byWidgetPredicate((widget) => widget is Slider && widget.value == 100), findsOneWidget);
      });

  testWidgets('Checks that cancelling a reset does not reset the settings.',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.byIcon(Icons.settings));
        await tester.pumpAndSettle();

        await tester.drag(find.byType(Slider), const Offset(-50, 0));
        await tester.tap(find.text('Reset'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Cancel'));
        await tester.pumpAndSettle();
        expect(find.byWidgetPredicate((widget) => widget is Slider && widget.value != 100), findsOneWidget);
      });
}
