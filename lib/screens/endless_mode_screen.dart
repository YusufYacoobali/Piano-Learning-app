import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/instruction_pop_up_content/endless_difficulty_selector.dart';

import '../components/pop_up_components/pop_up_controller.dart';
import '../components/endless_mode_components/endless_score_counter.dart';
import '../components/endless_mode_components/endless_note_generator.dart';
import '../components/keyboard.dart';
import '../components/instruction_pop_up_content/endless_ending_instructions.dart';
import '../components/instruction_pop_up_content/endless_starting_instructions.dart';
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

  /// The controller for the start menu
  late final PopUpController _startMenu;

  /// The controller for the difficulty menu
  late final PopUpController _difficultyMenu;

  /// The controller for the end menu
  late final PopUpController _endMenu;

  /// The clef selected
  late final Clef _clef;

  /// The clef selected
  late final String _difficulty;

  @override
  void initState() {
    super.initState();
    _currentNoteToPlay =
        NotePlayedChecker(noteNotifier: _noteToPlay, function: stop);
    _sheet = MovingMusicSheet(
        nextNote: _nextNote,
        clef: Clef.treble,
        notePlayedChecker: _currentNoteToPlay);
    _generator = EndlessNoteGenerator(
        sheet: _sheet, nextNote: _nextNote, updater: updateScreen);

    EndlessStartingInstructions startMenuBuilder =
        EndlessStartingInstructions(context: context, onStart: setClef);
    EndlessDifficultyInstructions difficultyBuilder =
        EndlessDifficultyInstructions(context: context, onSelection: startGame);
    EndlessEndingInstructions endMenuBuilder =
        EndlessEndingInstructions(context: context, counter: _counter);

    _startMenu = PopUpController(context: context, menuBuilder: startMenuBuilder);
    _difficultyMenu = PopUpController(context: context, menuBuilder: difficultyBuilder);
    _endMenu = PopUpController(context: context, menuBuilder: endMenuBuilder);

    /// Displays the start menu
    WidgetsBinding.instance?.addPostFrameCallback((_) => _startMenu.show());
  }

  @override
  void dispose() {
    super.dispose();
    _generator.stop();
    _startMenu.delete();
    _difficultyMenu.delete();
    _endMenu.delete();
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
      _counter.isNewHighScore(_sheet.clef, _difficulty);
    } else {
      _counter.score++;
    }
  }

  /// Starts the endless mode game
  void setClef(Clef clef) {
    _clef = clef;
    _sheet.changeClef(_clef);
    _difficultyMenu.show();
  }

  /// Starts the endless mode game
  void startGame(String difficulty) {
    _difficulty = difficulty;
    _counter.getHighScore(_clef, _difficulty);
    _generator.setDifficulty(difficulty);
    _generator.setClef(_clef);
    _generator.start();
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
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => {if (_hasEnded) _endMenu.show()});
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Scaffold(
                body: CustomPaint(
                  painter: _sheet,
                  child: Container(
                    key: Key(updater),
                  ),
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

class EndlessModeScreen extends StatefulWidget {
  static const String id = 'endless_mode_screen';

  const EndlessModeScreen({Key? key}) : super(key: key);

  @override
  _EndlessModeScreenState createState() => _EndlessModeScreenState();
}
