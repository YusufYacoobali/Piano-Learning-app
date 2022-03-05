import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../components/keyboard.dart';
import '../components/sheet_music_components/music_sheet.dart';
import '../components/sheet_music_components/note.dart';
import '../components/sheet_music_components/progress_timer.dart';
import '../constants.dart';

/// Temporary proof of concept screen for moving notes along
class KeyboardSheetScreenState extends State<KeyboardSheetScreen> {
  late final MusicSheet _sheet;
  late ProgressTimer _timer;
  bool _isStarted = false;

  final NextNote _nextNote = NextNote();

  final player = AudioCache();

  void playSound(String noteName) => player.play('note_$noteName.wav');

  void rebuild() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _sheet = MusicSheet(_nextNote, MusicSheetModes.playAlong, Clef.treble);
    _timer = ProgressTimer(_sheet, _nextNote, this);
  }

  @override
  void dispose() {
    super.dispose();
    _timer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sheet Music'),
        actions: [
          ElevatedButton(
              child: const Text('Go to another demo'),
              onPressed: () {
                Navigator.pushNamed(context, 'note_selector_sheet_screen');
              }),
          ElevatedButton(
              child: const Text('Start'),
              onPressed: () {
                if (!_isStarted) {
                  _isStarted = true;
                  setState(() {
                    _timer.start();
                  });
                }
              }),
          ElevatedButton(
              child: const Text('Stop'),
              onPressed: () {
                if (_isStarted) {
                  _isStarted = false;
                  setState(() {
                    _timer.stop();
                  });
                }
              }),
          ElevatedButton(
              child: const Text('Increment'),
              onPressed: () {
                setState(() {
                  _timer.increment();
                });
              }),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Scaffold(
                body: CustomPaint(
                  painter: _sheet,
                  child: Container(),
                ),
              ),
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

class KeyboardSheetScreen extends StatefulWidget {
  static const String id = 'keyboard_sheet_screen';

  const KeyboardSheetScreen({Key? key}) : super(key: key);

  @override
  KeyboardSheetScreenState createState() => KeyboardSheetScreenState();
}
