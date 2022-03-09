import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('check that question number is displayed',
      (WidgetTester tester) async {
    const testKey = Key('question number');
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Lesson 1'));
    await tester.pumpAndSettle();
    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('check that picture is displayed', (WidgetTester tester) async {
    const testKey = Key('question image');
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Lesson 1'));
    await tester.pumpAndSettle();
    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('check that the question text is displayed',
      (WidgetTester tester) async {
    const testKey = Key('question text');
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Lesson 1'));
    await tester.pumpAndSettle();
    expect(find.byKey(testKey), findsOneWidget);
  });
}
