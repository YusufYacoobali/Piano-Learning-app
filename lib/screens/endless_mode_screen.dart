import 'package:flutter/material.dart';

import '../components/in_app_notification_pop_up.dart';
import '../components/pop_up_components/pop_up_controller.dart';
import '../components/endless_mode_components/endless_score_counter.dart';
import '../components/endless_mode_components/endless_note_generator.dart';
import '../components/page_keyboard.dart';
import '../components/pop_ups/endless_ending_pop_up.dart';
import '../components/pop_ups/endless_starting_pop_up.dart';
import '../components/sheet_music_components/note_played_checker.dart';
import '../components/sheet_music_components/moving_music_sheet.dart';
import '../components/sheet_music_components/note.dart';
import '../storage_reader_writer.dart';

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

  /// The controller for the end menu
  late final PopUpController _endMenu;

  /// The difficulty
  late final String _difficulty;

  /// Reads and writes to the storage
  StorageReaderWriter storage = StorageReaderWriter();

  /// The keyboard
  late PageKeyboard _keyboard;

  /// Updates the keyboard depending on the clef
  String _setClef = 'update';

  @override
  void initState() {
    super.initState();
    _keyboard = PageKeyboard(playKey);
    _currentNoteToPlay =
        NotePlayedChecker(noteNotifier: _noteToPlay, onNotePass: stop);
    _sheet = MovingMusicSheet(
        nextNote: _nextNote,
        clef: Clef.treble,
        notePlayedChecker: _currentNoteToPlay);
    _generator = EndlessNoteGenerator(
        sheet: _sheet, nextNote: _nextNote, updater: updateScreen);
    getDifficulty();

    EndlessStartingInstructions startMenuBuilder =
        EndlessStartingInstructions(context: context, onStart: startGame);
    EndlessEndingInstructions endMenuBuilder =
        EndlessEndingInstructions(context: context, counter: _counter);

    _startMenu =
        PopUpController(context: context, menuBuilder: startMenuBuilder);
    _endMenu = PopUpController(context: context, menuBuilder: endMenuBuilder);

    /// Displays the start menu
    WidgetsBinding.instance?.addPostFrameCallback((_) => _startMenu.show());
  }

  @override
  void dispose() {
    super.dispose();
    _generator.stop();
    _startMenu.delete();
    _endMenu.delete();
  }

  void getDifficulty() {
    StorageReaderWriter writer = StorageReaderWriter();
    writer.loadDataFromStorage().then((value) {
      _difficulty = writer.read('difficulty').toString();
      _generator.setDifficulty(_difficulty);
    });
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
  void startGame(Clef clef) {
    if (clef == Clef.bass) {
      _keyboard = PageKeyboard(playKey, startOctave: 3);
      _setClef = _setClef + '1';
    }
    _counter.getHighScore(clef, _difficulty);
    _generator.setClef(clef);
    _sheet.changeClef(clef);
    _generator.start();
  }

  /// Gets the key pressed on the keyboard
  void playKey(String text) {
    _currentNoteToPlay.checkPress(text);
  }

  end() async {
    // bool displayNotification = await storage.displayEndlessNotification(
    //     _difficulty, _counter.score, _sheet.getClef());
    // if (displayNotification) {
    //   inAppNotification(context);
    // }
    _endMenu.show();
    List displayNotification = await storage.displayEndlessNotification(
        _difficulty, _counter.score, _sheet.clef);
    if (displayNotification[0]) {
      inAppNotification(context, displayNotification[1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    //bool display = storage.displayEndless();
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => {if (_hasEnded) end()});
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
              key: Key(_setClef),
              flex: 3,
              child: _keyboard,
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
