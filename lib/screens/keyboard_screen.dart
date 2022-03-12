import 'package:flutter/material.dart';
import '../components/keyboard.dart';

/// Screen with keyboard
class _KeyboardScreenState extends State<KeyboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 5, child: Container()),
            Expanded(
              flex: 3,
              child: Keyboard().build(context),
            ),
          ],
        ),
      ),
    );
  }
}

class KeyboardScreen extends StatefulWidget {
  /// ID of the keyboard screen
  static const String id = 'keyboard_screen';

  const KeyboardScreen({Key? key}) : super(key: key);

  @override
  _KeyboardScreenState createState() => _KeyboardScreenState();
}
