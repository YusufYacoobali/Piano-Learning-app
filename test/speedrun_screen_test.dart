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
    expect(find.text('C'), findsOneWidget);
    expect(find.text('D'), findsOneWidget);
    expect(find.text('E'), findsOneWidget);
    expect(find.text('F'), findsOneWidget);
    expect(find.text('G'), findsOneWidget);
  });

//  TODO: unsure of how to make it wait for 10 seconds so timer finishes
  // testWidgets('Check that the results screen appears when timer is finished',
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(
  //     const MaterialApp(
  //       home: SpeedrunScreen(timerDuration: 10),
  //     ),
  //   );
  //   //expect(find.byType(CircularCountDownTimer), findsOneWidget);
  //   //await Future.delayed(const Duration(seconds: 12), () {});
  //   //sleep(const Duration(seconds: 12));
  //   // fakeAsync((async) {
  //   //   // All asynchronous features that rely on timing are automatically
  //   //   // controlled by [fakeAsync].
  //   //   expect(new Completer().future.timeout(new Duration(seconds: 12)),
  //   //       throwsA(isInstanceOf<TimeoutException>()));

  //   //   // This will cause the timeout above to fire immediately, without waiting
  //   //   // 5 seconds of real time.
  //   //   async.elapse(new Duration(seconds: 12));
  //   // });

  //   expect(find.text('Exit'), findsOneWidget);
  // });

  // testWidgets('check that the next question is displayed',
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: SpeedrunScreen(
  //         timerDuration: 10,
  //       ),
  //     ),
  //   );
  //   await tester.tap(find.text('B'));
  //   await tester.pumpAndSettle();
  //   await tester.tap(find.text('B'));
  //   expect(find.text('B'), findsOneWidget);
  // });

  // testWidgets('check that the results screen is displayed',
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: SpeedrunScreen(
  //         timerDuration: 10,
  //       ),
  //     ),
  //   );
  //   await tester.pumpAndSettle();
  //   await tester.pump(const Duration(milliseconds: 10000));
  //   // for (int i = 0; i < 10; i++) {
  //   //   await tester.tap(find.text('B'));
  //   //   await tester.pumpAndSettle();
  //   //   await tester.tap(find.text('Next'));
  //   //   await tester.pumpAndSettle();
  //   // }
  //   // await tester.tap(find.text('B'));
  //   // await tester.pumpAndSettle();
  //   // await tester.tap(find.text('Finish'));
  //   // await tester.pumpAndSettle();
  //   expect(find.text("Aww, better luck next time!"), findsOneWidget);
  // });
}
