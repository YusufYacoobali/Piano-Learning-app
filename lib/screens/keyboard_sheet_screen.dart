import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:sight_reading_app/screens/note_selector_sheet_screen.dart';
import '../components/keyboard.dart';
import '../components/sheet_music_components/music_sheet.dart';
import '../components/sheet_music_components/note.dart';
import '../components/sheet_music_components/progress_timer.dart';

/// Temporary proof of concept screen for moving notes along
class KeyboardSheetScreenState extends State<KeyboardSheetScreen> {
  late final MusicSheet _sheet;
  late ProgressTimer _timer;
  bool _isStarted = false;

  final NextNoteNotifier _nextNote = NextNoteNotifier();

  final player = AudioCache();

  String updater = "";

  void playSound(String noteName) => player.play('note_$noteName.wav');

  void updateScreen(String update) {
    setState(() {
      updater = update;
    });
  }

  @override
  void initState() {
    super.initState();
    _sheet = MusicSheet(_nextNote, MusicSheetModes.playAlong, Clef.treble);
    _timer = ProgressTimer(_sheet, _nextNote, updateScreen);
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
                Navigator.pushNamed(context, NoteSelectorSheetScreen.id);
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
                  child: Container(key: Key(updater)),
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
