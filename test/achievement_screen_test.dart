import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  testWidgets('check that the app name is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());

    await tester.tap(find.text('Achievements'));

    await tester.pump();

    expect(find.byKey(const Key('to-do-tab')), findsOneWidget);
  });
}
