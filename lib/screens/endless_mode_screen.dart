import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/endless_mode_components/display_intermediate_menus.dart';
import '../components/endless_mode_components/endless_score_counter.dart';
import '../components/endless_mode_components/endless_note_generator.dart';
import '../components/sheet_music_components/keyboard_with_play_along.dart';
import '../components/sheet_music_components/note_played_checker.dart';
import '../components/sheet_music_components/moving_music_sheet.dart';
import '../components/sheet_music_components/note.dart';

class _EndlessModeScreenState extends State<EndlessModeScreen> {
  /// Music sheet that moves
  late final MovingMusicSheet _sheet;

  /// Generates the next notes and keeps time
  late EndlessNoteGenerator _generator;

  /// Next note to be displayed notifier
  final NextNoteNotifier _nextNote = NextNoteNotifier();

  /// Note in the area to be played notifier
  final NextNoteNotifier _noteToPlay = NextNoteNotifier();
  late final NotePlayedChecker _currentNoteToPlay;

  /// The key string that updates the screen
  String updater = '';

  /// Whether the end screen is to be shown
  bool _hasEnded = false;

  /// The score keeper
  final EndlessScoreCounter _counter = EndlessScoreCounter();

  /// The controller for the menus
  late final DisplayIntermediateMenus _intermediateMenus;

  @override
  void initState() {
    super.initState();
    _currentNoteToPlay = NotePlayedChecker(noteNotifier: _noteToPlay, function: stop);
    _sheet = MovingMusicSheet(nextNote: _nextNote, clef: Clef.treble, notePlayedChecker: _currentNoteToPlay);
    _generator = EndlessNoteGenerator(sheet: _sheet, nextNote: _nextNote, updater: updateScreen);
    _intermediateMenus = DisplayIntermediateMenus(context: context, counter: _counter, onStart: startGame);

    /// Displays the start menu
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => _intermediateMenus.showStartMenu());
  }

  @override
  void dispose() {
    super.dispose();
    _generator.stop();
    _intermediateMenus.deleteScreens();
  }

  /// Updates the screen
  void updateScreen(String update) {
    setState(() {
      updater = update;
    });
  }

  /// The function to be called on each note moving out of the target area
  void stop(bool hasPlayed) {
    if (!hasPlayed) {
      _generator.stop();
      _hasEnded = true;
      _counter.isNewHighScore(_sheet.clef);
    }
    else {
      _counter.score++;
    }
  }

  /// Starts the endless mode game
  void startGame(Clef clef) {
    _counter.getHighScore(clef);
    _generator.setClef(clef);
    _sheet.changeClef(clef);
    _generator.start();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => {
      if (_hasEnded) _intermediateMenus.showEndMenu()
    });
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Scaffold(
                body: CustomPaint(
                  painter: _sheet,
                  child: Container(key: Key(updater),
                  ),
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

class EndlessModeScreen extends StatefulWidget {
  static const String id = 'endless_mode_screen';

  const EndlessModeScreen({Key? key}) : super(key: key);

  @override
  _EndlessModeScreenState createState() => _EndlessModeScreenState();
}
