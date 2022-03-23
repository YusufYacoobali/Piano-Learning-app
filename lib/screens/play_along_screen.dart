import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/keyboard.dart';
import '../components/pop_up_components/pop_up_controller.dart';
import '../components/instruction_pop_up_content/play_along_ending_instructions.dart';
import '../components/sheet_music_components/note_played_checker.dart';
import '../components/sheet_music_components/moving_music_sheet.dart';
import '../components/sheet_music_components/note.dart';
import '../components/sheet_music_components/play_along_song_timer.dart';

/// The screen that runs the "play along" practice mode with a given track.
///
/// The track is selected by the user, then passed in to this screen.
class _PlayAlongScreenState extends State<PlayAlongScreen> {
  late final MovingMusicSheet _sheet;
  late PlayAlongSongTimer _timer;

  final NextNoteNotifier _nextNote = NextNoteNotifier();
  final NextNoteNotifier _noteToPlay = NextNoteNotifier();
  late final NotePlayedChecker _currentNoteToPlay;

  String hit = '';

  String updater = '';

  bool exit = false;

  late final PopUpController _endMenu;

  void updateScreen(String update) {
    setState(() {
      updater = update;
    });
  }

  void getDifficulty() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String difficulty = pref.get('difficulty')!.toString();
    _timer.setDifficulty(difficulty);
    _timer.start();
  }

  ///TODO: Replace with analytics with the notes
  void recordHitMiss(bool hasPlayed) {}

  @override
  void initState() {
    super.initState();
    PlayAlongEndingInstructions endMenuBuilder = PlayAlongEndingInstructions(
        context: context, restart: () => _timer.restart());
    _endMenu = PopUpController(context: context, menuBuilder: endMenuBuilder);
    _currentNoteToPlay =
        NotePlayedChecker(noteNotifier: _noteToPlay, function: recordHitMiss);
    _sheet = MovingMusicSheet(
        nextNote: _nextNote,
        clef: widget.clef,
        notePlayedChecker: _currentNoteToPlay);
    _timer = PlayAlongSongTimer(
      sheet: _sheet,
      nextNote: _nextNote,
      updater: updateScreen,
      notes: widget.notes,
      onStop: _displayMenu,
    );
    getDifficulty();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.stop();
    _endMenu.delete();
  }

  /// Displays the end menu
  void _displayMenu() {
    _endMenu.show();
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

  const PlayAlongScreen(
      {Key? key, required this.notes, required this.clef, required this.bpm})
      : super(key: key);

  @override
  _PlayAlongScreenState createState() => _PlayAlongScreenState();
}
