import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../components/keyboard.dart';

class _KeyboardScreenState extends State<KeyboardScreen> {
  final player = AudioCache();

  void playSound(String noteName) => player.play('note_$noteName.wav');

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
            Expanded(
                flex: 5,
                child: Container()
            ),
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
  static const String id = 'keyboard_screen';

  const KeyboardScreen({Key? key}) : super(key: key);

  @override
  _KeyboardScreenState createState() => _KeyboardScreenState();
}
