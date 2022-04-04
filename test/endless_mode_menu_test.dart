import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  _goToEndlessModeScreen(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Practice'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Endless'));
    await tester.pumpAndSettle();
  }

  testWidgets(
      'check endless mode clef selector appears on loading endless mode',
      (WidgetTester tester) async {
    await _goToEndlessModeScreen(tester);
    await tester.pumpAndSettle();
    expect(find.byType(Overlay), findsOneWidget);
    expect(find.text('Endless Mode'), findsOneWidget);
  });
}
