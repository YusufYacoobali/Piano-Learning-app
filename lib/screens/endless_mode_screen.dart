import 'package:flutter/material.dart';
import '../components/endless_mode_components/endless_mode_end.dart';
import '../components/endless_mode_components/endless_score_counter.dart';
import '../components/endless_mode_components/clef_choice.dart';
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

  /// The clef chooser overlay
  late final OverlayEntry _startMenu;

  /// The end screen overlay
  late final OverlayEntry _endScreen;

  /// Whether the end screen is to be shown
  bool _hasEnded = false;

  /// The score keeper
  final EndlessScoreCounter _counter = EndlessScoreCounter();

  @override
  void initState() {
    super.initState();
    _currentNoteToPlay = NotePlayedChecker(_noteToPlay, stop);
    _sheet = MovingMusicSheet(_nextNote, Clef.treble, _currentNoteToPlay);
    _generator = EndlessNoteGenerator(_sheet, _nextNote, updateScreen);

    _endScreen = OverlayEntry(
      builder: (context) => EndlessModeEnd(
        removeMenu: removeEndScreen,
        numRight: _counter.score,
        highScore: _counter.highScore,
      ),
    );

    _startMenu = OverlayEntry(
      builder: (context) => ClefChoice(
        removeMenu: removeStartMenu,
      ),
    );

    /// Displays the start menu
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => showStartMenu());
  }

  @override
  void dispose() {
    super.dispose();
    _generator.stop();

    /// Gets rid of the overlays if they are visible
    if (_startMenu.mounted) {
      _startMenu.remove();
    }
    if (_endScreen.mounted) {
      _endScreen.remove();
    }
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

  /// Shows the start menu
  void showStartMenu() {
    final overlay = Overlay.of(context)!;
    overlay.insert(_startMenu);
  }

  /// Removes the start menu
  void removeStartMenu(Clef clef) {
    _counter.getHighScore(clef);
    _generator.setClef(clef);
    _sheet.changeClef(clef);
    _generator.start();
    _startMenu.remove();
  }

  /// Shows the end screen
  void showEndScreen() {
    final overlay = Overlay.of(context)!;
    overlay.insert(_endScreen);
  }

  /// Removes the end screen
  void removeEndScreen() {
    _endScreen.remove();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => {
      if (_hasEnded) showEndScreen()
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
