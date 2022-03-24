import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  _goToHelperSelectionScreen(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.byIcon(Icons.help));
    await tester.pumpAndSettle();
  }

  testWidgets(
      'Check that helper selection page is displayed when button is pressed',
      (WidgetTester tester) async {
    await _goToHelperSelectionScreen(tester);
    expect(find.text('Helper'), findsOneWidget);
  });

  testWidgets(
      'Check that bass helper button is displayed on the helper selection screen',
      (WidgetTester tester) async {
    await _goToHelperSelectionScreen(tester);
    expect(find.text('Bass Clef note'), findsOneWidget);
  });

  testWidgets(
      'Check that clef helper button is displayed on the helper selection screen',
      (WidgetTester tester) async {
    await _goToHelperSelectionScreen(tester);
    expect(find.text('Treble Clef note'), findsOneWidget);
  });
}
