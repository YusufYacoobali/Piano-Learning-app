// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:sight_reading_app/main.dart';
// import 'package:flutter/services.dart';

// TODO: Add tests for music sheet to play

// TODO: Add tests where keys are pressed

void main() {
  // Moves the tester to the keyboard screen page
  // TODO: Change method once keyboard screen is properly linked up
  // Future<void> _navigateToKeyboardScreen(WidgetTester tester) async {
  //   await tester.pumpWidget(const SightReadingApp());
  //   await tester.tap(find.text('TEMPORARY Click to go to Keyboard Screen'));
  //   await tester.pumpAndSettle();
  // }

  // Future<void> _checkKeyboardPressMakesSound(WidgetTester tester, String key) async {
  //   TestWidgetsFlutterBinding.ensureInitialized();
  //   final List<MethodCall> log = <MethodCall>[];
  //   TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, (MethodCall methodCall) async {
  //     log.add(methodCall);
  //     return null;
  //   });
  //   await tester.tap(find.text(key));
  //   expect(log, hasLength(1));
  //   expect(log.single, isMethodCall('SystemSound.play', arguments: 'SystemSoundType.click'));
  // }

  // testWidgets('Check that there are a total of 12 keys',
  //     (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   expect(find.byType(ElevatedButton), findsNWidgets(12));
  // });

  // testWidgets('Check that there is a C key', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   expect(find.text('C'), findsOneWidget);
  // });

  // testWidgets('Check that there is a Db key', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   expect(find.text('Db'), findsOneWidget);
  // });

  // testWidgets('Check that there is a D key', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   expect(find.text('D'), findsOneWidget);
  // });

  // testWidgets('Check that there is an Eb key', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   expect(find.text('Eb'), findsOneWidget);
  // });

  // testWidgets('Check that there is an E key', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   expect(find.text('E'), findsOneWidget);
  // });

  // testWidgets('Check that there is a F key', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   expect(find.text('F'), findsOneWidget);
  // });

  // testWidgets('Check that there is a Gb key', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   expect(find.text('Gb'), findsOneWidget);
  // });

  // testWidgets('Check that there is a G key', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   expect(find.text('G'), findsOneWidget);
  // });

  // testWidgets('Check that there is an Ab key', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   expect(find.text('Ab'), findsOneWidget);
  // });

  // testWidgets('Check that there is an A key', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   expect(find.text('A'), findsOneWidget);
  // });

  // testWidgets('Check that there is a Bb key', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   expect(find.text('Bb'), findsOneWidget);
  // });

  // testWidgets('Check that there is a B key', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   expect(find.text('B'), findsOneWidget);
  // });

  // testWidgets('Check that pressing C makes a sound', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   await _checkKeyboardPressMakesSound(tester, 'C');
  // });

  // testWidgets('Check that pressing Db makes a sound', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   await _checkKeyboardPressMakesSound(tester, 'Db');
  // });

  // testWidgets('Check that pressing D makes a sound', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   await _checkKeyboardPressMakesSound(tester, 'D');
  // });

  // testWidgets('Check that pressing Eb makes a sound', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   await _checkKeyboardPressMakesSound(tester, 'Eb');
  // });

  // testWidgets('Check that pressing E makes a sound', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   await _checkKeyboardPressMakesSound(tester, 'E');
  // });

  // testWidgets('Check that pressing F makes a sound', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   await _checkKeyboardPressMakesSound(tester, 'F');
  // });

  // testWidgets('Check that pressing Gb makes a sound', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   await _checkKeyboardPressMakesSound(tester, 'Gb');
  // });

  // testWidgets('Check that pressing G makes a sound', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   await _checkKeyboardPressMakesSound(tester, 'G');
  // });

  // testWidgets('Check that pressing Ab makes a sound', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   await _checkKeyboardPressMakesSound(tester, 'Ab');
  // });

  // testWidgets('Check that pressing A makes a sound', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   await _checkKeyboardPressMakesSound(tester, 'A');
  // });

  // testWidgets('Check that pressing B makes a sound', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   await _checkKeyboardPressMakesSound(tester, 'B');
  // });

  // testWidgets('Check that pressing Bb makes a sound', (WidgetTester tester) async {
  //   await _navigateToKeyboardScreen(tester);
  //   await _checkKeyboardPressMakesSound(tester, 'Bb');
  // });
}
