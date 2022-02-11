import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  testWidgets(
      'Check that the achivement page is displayed when the button is pressed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Achievements'));
    await tester.pumpAndSettle();
    expect(find.text('To do'), findsOneWidget);
    expect(find.text('Completed'), findsOneWidget);
  });

  testWidgets('Check that the achivements are shown.',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Achievements'));
    await tester.pumpAndSettle();
    expect(find.text('blahhhh'), findsOneWidget);
    expect(find.text('Complete the 1st lesson'), findsOneWidget);
  });

  testWidgets('Check that tabs can be changed', (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Achievements'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Completed'));
    await tester.pumpAndSettle();
    expect(find.text('Open the app once'), findsOneWidget);
  });

  // testWidgets('Check that the achievements are scrollable',
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(const SightReadingApp());
  //   await tester.tap(find.text('Achievements'));
  //   await tester.pumpAndSettle();

  //   final itemFinder = find.text('blaj');

  //   await tester.scrollUntilVisible(
  //     itemFinder,
  //     1000.0,
  //     scrollable: find.byType(Scrollable),
  //   );

  //   // Verify that the item contains the correct text.
  //   expect(itemFinder, findsOneWidget);
  // });
}
