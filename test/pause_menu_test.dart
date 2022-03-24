import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';
//import 'package:sight_reading_app/screens/lesson_menu_screen.dart';
//import 'package:sight_reading_app/screens/lesson_screen.dart';
//import 'package:sight_reading_app/screens/menu_screen.dart';

void main() {
  _goToLessonsScreen(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
  }

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

  group('Check lesson 1 paused menu successfully displayed', () {
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

    testWidgets('lesson selection button is displayed in pause menu.',
        (WidgetTester tester) async {
      const selectKey = Key('lesson selection button');
      await _goToLesson1PauseMenu(tester);
      expect(find.byKey(selectKey), findsOneWidget);
    });
  });

  group('Check lesson 2 paused menu successfully displayed', () {
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

    testWidgets('lesson selection button is displayed in pause menu.',
        (WidgetTester tester) async {
      const selectKey = Key('lesson selection button');
      await _goToLesson2PauseMenu(tester);
      expect(find.byKey(selectKey), findsOneWidget);
    });
  });

  group('Check lesson 3 paused menu successfully displayed', () {
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

    testWidgets('lesson selection button is displayed in pause menu.',
        (WidgetTester tester) async {
      const selectKey = Key('lesson selection button');
      await _goToLesson3PauseMenu(tester);
      expect(find.byKey(selectKey), findsOneWidget);
    });
  });

  group('Check lesson 4 paused menu successfully displayed', () {
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

    testWidgets('lesson selection button is displayed in pause menu.',
        (WidgetTester tester) async {
      const selectKey = Key('lesson selection button');
      await _goToLesson4PauseMenu(tester);
      expect(find.byKey(selectKey), findsOneWidget);
    });
  });

  /*
  group('check that home button navigates to the main menu once clicked.', () {
    testWidgets('lesson 1 home button navigates to the main menu.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const homeKey = Key('home button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 1'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(homeKey));
      await tester.pumpAndSettle();
      expect(find.byType(MenuScreen), findsOneWidget);
    });
  });

  group('check that play button is displayed.', () {
    
  });

  group(
      'check that can be continue the lesson once the play button is clicked.',
      () {
    testWidgets('lesson 1 play button is clicked', (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const playKey = Key('play button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 1'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(playKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonScreen), findsOneWidget);
    });
  });

  group('check that lesson selection button is displayed.', () {
    
  });

  group(
      'check that lesson selection button navigates to the lesson menu once clicked.',
      () {
    testWidgets('lesson 1 selection button is clicked',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const selectionKey = Key('lesson selection button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 1'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(selectionKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonMenuScreen), findsOneWidget);
    });
  });
  */
}
