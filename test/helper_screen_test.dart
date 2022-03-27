import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';
import 'package:sight_reading_app/screens/note_helper_screen.dart';

void main() {
  _goToHelperSelectionScreen(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.byIcon(Icons.help));
    await tester.pumpAndSettle();
  }

  _goTorBassHelperScreen(WidgetTester tester) async {
    await _goToHelperSelectionScreen(tester);
    await tester.tap(find.text('Bass clef note'));
    await tester.pumpAndSettle();
  }

  _goTorClefHelperScreen(WidgetTester tester) async {
    await _goToHelperSelectionScreen(tester);
    await tester.tap(find.text('Treble clef note'));
    await tester.pumpAndSettle();
  }

  group('Check that numbers of helper screen are displayed:', () {
    testWidgets('Bass clef screen is displayed', (WidgetTester tester) async {
      await _goTorBassHelperScreen(tester);
      expect(find.byType(NoteHelperScreen), findsOneWidget);
    });

    testWidgets('Treble clef screen is displayed', (WidgetTester tester) async {
      await _goTorClefHelperScreen(tester);
      expect(find.byType(NoteHelperScreen), findsOneWidget);
    });
  });

  group('Check that helper cards are correctly displayed:', () {
    testWidgets('Bass clef note card is displayed',
        (WidgetTester tester) async {
      const cardKey = Key('card');
      await _goTorBassHelperScreen(tester);
      expect(find.byKey(cardKey), findsWidgets);
    });

    testWidgets('Treble clef note card is displayed',
        (WidgetTester tester) async {
      const cardKey = Key('card');
      await _goTorClefHelperScreen(tester);
      expect(find.byKey(cardKey), findsWidgets);
    });
  });

  group('Check that Bass clef helper card component is correctly displayed:',
      () {
    testWidgets('Bass clef note name is displayed',
        (WidgetTester tester) async {
      const nameKey = Key('card text');
      await _goTorBassHelperScreen(tester);
      expect(find.byKey(nameKey), findsWidgets);
    });

    testWidgets('Bass clef note image is displayed',
        (WidgetTester tester) async {
      const imageKey = Key('card image');
      await _goTorBassHelperScreen(tester);
      expect(find.byKey(imageKey), findsWidgets);
    });

    testWidgets('Bass clef note button is displayed',
        (WidgetTester tester) async {
      const buttonKey = Key('card button');
      await _goTorBassHelperScreen(tester);
      expect(find.byKey(buttonKey), findsWidgets);
    });
  });

  group('Check that Treble clef helper card component is correctly displayed:',
      () {
    testWidgets('Treble clef note name is displayed',
        (WidgetTester tester) async {
      const nameKey = Key('card text');
      await _goTorClefHelperScreen(tester);
      expect(find.byKey(nameKey), findsWidgets);
    });

    testWidgets('Treble clef note image is displayed',
        (WidgetTester tester) async {
      const imageKey = Key('card image');
      await _goTorClefHelperScreen(tester);
      expect(find.byKey(imageKey), findsWidgets);
    });

    testWidgets('Treble clef note button is displayed',
        (WidgetTester tester) async {
      const buttonKey = Key('card button');
      await _goTorClefHelperScreen(tester);
      expect(find.byKey(buttonKey), findsWidgets);
    });
  });
}
