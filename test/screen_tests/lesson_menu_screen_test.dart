import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  _goToLessonsScreen(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
  }

  testWidgets('check that all lesson buttons are displayed',
      (WidgetTester tester) async {
    await _goToLessonsScreen(tester);
    expect(find.textContaining('Lesson '), findsNWidgets(10));
  });
}
