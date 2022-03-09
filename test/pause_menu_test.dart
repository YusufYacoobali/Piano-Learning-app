import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';
import 'package:sight_reading_app/screens/lesson_screen.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';

void main() {
  //tap1: Go to lesson's quiz page
  //tap2: Click pause icon button
  //expect the pause menu opened
  testWidgets('check that menu text is displayed. ',
      (WidgetTester tester) async {
    const iconKey = Key('Pause Icon');
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(iconKey));
    await tester.pumpAndSettle();
    expect(find.text('Paused'), findsOneWidget);
  });

  testWidgets('check that home button is displayed.',
      (WidgetTester tester) async {
    const iconKey = Key('Pause Icon');
    const homeKey = Key('home button');
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(iconKey));
    await tester.pumpAndSettle();
    expect(find.byKey(homeKey), findsOneWidget);
  });

  //tap1: Go to lesson's quiz page
  //tap2: Click pause icon button
  //tap3: Click home button
  //expect to switch screen
  testWidgets('check that home button navigates to the main menu once clicked.',
      (WidgetTester tester) async {
    const iconKey = Key('Pause Icon');
    const homeKey = Key('home button');
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(iconKey));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(homeKey));
    await tester.pumpAndSettle();
    expect(find.byType(MenuScreen), findsOneWidget);
  });

  testWidgets('check that play button is displayed.',
      (WidgetTester tester) async {
    const iconKey = Key('Pause Icon');
    const playKey = Key('play button');
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(iconKey));
    await tester.pumpAndSettle();
    expect(find.byKey(playKey), findsOneWidget);
  });

  testWidgets(
      'check that play button is continue answering the lesson once clicked.',
      (WidgetTester tester) async {
    const iconKey = Key('Pause Icon');
    const homeKey = Key('play button');
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(iconKey));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(homeKey));
    await tester.pumpAndSettle();
    expect(find.byType(LessonScreen), findsOneWidget);
  });
}
