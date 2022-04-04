import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/components/achievement_components/achievement_card.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  testWidgets(
      'Check that the achievement page is displayed when the button is pressed.',
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
      'Check that no completed achievements are shown when non are complete.',
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

    prefs.setBool('lesson-num-0', false);
    prefs.setBool('lesson-num-1', true);

    expect(prefs.get('lesson-num-0'), false);
    expect(prefs.get('lesson-num-1'), true);
  });

  testWidgets('Check that achievements update when storage is updated',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final SharedPreferences prefs = await SharedPreferences.getInstance();

// 1st lesson and 1st quiz will have been completed
    prefs.setBool('lesson-num-0', true);
    prefs.setInt('completed_quizzes', 1);

    await tester.pumpAndSettle();

    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Achievements'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Completed'));
    await tester.pumpAndSettle();
    expect(find.text('Complete 1 lesson'), findsOneWidget);
    expect(find.text('Complete 1 quiz'), findsOneWidget);
  });
}
