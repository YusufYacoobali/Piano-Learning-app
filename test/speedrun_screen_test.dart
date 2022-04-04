import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/screens/speedrun_screen.dart';

void main() {
  testWidgets('Check that the timer is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SpeedrunScreen(timerDuration: 10),
      ),
    );
    expect(find.byType(CircularCountDownTimer), findsOneWidget);
    expect(find.text('D'), findsOneWidget);
  });

  testWidgets('Check that the pause button is not displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SpeedrunScreen(timerDuration: 10),
      ),
    );
    expect(find.byIcon(Icons.pause), findsNothing);
  });

  testWidgets('Check that the options are displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SpeedrunScreen(
          timerDuration: 10,
        ),
      ),
    );
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    expect(find.text('C4'), findsOneWidget);
    expect(find.text('D'), findsOneWidget);
    expect(find.text('E'), findsOneWidget);
    expect(find.text('F'), findsOneWidget);
    expect(find.text('G'), findsOneWidget);
  });
}
