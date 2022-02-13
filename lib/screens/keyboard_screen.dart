import 'package:flutter/material.dart';

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'KEYBOARD PAGE',
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('EMPTY'),
            ),
          ],
        ),
      ),
    );
  }
}

class KeyboardScreen extends StatefulWidget {
  static const String id = 'keyboard_screen';

  const KeyboardScreen({Key? key}) : super(key: key);

  @override
  _KeyboardScreenState createState() => _KeyboardScreenState();
}
