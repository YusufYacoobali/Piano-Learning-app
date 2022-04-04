import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  testWidgets('check that the app name is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    expect(find.text('Read\n That\n Sheet'), findsOneWidget);
  });

  testWidgets('check that the lesson button is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    expect(find.text('Lessons'), findsOneWidget);
  });

  testWidgets('check that the practice button is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    expect(find.text('Practice'), findsOneWidget);
  });

  testWidgets('check that the achievements button is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    expect(find.text('Achievements'), findsOneWidget);
  });

  testWidgets('check that the settings button is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    expect(find.byIcon(Icons.settings), findsOneWidget);
  });

  testWidgets('check that the help button is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    expect(find.byIcon(Icons.help), findsOneWidget);
  });
}
