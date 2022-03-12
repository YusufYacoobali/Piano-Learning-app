import 'package:flutter/material.dart';
import '../components/clef_choice.dart';
import '../components/sheet_music_components/endless_note_generator.dart';
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

  String updater = "";

  bool exit = false;

  late final OverlayEntry? entry;

  void updateScreen(String update) {
    setState(() {
      updater = update;
    });
  }

  void stop(bool hasPlayed) {
    if (!hasPlayed) {
      _generator.stop();
    }
  }

  @override
  void initState() {
    super.initState();
    _currentNoteToPlay = NotePlayedChecker(_noteToPlay, stop);
    _sheet = MovingMusicSheet(_nextNote, Clef.treble, _currentNoteToPlay);
    _generator = EndlessNoteGenerator(_sheet, _nextNote, updateScreen);
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => showMenu());
  }

  @override
  void dispose() {
    super.dispose();
    _generator.stop();
  }

  void showMenu() {
    final overlay = Overlay.of(context)!;

    entry = OverlayEntry(
      builder: (context) => ClefChoice(
        removeMenu: removeMenu,
      ),
    );
    overlay.insert(entry!);
  }

  void removeMenu(Clef clef) {
    _generator.setClef(clef);
    _sheet.changeClef(clef);
    _generator.start();
    entry?.remove();
    entry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Endless Mode'),
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

class EndlessModeScreen extends StatefulWidget {
  static const String id = 'endless_mode_screen';

  const EndlessModeScreen({Key? key}) : super(key: key);

  @override
  _EndlessModeScreenState createState() => _EndlessModeScreenState();
}
