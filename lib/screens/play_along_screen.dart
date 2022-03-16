import 'package:flutter/material.dart';

import '../components/keyboard.dart';
import '../components/sheet_music_components/note_played_checker.dart';
import '../components/sheet_music_components/moving_music_sheet.dart';
import '../components/sheet_music_components/note.dart';
import '../components/sheet_music_components/play_along_note_display.dart';

/// The screen that runs the "play along" practice mode with a given track.
///
/// The track is selected by the user, then passed in to this screen.
class _PlayAlongScreenState extends State<PlayAlongScreen> {
  late final MovingMusicSheet _sheet;
  late PlayAlongNoteDisplay _timer;

  final NextNoteNotifier _nextNote = NextNoteNotifier();
  final NextNoteNotifier _noteToPlay = NextNoteNotifier();
  late final NotePlayedChecker _currentNoteToPlay;

  String hit = '';

  String updater = "";

  bool exit = false;


  void updateScreen(String update) {
    setState(() {
      updater = update;
    });
  }

  ///TODO: Replace with analytics with the notes
  void recordHitMiss(bool hasPlayed) {
  }

  @override
  void initState() {
    super.initState();
    _currentNoteToPlay = NotePlayedChecker(_noteToPlay, recordHitMiss);
    _sheet = MovingMusicSheet(_nextNote, widget.clef, _currentNoteToPlay);
    _timer = PlayAlongNoteDisplay(
        sheet: _sheet,
        nextNote: _nextNote,
        updateFunction: updateScreen,
        notes: widget.notes,
        bpm: widget.bpm,
    );
    _timer.start();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.stop();
  }

  /// Gets the key pressed on the keyboard
  void playKey(String text) {
    String level = '4';
    if (_sheet.getClef() == Clef.bass) {
      level = '3';
    }
    _currentNoteToPlay.checkPress(text + level);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Keyboard(function: playKey),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayAlongScreen extends StatefulWidget {
  static const String id = 'play_along_screen';
  final Map<int, Note> notes;
  final Clef clef;
  final int bpm;

  const PlayAlongScreen({Key? key, required this.notes, required this.clef, required this.bpm}) : super(key: key);

  @override
  _PlayAlongScreenState createState() => _PlayAlongScreenState();
}
