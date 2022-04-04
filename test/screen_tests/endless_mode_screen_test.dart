import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  _goToEndlessScreen(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Practice'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Endless'));
    await tester.pumpAndSettle();
  }

  testWidgets('Check that the choosing clef menu appears.',
      (WidgetTester tester) async {
    await _goToEndlessScreen(tester);
    expect(find.text('Select The Clef'), findsOneWidget);
  });
}
