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

  Widget getWhiteKey(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        child: Column(
          children: [
            const Spacer(),
            Text(
              buttonText,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          minimumSize: const Size(double.infinity, double.infinity),
          padding: const EdgeInsets.all(20.0),
        ),
      ),
    );
  }

  List<Widget> getWhiteKeys() {
    List<Widget> whiteKeys = [];
    List<String> notes = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
    for (int i = 0; i < notes.length; ++i) {
      whiteKeys.add(getWhiteKey(notes[i]));
    }
    return whiteKeys;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              // TODO: Add music sheet to play on keyboard
              child: Container(),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.black,
                child: Row(
                  children: getWhiteKeys(),
                ),
              ),
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

// Old template code
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// const Text(
// 'KEYBOARD PAGE',
// ),
// ElevatedButton(
// onPressed: () {},
// child: const Text('EMPTY'),
// ),
// ],
// )
