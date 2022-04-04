import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  // Moves the tester to the keyboard screen page
  Future<void> _navigateToAKeyboard(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Lesson 1'));
    await tester.pumpAndSettle();
  }

  Future<void> _checkKeyboardPressMakesSound(
      WidgetTester tester, String key) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final List<MethodCall> log = <MethodCall>[];
    TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform,
            (MethodCall methodCall) async {
      log.add(methodCall);
      return null;
    });
    await tester.tap(find.text(key));
    expect(log, hasLength(1));
    expect(log.single,
        isMethodCall('SystemSound.play', arguments: 'SystemSoundType.click'));
  }

  testWidgets('Check that there are a total of 12 keys',
      (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    expect(find.byType(ElevatedButton), findsNWidgets(12));
  });

  testWidgets('Check that there is a C4 key', (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    expect(find.text('C4'), findsOneWidget);
  });

  testWidgets('Check that there is a Db key', (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    expect(find.text('Db'), findsOneWidget);
  });

  testWidgets('Check that there is a D key', (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    expect(find.text('D'), findsOneWidget);
  });

  testWidgets('Check that there is an Eb key', (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    expect(find.text('Eb'), findsOneWidget);
  });

  testWidgets('Check that there is an E key', (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    expect(find.text('E'), findsOneWidget);
  });

  testWidgets('Check that there is a F key', (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    expect(find.text('F'), findsOneWidget);
  });

  testWidgets('Check that there is a Gb key', (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    expect(find.text('Gb'), findsOneWidget);
  });

  testWidgets('Check that there is a G key', (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    expect(find.text('G'), findsOneWidget);
  });

  testWidgets('Check that there is an Ab key', (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    expect(find.text('Ab'), findsOneWidget);
  });

  testWidgets('Check that there is an A key', (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    expect(find.text('A'), findsOneWidget);
  });

  testWidgets('Check that there is a Bb key', (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    expect(find.text('Bb'), findsOneWidget);
  });

  testWidgets('Check that there is a B key', (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    expect(find.text('B'), findsOneWidget);
  });

  testWidgets('Check that pressing C4 makes a sound',
      (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    await _checkKeyboardPressMakesSound(tester, 'C4');
  });

  testWidgets('Check that pressing Db makes a sound',
      (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    await _checkKeyboardPressMakesSound(tester, 'Db');
  });

  testWidgets('Check that pressing D makes a sound',
      (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    await _checkKeyboardPressMakesSound(tester, 'D');
  });

  testWidgets('Check that pressing Eb makes a sound',
      (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    await _checkKeyboardPressMakesSound(tester, 'Eb');
  });

  testWidgets('Check that pressing E makes a sound',
      (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    await _checkKeyboardPressMakesSound(tester, 'E');
  });

  testWidgets('Check that pressing F makes a sound',
      (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    await _checkKeyboardPressMakesSound(tester, 'F');
  });

  testWidgets('Check that pressing Gb makes a sound',
      (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    await _checkKeyboardPressMakesSound(tester, 'Gb');
  });

  testWidgets('Check that pressing G makes a sound',
      (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    await _checkKeyboardPressMakesSound(tester, 'G');
  });

  testWidgets('Check that pressing Ab makes a sound',
      (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    await _checkKeyboardPressMakesSound(tester, 'Ab');
  });

  testWidgets('Check that pressing A makes a sound',
      (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    await _checkKeyboardPressMakesSound(tester, 'A');
  });

  testWidgets('Check that pressing B makes a sound',
      (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    await _checkKeyboardPressMakesSound(tester, 'B');
  });

  testWidgets('Check that pressing Bb makes a sound',
      (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    await _checkKeyboardPressMakesSound(tester, 'Bb');
  });

  testWidgets(
      'Check that all key names appear on keyboard in beginner difficulty',
      (WidgetTester tester) async {
    await _navigateToAKeyboard(tester);
    expect(find.text('C4'), findsOneWidget);
    expect(find.text('D'), findsOneWidget);
    expect(find.text('E'), findsOneWidget);
    expect(find.text('F'), findsOneWidget);
    expect(find.text('G'), findsOneWidget);
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    expect(find.text('Db'), findsOneWidget);
    expect(find.text('Eb'), findsOneWidget);
    expect(find.text('Gb'), findsOneWidget);
    expect(find.text('Ab'), findsOneWidget);
    expect(find.text('Bb'), findsOneWidget);
  });

  testWidgets(
      'Check that black key names do not appear on keyboard in intermediate difficulty',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({'difficulty': 'Intermediate'});
    await _navigateToAKeyboard(tester);
    expect(find.text('C4'), findsNothing);
    expect(find.text('D'), findsNothing);
    expect(find.text('E'), findsNothing);
    expect(find.text('F'), findsNothing);
    expect(find.text('G'), findsNothing);
    expect(find.text('A'), findsNothing);
    expect(find.text('B'), findsNothing);
    expect(find.text('Db'), findsOneWidget);
    expect(find.text('Eb'), findsOneWidget);
    expect(find.text('Gb'), findsOneWidget);
    expect(find.text('Ab'), findsOneWidget);
    expect(find.text('Bb'), findsOneWidget);
  });

  testWidgets(
      'Check that none of the key names appear on keyboard in expert difficulty',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({'difficulty': 'Expert'});
    await _navigateToAKeyboard(tester);
    expect(find.text('C4'), findsNothing);
    expect(find.text('D'), findsNothing);
    expect(find.text('E'), findsNothing);
    expect(find.text('F'), findsNothing);
    expect(find.text('G'), findsNothing);
    expect(find.text('A'), findsNothing);
    expect(find.text('B'), findsNothing);
    expect(find.text('Db'), findsNothing);
    expect(find.text('Eb'), findsNothing);
    expect(find.text('Gb'), findsNothing);
    expect(find.text('Ab'), findsNothing);
    expect(find.text('Bb'), findsNothing);
  });
}
