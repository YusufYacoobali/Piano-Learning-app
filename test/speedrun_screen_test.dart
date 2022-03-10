void main() {
  _goToSpeedrunScreen(WidgetTester tester) async {
  await tester.pumpWidget(const SightReadingApp());
   await tester.tap(find.text('Practice'));
   await tester.pumpAndSettle();
  await tester.tap(find.text('Speedrun'));
  await tester.pumpAndSettle();
    await tester.tap(find.text('10 seconds'));
  await tester.pumpAndSettle();
  }

  testWidgets(
    'Check that the settings page is displayed when the button is pressed.',
   (WidgetTester tester) async {
   await _goToSpeedrunScreen(tester);
   await tester.pumpAndSettle();
  //expect(find.text('D'), findsOneWidget);
   expect(find.byType(CircularCountDownTimer), findsOneWidget);
   expect(find.text('D'), findsOneWidget);
   });
}
