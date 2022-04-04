import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';
import 'package:sight_reading_app/screens/lesson_menu_screen.dart';
import 'package:sight_reading_app/screens/lesson_screen.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';

void main() {
  /// shortcut for go to lesson selection menu.
  _goToLessonsScreen(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
  }

  /// shortcut for open paused menu.
  _openPausedMenu(WidgetTester tester) async {
    const pauseKey = Key('Pause Icon');
    await tester.tap(find.byKey(pauseKey));
    await tester.pumpAndSettle();
  }

  /// shortcut for paused menu in lesson 1 screen.
  _goToLesson1PauseMenu(WidgetTester tester) async {
    await _goToLessonsScreen(tester);
    await tester.tap(find.text('Lesson 1'));
    await tester.pumpAndSettle();
    await _openPausedMenu(tester);
  }

  /// shortcut for paused menu in lesson 2 screen.
  _goToLesson2PauseMenu(WidgetTester tester) async {
    await _goToLessonsScreen(tester);
    await tester.tap(find.text('Lesson 2'));
    await tester.pumpAndSettle();
    await _openPausedMenu(tester);
  }

  /// shortcut for paused menu in lesson 3 screen.
  _goToLesson3PauseMenu(WidgetTester tester) async {
    await _goToLessonsScreen(tester);
    await tester.tap(find.text('Lesson 3'));
    await tester.pumpAndSettle();
    await _openPausedMenu(tester);
  }

  /// shortcut for paused menu in lesson 4 screen.
  _goToLesson4PauseMenu(WidgetTester tester) async {
    await _goToLessonsScreen(tester);
    await tester.tap(find.text('Lesson 4'));
    await tester.pumpAndSettle();
    await _openPausedMenu(tester);
  }

  /// shortcut for paused menu in lesson 5 screen.
  _goToLesson5PauseMenu(WidgetTester tester) async {
    await _goToLessonsScreen(tester);
    await tester.ensureVisible(find.text('Lesson 5'));
    await tester.tap(find.text('Lesson 5'));
    await tester.pumpAndSettle();
    await _openPausedMenu(tester);
  }

  /// shortcut for paused menu in lesson 6 screen.
  _goToLesson6PauseMenu(WidgetTester tester) async {
    await _goToLessonsScreen(tester);
    await tester.ensureVisible(find.text('Lesson 6'));
    await tester.tap(find.text('Lesson 6'));
    await tester.pumpAndSettle();
    await _openPausedMenu(tester);
  }

  /// Group of tests fot paused menu buttons display testing
  group('Check lesson 1 paused menu successfully displayed:', () {
    testWidgets('menu text is displayed in the pause menu.',
        (WidgetTester tester) async {
      const textKey = Key('Menu title');
      await _goToLesson1PauseMenu(tester);
      expect(find.byKey(textKey), findsOneWidget);
    });

    testWidgets('home button is displayed in pause menu.',
        (WidgetTester tester) async {
      const homeKey = Key('home button');
      await _goToLesson1PauseMenu(tester);
      expect(find.byKey(homeKey), findsOneWidget);
    });

    testWidgets('play button is displayed in pause menu.',
        (WidgetTester tester) async {
      const playKey = Key('play button');
      await _goToLesson1PauseMenu(tester);
      expect(find.byKey(playKey), findsOneWidget);
    });

    testWidgets('selection button is displayed in pause menu.',
        (WidgetTester tester) async {
      const selectKey = Key('selection button');
      await _goToLesson1PauseMenu(tester);
      expect(find.byKey(selectKey), findsOneWidget);
    });
  });

  group('Check lesson 2 paused menu successfully displayed:', () {
    testWidgets('menu text is displayed in the pause menu.',
        (WidgetTester tester) async {
      const textKey = Key('Menu title');
      await _goToLesson2PauseMenu(tester);
      expect(find.byKey(textKey), findsOneWidget);
    });

    testWidgets('home button is displayed in pause menu.',
        (WidgetTester tester) async {
      const homeKey = Key('home button');
      await _goToLesson2PauseMenu(tester);
      expect(find.byKey(homeKey), findsOneWidget);
    });

    testWidgets('play button is displayed in pause menu.',
        (WidgetTester tester) async {
      const playKey = Key('play button');
      await _goToLesson2PauseMenu(tester);
      expect(find.byKey(playKey), findsOneWidget);
    });

    testWidgets('selection button is displayed in pause menu.',
        (WidgetTester tester) async {
      const selectKey = Key('selection button');
      await _goToLesson2PauseMenu(tester);
      expect(find.byKey(selectKey), findsOneWidget);
    });
  });

  group('Check lesson 3 paused menu successfully displayed:', () {
    testWidgets('menu text is displayed in the pause menu.',
        (WidgetTester tester) async {
      const textKey = Key('Menu title');
      await _goToLesson3PauseMenu(tester);
      expect(find.byKey(textKey), findsOneWidget);
    });

    testWidgets('home button is displayed in pause menu.',
        (WidgetTester tester) async {
      const homeKey = Key('home button');
      await _goToLesson3PauseMenu(tester);
      expect(find.byKey(homeKey), findsOneWidget);
    });

    testWidgets('play button is displayed in pause menu.',
        (WidgetTester tester) async {
      const playKey = Key('play button');
      await _goToLesson3PauseMenu(tester);
      expect(find.byKey(playKey), findsOneWidget);
    });

    testWidgets('selection button is displayed in pause menu.',
        (WidgetTester tester) async {
      const selectKey = Key('selection button');
      await _goToLesson3PauseMenu(tester);
      expect(find.byKey(selectKey), findsOneWidget);
    });
  });

  group('Check lesson 4 paused menu successfully displayed:', () {
    testWidgets('menu text is displayed in the pause menu.',
        (WidgetTester tester) async {
      const textKey = Key('Menu title');
      await _goToLesson4PauseMenu(tester);
      expect(find.byKey(textKey), findsOneWidget);
    });

    testWidgets('home button is displayed in pause menu.',
        (WidgetTester tester) async {
      const homeKey = Key('home button');
      await _goToLesson4PauseMenu(tester);
      expect(find.byKey(homeKey), findsOneWidget);
    });

    testWidgets('play button is displayed in pause menu.',
        (WidgetTester tester) async {
      const playKey = Key('play button');
      await _goToLesson4PauseMenu(tester);
      expect(find.byKey(playKey), findsOneWidget);
    });

    testWidgets('selection button is displayed in pause menu.',
        (WidgetTester tester) async {
      const selectKey = Key('selection button');
      await _goToLesson4PauseMenu(tester);
      expect(find.byKey(selectKey), findsOneWidget);
    });
  });

  group('Check lesson 5 paused menu successfully displayed:', () {
    testWidgets('menu text is displayed in the pause menu.',
        (WidgetTester tester) async {
      const textKey = Key('Menu title');
      await _goToLesson5PauseMenu(tester);
      expect(find.byKey(textKey), findsOneWidget);
    });

    testWidgets('home button is displayed in pause menu.',
        (WidgetTester tester) async {
      const homeKey = Key('home button');
      await _goToLesson5PauseMenu(tester);
      expect(find.byKey(homeKey), findsOneWidget);
    });

    testWidgets('play button is displayed in pause menu.',
        (WidgetTester tester) async {
      const playKey = Key('play button');
      await _goToLesson5PauseMenu(tester);
      expect(find.byKey(playKey), findsOneWidget);
    });

    testWidgets('selection button is displayed in pause menu.',
        (WidgetTester tester) async {
      const selectKey = Key('selection button');
      await _goToLesson5PauseMenu(tester);
      expect(find.byKey(selectKey), findsOneWidget);
    });

    group('Check lesson 6 paused menu successfully displayed:', () {
      testWidgets('menu text is displayed in the pause menu.',
          (WidgetTester tester) async {
        const textKey = Key('Menu title');
        await _goToLesson6PauseMenu(tester);
        expect(find.byKey(textKey), findsOneWidget);
      });

      testWidgets('home button is displayed in pause menu.',
          (WidgetTester tester) async {
        const homeKey = Key('home button');
        await _goToLesson6PauseMenu(tester);
        expect(find.byKey(homeKey), findsOneWidget);
      });

      testWidgets('play button is displayed in pause menu.',
          (WidgetTester tester) async {
        const playKey = Key('play button');
        await _goToLesson6PauseMenu(tester);
        expect(find.byKey(playKey), findsOneWidget);
      });

      testWidgets('selection button is displayed in pause menu.',
          (WidgetTester tester) async {
        const selectKey = Key('selection button');
        await _goToLesson6PauseMenu(tester);
        expect(find.byKey(selectKey), findsOneWidget);
      });
    });
  });

  /// Group of tests fot paused menu buttons navigate testing.
  group(
      'check that every buttons in the lesson 1 paused menu are correctly navigates once clicked:',
      () {
    testWidgets('home button navigates to the main menu.',
        (WidgetTester tester) async {
      const homeKey = Key('home button');
      await _goToLesson1PauseMenu(tester);
      await tester.tap(find.byKey(homeKey));
      await tester.pumpAndSettle();
      expect(find.byType(MenuScreen), findsOneWidget);
    });

    testWidgets('play button navigates to the current lesson screen.',
        (WidgetTester tester) async {
      const playKey = Key('play button');
      await _goToLesson1PauseMenu(tester);
      await tester.tap(find.byKey(playKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonScreen), findsOneWidget);
    });

    testWidgets('selection button navigates to the current lesson screen.',
        (WidgetTester tester) async {
      const selectKey = Key('selection button');
      await _goToLesson1PauseMenu(tester);
      await tester.tap(find.byKey(selectKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonMenuScreen), findsOneWidget);
    });
  });

  group(
      'check that every buttons in the lesson 2 paused menu are correctly navigates once clicked:',
      () {
    testWidgets('home button navigates to the main menu.',
        (WidgetTester tester) async {
      const homeKey = Key('home button');
      await _goToLesson2PauseMenu(tester);
      await tester.tap(find.byKey(homeKey));
      await tester.pumpAndSettle();
      expect(find.byType(MenuScreen), findsOneWidget);
    });

    testWidgets('play button navigates to the current lesson screen.',
        (WidgetTester tester) async {
      const playKey = Key('play button');
      await _goToLesson2PauseMenu(tester);
      await tester.tap(find.byKey(playKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonScreen), findsOneWidget);
    });

    testWidgets('selection button navigates to the current lesson screen.',
        (WidgetTester tester) async {
      const selectKey = Key('selection button');
      await _goToLesson2PauseMenu(tester);
      await tester.tap(find.byKey(selectKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonMenuScreen), findsOneWidget);
    });
  });

  group(
      'check that every buttons in the lesson 3 paused menu are correctly navigates once clicked:',
      () {
    testWidgets('home button navigates to the main menu.',
        (WidgetTester tester) async {
      const homeKey = Key('home button');
      await _goToLesson3PauseMenu(tester);
      await tester.tap(find.byKey(homeKey));
      await tester.pumpAndSettle();
      expect(find.byType(MenuScreen), findsOneWidget);
    });

    testWidgets('play button navigates to the current lesson screen.',
        (WidgetTester tester) async {
      const playKey = Key('play button');
      await _goToLesson3PauseMenu(tester);
      await tester.tap(find.byKey(playKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonScreen), findsOneWidget);
    });

    testWidgets('selection button navigates to the current lesson screen.',
        (WidgetTester tester) async {
      const selectKey = Key('selection button');
      await _goToLesson3PauseMenu(tester);
      await tester.tap(find.byKey(selectKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonMenuScreen), findsOneWidget);
    });
  });

  group(
      'check that every buttons in the lesson 4 paused menu are correctly navigates once clicked:',
      () {
    testWidgets('home button navigates to the main menu.',
        (WidgetTester tester) async {
      const homeKey = Key('home button');
      await _goToLesson4PauseMenu(tester);
      await tester.tap(find.byKey(homeKey));
      await tester.pumpAndSettle();
      expect(find.byType(MenuScreen), findsOneWidget);
    });

    testWidgets('play button navigates to the current lesson screen.',
        (WidgetTester tester) async {
      const playKey = Key('play button');
      await _goToLesson4PauseMenu(tester);
      await tester.tap(find.byKey(playKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonScreen), findsOneWidget);
    });

    testWidgets('selection button navigates to the current lesson screen.',
        (WidgetTester tester) async {
      const selectKey = Key('selection button');
      await _goToLesson4PauseMenu(tester);
      await tester.tap(find.byKey(selectKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonMenuScreen), findsOneWidget);
    });
  });

  group(
      'check that every buttons in the lesson 5 paused menu are correctly navigates once clicked:',
      () {
    testWidgets('home button navigates to the main menu.',
        (WidgetTester tester) async {
      const homeKey = Key('home button');
      await _goToLesson5PauseMenu(tester);
      await tester.tap(find.byKey(homeKey));
      await tester.pumpAndSettle();
      expect(find.byType(MenuScreen), findsOneWidget);
    });

    testWidgets('play button navigates to the current lesson screen.',
        (WidgetTester tester) async {
      const playKey = Key('play button');
      await _goToLesson5PauseMenu(tester);
      await tester.tap(find.byKey(playKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonScreen), findsOneWidget);
    });

    testWidgets('selection button navigates to the current lesson screen.',
        (WidgetTester tester) async {
      const selectKey = Key('selection button');
      await _goToLesson5PauseMenu(tester);
      await tester.tap(find.byKey(selectKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonMenuScreen), findsOneWidget);
    });
  });

  group(
      'check that every buttons in the lesson 6 paused menu are correctly navigates once clicked:',
      () {
    testWidgets('home button navigates to the main menu.',
        (WidgetTester tester) async {
      const homeKey = Key('home button');
      await _goToLesson6PauseMenu(tester);
      await tester.tap(find.byKey(homeKey));
      await tester.pumpAndSettle();
      expect(find.byType(MenuScreen), findsOneWidget);
    });

    testWidgets('play button navigates to the current lesson screen.',
        (WidgetTester tester) async {
      const playKey = Key('play button');
      await _goToLesson6PauseMenu(tester);
      await tester.tap(find.byKey(playKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonScreen), findsOneWidget);
    });

    testWidgets('selection button navigates to the current lesson screen.',
        (WidgetTester tester) async {
      const selectKey = Key('selection button');
      await _goToLesson6PauseMenu(tester);
      await tester.tap(find.byKey(selectKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonMenuScreen), findsOneWidget);
    });
  });
}
