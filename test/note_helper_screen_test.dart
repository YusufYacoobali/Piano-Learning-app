import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/components/note_helper/bass_note_list_helper.dart';
import 'package:sight_reading_app/components/note_helper/clef_note_helper_list.dart';
import 'package:sight_reading_app/components/note_helper/note_helper_type_list.dart';
import 'package:sight_reading_app/main.dart';

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

  Future<void> _checkButtonForWhiteKeyPressMakesSound(
      WidgetTester tester, String noteSound) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final List<MethodCall> log = <MethodCall>[];
    TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform,
            (MethodCall methodCall) async {
      log.add(methodCall);
      return null;
    });

    await tester.tap(find.byKey(Key('card button:$noteSound')));
    expect(log, hasLength(1));
    expect(log.single,
        isMethodCall('SystemSound.play', arguments: 'SystemSoundType.click'));
  }

  group('Check each buttons in bass helper are playable: ', () {
    testWidgets('press C4 button will make a sound.',
        (WidgetTester tester) async {
      await _goToBassHelperScreen(tester);
      await tester.scrollUntilVisible(
        find.byKey(const Key('card button:note_middle_c4')),
        500,
        scrollable: find.byType(Scrollable),
      );
      await _checkButtonForWhiteKeyPressMakesSound(tester, 'note_middle_c4');
    });

    testWidgets('press B3 button will make a sound.',
        (WidgetTester tester) async {
      await _goToBassHelperScreen(tester);
      await tester.scrollUntilVisible(
        find.byKey(const Key('card button:note_low_b')),
        500,
        scrollable: find.byType(Scrollable),
      );
      await _checkButtonForWhiteKeyPressMakesSound(tester, 'note_low_b');
    });

    testWidgets('press A3 button will make a sound.',
        (WidgetTester tester) async {
      await _goToBassHelperScreen(tester);
      final itemFinder = find.byKey(const Key('card button:note_low_a'));
      final listFinder = find.byType(Scrollable);
      await tester.scrollUntilVisible(
        itemFinder,
        500,
        scrollable: listFinder,
      );
      await _checkButtonForWhiteKeyPressMakesSound(tester, 'note_low_a');
      await tester.pumpAndSettle();
    });

    testWidgets('press G3 button will make a sound.',
        (WidgetTester tester) async {
      await _goToBassHelperScreen(tester);
      final itemFinder = find.byKey(const Key('card button:note_low_g'));
      final listFinder = find.byType(Scrollable);
      await tester.scrollUntilVisible(
        itemFinder,
        500,
        scrollable: listFinder,
      );
      await _checkButtonForWhiteKeyPressMakesSound(tester, 'note_low_g');
      await tester.pumpAndSettle();
    });

    testWidgets('press F3 button will make a sound.',
        (WidgetTester tester) async {
      await _goToBassHelperScreen(tester);
      final itemFinder = find.byKey(const Key('card button:note_low_f'));
      final listFinder = find.byType(Scrollable);
      await tester.scrollUntilVisible(
        itemFinder,
        500,
        scrollable: listFinder,
      );
      await _checkButtonForWhiteKeyPressMakesSound(tester, 'note_low_f');
      await tester.pumpAndSettle();
    });

    testWidgets('press E3 button will make a sound.',
        (WidgetTester tester) async {
      await _goToBassHelperScreen(tester);
      final itemFinder = find.byKey(const Key('card button:note_low_e'));
      final listFinder = find.byType(Scrollable);
      await tester.scrollUntilVisible(
        itemFinder,
        500,
        scrollable: listFinder,
      );
      await _checkButtonForWhiteKeyPressMakesSound(tester, 'note_low_e');
      await tester.pumpAndSettle();
    });

    testWidgets('press D3 button will make a sound.',
        (WidgetTester tester) async {
      await _goToBassHelperScreen(tester);
      final itemFinder = find.byKey(const Key('card button:note_low_d'));
      final listFinder = find.byType(Scrollable);
      await tester.scrollUntilVisible(
        itemFinder,
        500,
        scrollable: listFinder,
      );
      await _checkButtonForWhiteKeyPressMakesSound(tester, 'note_low_d');
      await tester.pumpAndSettle();
    });

    testWidgets('press C3 button will make a sound.',
        (WidgetTester tester) async {
      await _goToBassHelperScreen(tester);
      final itemFinder = find.byKey(const Key('card button:note_low_c3'));
      final listFinder = find.byType(Scrollable);
      await tester.scrollUntilVisible(
        itemFinder,
        500,
        scrollable: listFinder,
      );
      await _checkButtonForWhiteKeyPressMakesSound(tester, 'note_low_c3');
      await tester.pumpAndSettle();
    });
  });

  group('Check each buttons in treble helper are playable: ', () {
    testWidgets('press C4 button will make a sound.',
        (WidgetTester tester) async {
      await _goToClefHelperScreen(tester);
      final itemFinder = find.byKey(const Key('card button:note_middle_c4'));
      final listFinder = find.byType(Scrollable);
      await tester.scrollUntilVisible(
        itemFinder,
        500,
        scrollable: listFinder,
      );
      await _checkButtonForWhiteKeyPressMakesSound(tester, 'note_middle_c4');
      await tester.pumpAndSettle();
    });

    testWidgets('press D4 button will make a sound.',
        (WidgetTester tester) async {
      await _goToClefHelperScreen(tester);
      final itemFinder = find.byKey(const Key('card button:note_middle_d'));
      final listFinder = find.byType(Scrollable);
      await tester.scrollUntilVisible(
        itemFinder,
        500,
        scrollable: listFinder,
      );
      await _checkButtonForWhiteKeyPressMakesSound(tester, 'note_middle_d');
      await tester.pumpAndSettle();
    });

    testWidgets('press E4 button will make a sound.',
        (WidgetTester tester) async {
      await _goToClefHelperScreen(tester);
      final itemFinder = find.byKey(const Key('card button:note_middle_e'));
      final listFinder = find.byType(Scrollable);
      await tester.scrollUntilVisible(
        itemFinder,
        500,
        scrollable: listFinder,
      );
      await _checkButtonForWhiteKeyPressMakesSound(tester, 'note_middle_e');
      await tester.pumpAndSettle();
    });

    testWidgets('press F4 button will make a sound.',
        (WidgetTester tester) async {
      await _goToClefHelperScreen(tester);
      final itemFinder = find.byKey(const Key('card button:note_middle_f'));
      final listFinder = find.byType(Scrollable);
      await tester.scrollUntilVisible(
        itemFinder,
        500,
        scrollable: listFinder,
      );
      await _checkButtonForWhiteKeyPressMakesSound(tester, 'note_middle_f');
      await tester.pumpAndSettle();
    });

    testWidgets('press G4 button will make a sound.',
        (WidgetTester tester) async {
      await _goToClefHelperScreen(tester);
      final itemFinder = find.byKey(const Key('card button:note_middle_g'));
      final listFinder = find.byType(Scrollable);
      await tester.scrollUntilVisible(
        itemFinder,
        500,
        scrollable: listFinder,
      );
      await _checkButtonForWhiteKeyPressMakesSound(tester, 'note_middle_g');
      await tester.pumpAndSettle();
    });

    testWidgets('press A4 button will make a sound.',
        (WidgetTester tester) async {
      await _goToClefHelperScreen(tester);
      final itemFinder = find.byKey(const Key('card button:note_middle_a'));
      final listFinder = find.byType(Scrollable);
      await tester.scrollUntilVisible(
        itemFinder,
        500,
        scrollable: listFinder,
      );
      await _checkButtonForWhiteKeyPressMakesSound(tester, 'note_middle_a');
      await tester.pumpAndSettle();
    });

    testWidgets('press B4 button will make a sound.',
        (WidgetTester tester) async {
      await _goToClefHelperScreen(tester);
      final itemFinder = find.byKey(const Key('card button:note_middle_b'));
      final listFinder = find.byType(Scrollable);
      await tester.scrollUntilVisible(
        itemFinder,
        500,
        scrollable: listFinder,
      );
      await _checkButtonForWhiteKeyPressMakesSound(tester, 'note_middle_b');
      await tester.pumpAndSettle();
    });

    testWidgets('press C5 button will make a sound.',
        (WidgetTester tester) async {
      await _goToClefHelperScreen(tester);
      final itemFinder = find.byKey(const Key('card button:note_high_c5'));
      final listFinder = find.byType(Scrollable);
      await tester.scrollUntilVisible(
        itemFinder,
        500,
        scrollable: listFinder,
      );
      await _checkButtonForWhiteKeyPressMakesSound(tester, 'note_high_c5');
      await tester.pumpAndSettle();
    });
  });

  group('Check that helper functions are worked: ', () {
    group('All note_helper cards are correctly displayed: ', () {
      testWidgets('Bass clef helper cards are displayed',
          (WidgetTester tester) async {
        await _goToBassHelperScreen(tester);
        for (int i = 0; i < bassNoteImageNameList.noteHelperList.length; i++) {
          expect(
              find.byKey(Key(
                  'card:${bassNoteImageNameList.noteHelperList[i].noteName}')),
              findsWidgets);
        }
      });

      testWidgets('Treble clef helper cards are displayed',
          (WidgetTester tester) async {
        await _goToClefHelperScreen(tester);
        for (int i = 0; i < clefNoteImageNameList.noteHelperList.length; i++) {
          expect(
              find.byKey(Key(
                  'card:${clefNoteImageNameList.noteHelperList[i].noteName}')),
              findsWidgets);
        }
      });

      testWidgets('Note type helper cards are displayed',
          (WidgetTester tester) async {
        await _goToNoteTypesHelperScreen(tester);
        for (int i = 0; i < noteTypeList.noteHelperList.length; i++) {
          expect(
              find.byKey(
                  Key('card:${noteTypeList.noteHelperList[i].noteName}')),
              findsWidgets);
        }
      });
    });

    group('All note_helper texts are correctlly displayed: ', () {
      testWidgets('Bass clef helper texts are displayed',
          (WidgetTester tester) async {
        await _goToBassHelperScreen(tester);
        for (int i = 0; i < bassNoteImageNameList.noteHelperList.length; i++) {
          expect(
              find.byKey(Key(
                  'card text:${bassNoteImageNameList.noteHelperList[i].noteName}')),
              findsWidgets);
        }
      });

      testWidgets('Treble clef helper texts are displayed',
          (WidgetTester tester) async {
        await _goToClefHelperScreen(tester);
        for (int i = 0; i < clefNoteImageNameList.noteHelperList.length; i++) {
          expect(
              find.byKey(Key(
                  'card text:${clefNoteImageNameList.noteHelperList[i].noteName}')),
              findsWidgets);
        }
      });

      testWidgets('Note type helper texts are displayed',
          (WidgetTester tester) async {
        await _goToNoteTypesHelperScreen(tester);
        for (int i = 0; i < noteTypeList.noteHelperList.length; i++) {
          expect(
              find.byKey(
                  Key('card text:${noteTypeList.noteHelperList[i].noteName}')),
              findsWidgets);
        }
      });
    });

    group('All note_helper images are correctlly displayed: ', () {
      testWidgets('Bass clef helper texts are displayed',
          (WidgetTester tester) async {
        await _goToBassHelperScreen(tester);
        for (int i = 0; i < bassNoteImageNameList.noteHelperList.length; i++) {
          expect(find.byKey(Key('card image:$i')), findsWidgets);
        }
      });

      testWidgets('Treble clef helper images are displayed',
          (WidgetTester tester) async {
        await _goToClefHelperScreen(tester);
        for (int i = 0; i < clefNoteImageNameList.noteHelperList.length; i++) {
          expect(find.byKey(Key('card image:$i')), findsWidgets);
        }
      });

      testWidgets('Note type helper images are displayed',
          (WidgetTester tester) async {
        await _goToNoteTypesHelperScreen(tester);
        for (int i = 0; i < noteTypeList.noteHelperList.length; i++) {
          expect(find.byKey(Key('card image:$i')), findsWidgets);
        }
      });
    });

    group('All buttons in helpers are displayed: ', () {
      testWidgets('Bass clef helper buttons are displayed',
          (WidgetTester tester) async {
        await _goToBassHelperScreen(tester);
        for (int i = 0; i < bassNoteImageNameList.noteHelperList.length; i++) {
          expect(
              find.byKey(Key(
                  'card button:${bassNoteImageNameList.noteHelperList[i].noteSound}')),
              findsWidgets);
        }
      });

      testWidgets('Treble clef helper buttons are displayed',
          (WidgetTester tester) async {
        await _goToClefHelperScreen(tester);
        for (int i = 0; i < clefNoteImageNameList.noteHelperList.length; i++) {
          expect(
              find.byKey(Key(
                  'card button:${clefNoteImageNameList.noteHelperList[i].noteSound}')),
              findsWidgets);
        }
      });
    });

    testWidgets('Note types note description is displayed',
        (WidgetTester tester) async {
      await _goToNoteTypesHelperScreen(tester);
      for (int i = 0; i < noteTypeList.noteHelperList.length; i++) {
        expect(
            find.byKey(Key(
                'card description:${noteTypeList.noteHelperList[i].description}')),
            findsWidgets);
      }
    });
  });
}
