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

  _goToBassHelperScreen(WidgetTester tester) async {
    await _goToHelperSelectionScreen(tester);
    await tester.tap(find.text('Bass clef note'));
    await tester.pumpAndSettle();
  }

  _goToClefHelperScreen(WidgetTester tester) async {
    await _goToHelperSelectionScreen(tester);
    await tester.tap(find.text('Treble clef note'));
    await tester.pumpAndSettle();
  }

  _goToNoteTypesHelperScreen(WidgetTester tester) async {
    await _goToHelperSelectionScreen(tester);
    await tester.tap(find.text('Note types'));
    await tester.pumpAndSettle();
  }

  group('Check that numbers of helper screen are displayed:', () {
    testWidgets('Bass clef screen is displayed', (WidgetTester tester) async {
      await _goToBassHelperScreen(tester);
      expect(find.byType(HelperScreen), findsOneWidget);
    });

    testWidgets('Treble clef screen is displayed', (WidgetTester tester) async {
      await _goToClefHelperScreen(tester);
      expect(find.byType(HelperScreen), findsOneWidget);
    });
  });

  group('Check that helper cards are correctly displayed:', () {
    testWidgets('Bass clef note card is displayed',
        (WidgetTester tester) async {
      const cardKey = Key('card');
      await _goToBassHelperScreen(tester);
      expect(find.byKey(cardKey), findsWidgets);
    });

    testWidgets('Treble clef note card is displayed',
        (WidgetTester tester) async {
      const cardKey = Key('card');
      await _goToClefHelperScreen(tester);
      expect(find.byKey(cardKey), findsWidgets);
    });
  });

  group('Check that Bass clef helper card component is correctly displayed:',
      () {
    testWidgets('Bass clef note name is displayed',
        (WidgetTester tester) async {
      const nameKey = Key('card text: 0');
      await _goToBassHelperScreen(tester);
      expect(find.byKey(nameKey), findsWidgets);
    });

    testWidgets('Bass clef note image is displayed',
        (WidgetTester tester) async {
      const imageKey = Key('card image');
      await _goToBassHelperScreen(tester);
      expect(find.byKey(imageKey), findsWidgets);
    });

    testWidgets('Bass clef note button is displayed',
        (WidgetTester tester) async {
      const buttonKey = Key('card button');
      await _goToBassHelperScreen(tester);
      expect(find.byKey(buttonKey), findsWidgets);
    });
  });

  group('Check that Treble clef helper card component is correctly displayed:',
      () {
    testWidgets('Treble clef note name is displayed',
        (WidgetTester tester) async {
      const nameKey = Key('card text: 0');
      await _goToClefHelperScreen(tester);
      expect(find.byKey(nameKey), findsWidgets);
    });

    testWidgets('Treble clef note image is displayed',
        (WidgetTester tester) async {
      const imageKey = Key('card image');
      await _goToClefHelperScreen(tester);
      expect(find.byKey(imageKey), findsWidgets);
    });

    testWidgets('Treble clef note button is displayed',
        (WidgetTester tester) async {
      const buttonKey = Key('card button');
      await _goToClefHelperScreen(tester);
      expect(find.byKey(buttonKey), findsWidgets);
    });
  });

  group('Check that Note types helper card component is correctly displayed:',
      () {
    testWidgets('Note types name is displayed', (WidgetTester tester) async {
      const nameKey = Key('card text: 0');
      await _goToNoteTypesHelperScreen(tester);
      expect(find.byKey(nameKey), findsWidgets);
    });

    testWidgets('Note types note image is displayed',
        (WidgetTester tester) async {
      const imageKey = Key('card image');
      await _goToNoteTypesHelperScreen(tester);
      expect(find.byKey(imageKey), findsWidgets);
    });
    testWidgets('Note types note description is displayed',
        (WidgetTester tester) async {
      const descriptionKey = Key('card description: 0');
      await _goToNoteTypesHelperScreen(tester);
      expect(find.byKey(descriptionKey), findsWidgets);
    });
  });
}
