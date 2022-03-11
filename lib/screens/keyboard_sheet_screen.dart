import 'package:flutter/material.dart';
import '../components/sheet_music_components/keyboard_with_play_along.dart';
import '../components/sheet_music_components/note_played_checker.dart';
import '../screens/note_selector_sheet_screen.dart';
import '../components/sheet_music_components/moving_music_sheet.dart';
import '../components/sheet_music_components/note.dart';
import '../components/sheet_music_components/progress_timer.dart';

/// Temporary proof of concept screen for moving notes along
class KeyboardSheetScreenState extends State<KeyboardSheetScreen> {
  late final MovingMusicSheet _sheet;
  late ProgressTimer _timer;
  bool _isStarted = false;

  final NextNoteNotifier _nextNote = NextNoteNotifier();
  final NextNoteNotifier _noteToPlay = NextNoteNotifier();
  late final NotePlayedChecker _currentNoteToPlay;

  String hit = '';

  String updater = "";

  void updateScreen(String update) {
    setState(() {
      updater = update;
    });
  }

  void convertHitToString(bool isHit) {
    if (isHit) {
      hit = 'Hit';
    }
    else {
      hit = 'Miss';
    }
  }

  @override
  void initState() {
    _currentNoteToPlay = NotePlayedChecker(_noteToPlay, convertHitToString);
    super.initState();
    _sheet = MovingMusicSheet(_nextNote, Clef.treble, _currentNoteToPlay);
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
          Text(hit),
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
              child: KeyboardWithPlayAlong(_sheet, _currentNoteToPlay),
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
