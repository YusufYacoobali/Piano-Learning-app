import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  _goToHelperSelectionScreen(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.byIcon(Icons.help));
    await tester.pumpAndSettle();
  }

  testWidgets(
      'Check that bass helper screen is displayed when button is pressed',
      (WidgetTester tester) async {
    await _goToHelperSelectionScreen(tester);
    await tester.tap(find.text('Bass note'));
    expect(find.text('Helper'), findsOneWidget);
  });

  group('Check for bass helper function.', () {
    testWidgets(
        'Check that multiple play icon button is displayed in bass helper',
        (WidgetTester tester) async {
      await _goToHelperSelectionScreen(tester);
      await tester.tap(find.text('Bass note'));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.play_arrow), findsWidgets);
    });

    testWidgets('Check that multiple note text is displayed in bass helper',
        (WidgetTester tester) async {
      const textKey = Key('card text');
      await _goToHelperSelectionScreen(tester);
      await tester.tap(find.text('Bass note'));
      await tester.pumpAndSettle();
      expect(find.byKey(textKey), findsWidgets);
    });

    testWidgets('Check that multiple note image is displayed in bass helper',
        (WidgetTester tester) async {
      const imageKey = Key('card note image');
      await _goToHelperSelectionScreen(tester);
      await tester.tap(find.text('Bass note'));
      await tester.pumpAndSettle();
      expect(find.byKey(imageKey), findsWidgets);
    });
  });

  group('Check for clef helper function.', () {
    testWidgets(
        'Check that clef helper screen is displayed when button is pressed',
        (WidgetTester tester) async {
      await _goToHelperSelectionScreen(tester);
      await tester.tap(find.text('Clef note'));
      expect(find.text('Helper'), findsOneWidget);
    });

    testWidgets('Check that multiple note text is displayed in clef helper',
        (WidgetTester tester) async {
      const textKey = Key('card text');
      await _goToHelperSelectionScreen(tester);
      await tester.tap(find.text('Clef note'));
      await tester.pumpAndSettle();
      expect(find.byKey(textKey), findsWidgets);
    });

    testWidgets('Check that multiple note image is displayed in clef helper',
        (WidgetTester tester) async {
      const imageKey = Key('card note image');
      await _goToHelperSelectionScreen(tester);
      await tester.tap(find.text('Clef note'));
      await tester.pumpAndSettle();
      expect(find.byKey(imageKey), findsWidgets);
    });

    testWidgets(
        'Check that multiple play icon button is displayed in clef helper',
        (WidgetTester tester) async {
      await _goToHelperSelectionScreen(tester);
      await tester.tap(find.text('Clef note'));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.play_arrow), findsWidgets);
    });
  });
}
