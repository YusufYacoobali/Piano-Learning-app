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

  _goToBassHelperScreen(WidgetTester tester) async {
    await _goToHelperSelectionScreen(tester);
    await tester.tap(find.text('Bass Clef Notes'));
    await tester.pumpAndSettle();
  }

  _goToClefHelperScreen(WidgetTester tester) async {
    await _goToHelperSelectionScreen(tester);
    await tester.tap(find.text('Treble Clef Notes'));
    await tester.pumpAndSettle();
  }

  _goToNoteTypesHelperScreen(WidgetTester tester) async {
    await _goToHelperSelectionScreen(tester);
    await tester.tap(find.text('Note Types'));
    await tester.pumpAndSettle();
  }

  group('Check that numbers of helper screen are displayed:', () {
    testWidgets('Bass clef screen is displayed', (WidgetTester tester) async {
      await _goToBassHelperScreen(tester);
      expect(find.byType(NoteHelperScreen), findsOneWidget);
    });

    testWidgets('Treble clef screen is displayed', (WidgetTester tester) async {
      await _goToClefHelperScreen(tester);
      expect(find.byType(NoteHelperScreen), findsOneWidget);
    });

    testWidgets('Note type screen is displayed', (WidgetTester tester) async {
      await _goToNoteTypesHelperScreen(tester);
      expect(find.byType(NoteHelperScreen), findsOneWidget);
    });
  });

  group('Check that note_helper cards are correctly displayed:', () {
    const cardKey = Key('card');
    testWidgets('Bass clef note card is displayed',
        (WidgetTester tester) async {
      await _goToBassHelperScreen(tester);
      expect(find.byKey(cardKey), findsWidgets);
    });

    testWidgets('Treble clef note card is displayed',
        (WidgetTester tester) async {
      await _goToClefHelperScreen(tester);
      expect(find.byKey(cardKey), findsWidgets);
    });

    testWidgets('Note type card is displayed', (WidgetTester tester) async {
      await _goToNoteTypesHelperScreen(tester);
      expect(find.byKey(cardKey), findsWidgets);
    });
  });

  group('Check all helper card funtions: ', () {
    const nameKey = Key('card text: 0');
    const imageKey = Key('card image');
    const buttonKey = Key('card button');
    const descriptionKey = Key('card description: 0');
    group(
        'Check that Bass clef note_helper card component is correctly displayed:',
        () {
      testWidgets('Bass clef note name is displayed',
          (WidgetTester tester) async {
        await _goToBassHelperScreen(tester);
        expect(find.byKey(nameKey), findsWidgets);
      });

      testWidgets('Bass clef note image is displayed',
          (WidgetTester tester) async {
        await _goToBassHelperScreen(tester);
        expect(find.byKey(imageKey), findsWidgets);
      });

      testWidgets('Bass clef note button is displayed',
          (WidgetTester tester) async {
        await _goToBassHelperScreen(tester);
        expect(find.byKey(buttonKey), findsWidgets);
      });
    });

    group(
        'Check that Treble clef note_helper card component is correctly displayed:',
        () {
      testWidgets('Treble clef note name is displayed',
          (WidgetTester tester) async {
        await _goToClefHelperScreen(tester);
        expect(find.byKey(nameKey), findsWidgets);
      });

      testWidgets('Treble clef note image is displayed',
          (WidgetTester tester) async {
        await _goToClefHelperScreen(tester);
        expect(find.byKey(imageKey), findsWidgets);
      });

      testWidgets('Treble clef note button is displayed',
          (WidgetTester tester) async {
        await _goToClefHelperScreen(tester);
        expect(find.byKey(buttonKey), findsWidgets);
      });
    });

    group(
        'Check that Note types note_helper card component is correctly displayed:',
        () {
      testWidgets('Note types name is displayed', (WidgetTester tester) async {
        await _goToNoteTypesHelperScreen(tester);
        expect(find.byKey(nameKey), findsWidgets);
      });

      testWidgets('Note types note image is displayed',
          (WidgetTester tester) async {
        await _goToNoteTypesHelperScreen(tester);
        expect(find.byKey(imageKey), findsWidgets);
      });
      testWidgets('Note types note description is displayed',
          (WidgetTester tester) async {
        await _goToNoteTypesHelperScreen(tester);
        expect(find.byKey(descriptionKey), findsWidgets);
      });
    });
  });
}
