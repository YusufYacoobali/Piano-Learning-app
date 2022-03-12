import 'package:flutter/material.dart';

import '../components/sheet_music_components/keyboard_with_play_along.dart';
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

  final Map<int, Note> _notes;

  _PlayAlongScreenState(this._notes);

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
    _sheet = MovingMusicSheet(_nextNote, Clef.treble, _currentNoteToPlay);
    _timer = PlayAlongNoteDisplay(_sheet, _nextNote, updateScreen, _notes);
    _timer.start();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.stop();
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
              child: KeyboardWithPlayAlong(_sheet, _currentNoteToPlay),
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

  const PlayAlongScreen({Key? key, required this.notes}) : super(key: key);

  @override
  _PlayAlongScreenState createState() => _PlayAlongScreenState(notes);
}
