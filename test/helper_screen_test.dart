import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  _goToHelperSelectionScreen(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.byIcon(Icons.help));
    await tester.pumpAndSettle();
  }

  testWidgets(
      'Check that bass helper screen is displayed when button is pressed',
      (WidgetTester tester) async {
    await _goToHelperSelectionScreen(tester);
    await tester.tap(find.text('Bass note'));
    expect(find.text('Helper'), findsOneWidget);
  });
}
