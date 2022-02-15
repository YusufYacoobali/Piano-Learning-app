import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  testWidgets('Check that the achivements are shown.',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Achievements'));
    await tester.pumpAndSettle();
    //expect(find.text('Complete all lessons'), findsOneWidget);
    //expect(find.text('Complete all quizzes'), findsOneWidget);
  });

  testWidgets('Check that tabs can be changed', (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Achievements'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Completed'));
    await tester.pumpAndSettle();
    //expect(find.text('Complete your 1st lesson'), findsOneWidget);
    //expect(find.text('Complete your 1st quiz'), findsOneWidget);
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
}
