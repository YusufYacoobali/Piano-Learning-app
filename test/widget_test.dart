import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  testWidgets('check that the lesson button exists',
      (WidgetTester tester) async {
    // Define the test key.
    const testKey = Key('LessonButton');

    // Build a MaterialApp with the testKey.
    await tester.pumpWidget(SightReadingApp());

    // Find the MaterialApp widget using the testKey.
    expect(find.byKey(testKey), findsOneWidget);
  });
}
