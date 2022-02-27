import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  // TODO: Test for buttons should be updated to not depend on text on buttons
  testWidgets('check that the option button 1 is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    expect(find.text('C'), findsOneWidget);
  });

  testWidgets('check that the option button 2 is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    expect(find.text('D'), findsOneWidget);
  });

  testWidgets('check that the option button 3 is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    expect(find.text('E'), findsOneWidget);
  });

  testWidgets('check that the option button 4 is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    expect(find.text('F'), findsOneWidget);
  });

  testWidgets('check that the option button 5 is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    expect(find.text('G'), findsOneWidget);
  });

  testWidgets('check that the option button 6 is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    expect(find.text('A'), findsOneWidget);
  });

  testWidgets('check that the option button 7 is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    expect(find.text('B'), findsOneWidget);
  });
}