import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';
import 'package:sight_reading_app/screens/helper_screen.dart';

void main() {
  _goToHelperSelectionScreen(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.byIcon(Icons.help));
    await tester.pumpAndSettle();
  }

  _goTorBassHelperScreen(WidgetTester tester) async {
    await _goToHelperSelectionScreen(tester);
    await tester.tap(find.text('Bass note'));
    await tester.pumpAndSettle();
  }

  _goTorClefHelperScreen(WidgetTester tester) async {
    await _goToHelperSelectionScreen(tester);
    await tester.tap(find.text('Clef note'));
    await tester.pumpAndSettle();
  }

  group('Check that numbers of helper screen are displayed:', () {
    testWidgets('Bass screen is displayed', (WidgetTester tester) async {
      await _goTorBassHelperScreen(tester);
      expect(find.byType(HelperScreen), findsOneWidget);
    });

    testWidgets('Clef screen is displayed', (WidgetTester tester) async {
      await _goTorClefHelperScreen(tester);
      expect(find.byType(HelperScreen), findsOneWidget);
    });
  });

  group('Check that helper cards are correctly displayed:', () {
    testWidgets('Bass note card is displayed', (WidgetTester tester) async {
      const cardKey = Key('card');
      await _goTorBassHelperScreen(tester);
      expect(find.byKey(cardKey), findsWidgets);
    });

    testWidgets('Clef note card is displayed', (WidgetTester tester) async {
      const cardKey = Key('card');
      await _goTorClefHelperScreen(tester);
      expect(find.byKey(cardKey), findsWidgets);
    });
  });

  group('Check that Bass helper card component is correctly displayed:', () {
    testWidgets('Bass note name is displayed', (WidgetTester tester) async {
      const nameKey = Key('card text');
      await _goTorBassHelperScreen(tester);
      expect(find.byKey(nameKey), findsWidgets);
    });

    testWidgets('Bass note image is displayed', (WidgetTester tester) async {
      const imageKey = Key('card image');
      await _goTorBassHelperScreen(tester);
      expect(find.byKey(imageKey), findsWidgets);
    });

    testWidgets('Bass note button is displayed', (WidgetTester tester) async {
      const buttonKey = Key('card button');
      await _goTorBassHelperScreen(tester);
      expect(find.byKey(buttonKey), findsWidgets);
    });
  });

  group('Check that Clef helper card component is correctly displayed:', () {
    testWidgets('Clef note name is displayed', (WidgetTester tester) async {
      const nameKey = Key('card text');
      await _goTorClefHelperScreen(tester);
      expect(find.byKey(nameKey), findsWidgets);
    });

    testWidgets('Clef note image is displayed', (WidgetTester tester) async {
      const imageKey = Key('card image');
      await _goTorClefHelperScreen(tester);
      expect(find.byKey(imageKey), findsWidgets);
    });

    testWidgets('Clef note button is displayed', (WidgetTester tester) async {
      const buttonKey = Key('card button');
      await _goTorClefHelperScreen(tester);
      expect(find.byKey(buttonKey), findsWidgets);
    });
  });
}
