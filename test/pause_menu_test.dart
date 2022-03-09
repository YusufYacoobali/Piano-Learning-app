import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';
import 'package:sight_reading_app/screens/lesson_menu_screen.dart';
import 'package:sight_reading_app/screens/lesson_screen.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';

void main() {
  group('check that menu text is displayed.', () {
    testWidgets('lesson 1 menu text is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 1'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.text('Paused'), findsOneWidget);
    });

    testWidgets('lesson 2 menu text is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 2'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.text('Paused'), findsOneWidget);
    });

    testWidgets('lesson 3 menu text is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 3'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.text('Paused'), findsOneWidget);
    });

    testWidgets('lesson 4 menu text is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 4'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.text('Paused'), findsOneWidget);
    });

    testWidgets('lesson 5 menu text is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 5'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.text('Paused'), findsOneWidget);
    });
  });

  group('check that home button is displayed.', () {
    testWidgets('lesson 1 home button is displayed.',
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
      expect(find.byKey(homeKey), findsOneWidget);
    });

    testWidgets('lesson 2 home button is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const homeKey = Key('home button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 2'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.byKey(homeKey), findsOneWidget);
    });

    testWidgets('lesson 3 home button is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const homeKey = Key('home button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 3'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.byKey(homeKey), findsOneWidget);
    });

    testWidgets('lesson 4 home button is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const homeKey = Key('home button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 4'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.byKey(homeKey), findsOneWidget);
    });

    testWidgets('lesson 5 home button is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const homeKey = Key('home button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 5'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.byKey(homeKey), findsOneWidget);
    });
  });

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

    testWidgets('lesson 2 home button navigates to the main menu.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const homeKey = Key('home button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 2'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(homeKey));
      await tester.pumpAndSettle();
      expect(find.byType(MenuScreen), findsOneWidget);
    });

    testWidgets('lesson 3 home button navigates to the main menu.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const homeKey = Key('home button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 3'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(homeKey));
      await tester.pumpAndSettle();
      expect(find.byType(MenuScreen), findsOneWidget);
    });

    testWidgets('lesson 4 home button navigates to the main menu.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const homeKey = Key('home button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 4'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(homeKey));
      await tester.pumpAndSettle();
      expect(find.byType(MenuScreen), findsOneWidget);
    });

    testWidgets('lesson 5 home button navigates to the main menu.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const homeKey = Key('home button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 5'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(homeKey));
      await tester.pumpAndSettle();
      expect(find.byType(MenuScreen), findsOneWidget);
    });
  });

  group('check that play button is displayed.', () {
    testWidgets('lesson 1 play button is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const playKey = Key('play button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 1'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.byKey(playKey), findsOneWidget);
    });

    testWidgets('lesson 2 play button is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const playKey = Key('play button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 2'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.byKey(playKey), findsOneWidget);
    });

    testWidgets('lesson 3 play button is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const playKey = Key('play button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 3'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.byKey(playKey), findsOneWidget);
    });

    testWidgets('lesson 4 play button is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const playKey = Key('play button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 4'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.byKey(playKey), findsOneWidget);
    });

    testWidgets('lesson 5 play button is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const playKey = Key('play button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 5'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.byKey(playKey), findsOneWidget);
    });
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

    testWidgets('lesson 2 play button is clicked', (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const playKey = Key('play button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 2'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(playKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonScreen), findsOneWidget);
    });

    testWidgets('lesson 3 play button is clicked', (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const playKey = Key('play button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 3'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(playKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonScreen), findsOneWidget);
    });

    testWidgets('lesson 4 play button is clicked', (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const playKey = Key('play button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 4'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(playKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonScreen), findsOneWidget);
    });

    testWidgets('lesson 5 play button is clicked', (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const playKey = Key('play button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 5'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(playKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonScreen), findsOneWidget);
    });
  });

  group('check that lesson selection button is displayed.', () {
    testWidgets('lesson 1 selection button is displayed.',
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
      expect(find.byKey(selectionKey), findsOneWidget);
    });

    testWidgets('lesson 2 selection button is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const selectionKey = Key('lesson selection button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 2'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.byKey(selectionKey), findsOneWidget);
    });

    testWidgets('lesson 3 selection button is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const selectionKey = Key('lesson selection button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 3'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.byKey(selectionKey), findsOneWidget);
    });

    testWidgets('lesson 4 selection button is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const selectionKey = Key('lesson selection button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 4'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.byKey(selectionKey), findsOneWidget);
    });

    testWidgets('lesson 5 selection button is displayed.',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const selectionKey = Key('lesson selection button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 5'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      expect(find.byKey(selectionKey), findsOneWidget);
    });
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

    testWidgets('lesson 2 selection button is clicked',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const selectionKey = Key('lesson selection button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 2'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(selectionKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonMenuScreen), findsOneWidget);
    });

    testWidgets('lesson 3 selection button is clicked',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const selectionKey = Key('lesson selection button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 3'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(selectionKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonMenuScreen), findsOneWidget);
    });

    testWidgets('lesson 4 selection button is clicked',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const selectionKey = Key('lesson selection button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 4'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(selectionKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonMenuScreen), findsOneWidget);
    });

    testWidgets('lesson 5 selection button is clicked',
        (WidgetTester tester) async {
      const iconKey = Key('Pause Icon');
      const selectionKey = Key('lesson selection button');
      await tester.pumpWidget(const SightReadingApp());
      await tester.tap(find.text('Lessons'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Lesson 5'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(iconKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(selectionKey));
      await tester.pumpAndSettle();
      expect(find.byType(LessonMenuScreen), findsOneWidget);
    });
  });
}
