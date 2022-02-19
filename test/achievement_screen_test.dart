import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/components/achievement_components/achievement_card.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  testWidgets(
      'Check that the achivement page is displayed when the button is pressed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Achievements'));
    await tester.pumpAndSettle();
    expect(find.text('To do'), findsOneWidget);
    expect(find.text('Completed'), findsOneWidget);
  });

  testWidgets('Check that the default tab displays the achievements',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Achievements'));
    await tester.pumpAndSettle();

    expect(find.text('Complete all lessons'), findsOneWidget);
    expect(find.text('Complete all quizzes'), findsOneWidget);
  });

  testWidgets(
      'Check that no completed achivements are shown when non are complete.',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpAndSettle();

    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Achievements'));
    await tester.pumpAndSettle();

    // for a new device, there are no completed achievements so completed tab will be blank

    await tester.tap(find.text('Completed'));
    await tester.pumpAndSettle();
    expect(find.byType(AchievementCard), findsNothing);
  });

  testWidgets('Check that the correct values from storage are retrieved',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Achievements'));
    await tester.pumpAndSettle();

    prefs.setInt('completed_lessons', 3);
    prefs.setInt('completed_quizzes', 1);

    expect(prefs.get('completed_lessons'), 3);
    expect(prefs.get('completed_quizzes'), 1);
  });

  testWidgets('Check that achievements update when storage is updated',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final SharedPreferences prefs = await SharedPreferences.getInstance();

// 1st lesson and 1st quiz will have been completed
    prefs.setInt('completed_lessons', 3);
    prefs.setInt('completed_quizzes', 1);

    await tester.pumpAndSettle();

    await tester.pumpWidget(const SightReadingApp());
    // prefs.setInt('completed_lessons', 3);
    // prefs.setInt('completed_quizzes', 1);
    await tester.tap(find.text('Achievements'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Completed'));
    await tester.pumpAndSettle();
    expect(find.text('Complete the 1st lesson'), findsOneWidget);
    expect(find.text('Complete your 1st quiz'), findsOneWidget);
  });
}
