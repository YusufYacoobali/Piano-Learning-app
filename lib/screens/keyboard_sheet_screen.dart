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

  // Treble clef notes
  final Map<int, Note> _notes = <int, Note>{
    0: Note(name: 'Cb4', duration: 1),
    2: Note(name: 'D4', duration: 1.5),
    5: Note(name: 'E4', duration: 0.5),
    8: Note(name: 'F#4', duration: 2),
    13: Note(name: 'G4', duration: 3),
    18: Note(name: 'A4', duration: 3),
    23: Note(name: 'B4', duration: 4),
    26: Note(name: 'C5', duration: 0.5),
    29: Note(name: 'D5', duration: 3),
    32: Note(name: 'E5', duration: 1),
  };

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
    _currentNoteToPlay = NotePlayedChecker(noteNotifier: _noteToPlay, function: convertHitToString);
    super.initState();
    _sheet = MovingMusicSheet(nextNote: _nextNote, clef: Clef.treble, notePlayedChecker: _currentNoteToPlay);
    _timer = ProgressTimer(_sheet, _nextNote, updateScreen, _notes);
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
