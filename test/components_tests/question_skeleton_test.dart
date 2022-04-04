import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';
import 'package:flutter/material.dart';

void main() {
  Future<void> _goToLessonOne(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Lesson 1'));
    await tester.pumpAndSettle();
  }

  testWidgets('Check that the question number is displayed',
      (WidgetTester tester) async {
    const testKey = Key('question number');
    await _goToLessonOne(tester);
    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('Check that the note picture is displayed',
      (WidgetTester tester) async {
    const testKey = Key('question image');
    await _goToLessonOne(tester);
    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('Check that the question text is displayed',
      (WidgetTester tester) async {
    const testKey = Key('question text');
    await _goToLessonOne(tester);
    expect(find.byKey(testKey), findsOneWidget);
  });
}
