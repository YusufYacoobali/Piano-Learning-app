import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/endless_mode_components/endless_mode_end.dart';
import 'package:sight_reading_app/components/endless_mode_components/endless_score_counter.dart';
import '../components/endless_mode_components/clef_choice.dart';
import '../components/endless_mode_components/endless_note_generator.dart';
import '../components/sheet_music_components/keyboard_with_play_along.dart';
import '../components/sheet_music_components/note_played_checker.dart';
import '../components/sheet_music_components/moving_music_sheet.dart';
import '../components/sheet_music_components/note.dart';

class _EndlessModeScreenState extends State<EndlessModeScreen> {
  late final MovingMusicSheet _sheet;
  late EndlessNoteGenerator _generator;

  final NextNoteNotifier _nextNote = NextNoteNotifier();
  final NextNoteNotifier _noteToPlay = NextNoteNotifier();
  late final NotePlayedChecker _currentNoteToPlay;

  String hit = '';

  String updater = '';

  bool exit = false;

  late final OverlayEntry _startMenu;
  late final OverlayEntry _endScreen;

  bool _hasEnded = false;

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
        removeMenu: removeMenu,
      ),
    );

    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => showMenu());
  }

  @override
  void dispose() {
    super.dispose();
    _generator.stop();

    if (_startMenu.mounted) {
      _startMenu.remove();
    }
    if (_endScreen.mounted) {
      _endScreen.remove();
    }
  }

  void updateScreen(String update) {
    setState(() {
      updater = update;
    });
  }

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

  void showMenu() {
    final overlay = Overlay.of(context)!;
    overlay.insert(_startMenu);
  }

  void removeMenu(Clef clef) {
    _counter.getHighScore(clef);
    _generator.setClef(clef);
    _sheet.changeClef(clef);
    _generator.start();
    _startMenu.remove();
  }

  void showEndScreen() {
    final overlay = Overlay.of(context)!;
    overlay.insert(_endScreen);
  }

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
