import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/storage_reader_writer.dart';

import '../components/notifications/in_app_notification_pop_up.dart';
import '../components/page_keyboard.dart';
import '../components/pop_up_components/pop_up_controller.dart';
import '../components/pop_ups/play_along_ending_pop_up.dart';
import '../components/sheet_music_components/note_played_checker.dart';
import '../components/sheet_music_components/moving_music_sheet.dart';
import '../components/sheet_music_components/note.dart';
import '../components/play_along_components/play_along_hit_counter.dart';
import '../components/play_along_components/play_along_song_timer.dart';

/// The screen that runs the "play along" practice mode with a given track.
///
/// The track is selected by the user, then passed in to this screen.
class _PlayAlongScreenState extends State<PlayAlongScreen> {
  late final MovingMusicSheet _sheet;
  late final PlayAlongSongTimer _timer;

  late final PlayAlongHitCounter _hitCounter;

  final NextNoteNotifier _nextNote = NextNoteNotifier();
  final NextNoteNotifier _noteToPlay = NextNoteNotifier();
  late final NotePlayedChecker _currentNoteToPlay;

  String hit = '';

  String updater = '';

  bool exit = false;

  late PopUpController _endMenu;

  StorageReaderWriter storage = StorageReaderWriter();

  late String difficulty;

  void updateScreen(String update) {
    setState(() {
      updater = update;
    });
  }

  void getDifficulty() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    difficulty = pref.get('difficulty')!.toString();
    _timer.setDifficulty(difficulty);
    _timer.start();
    _hitCounter.setDifficulty(difficulty);
  }

  void recordHitMiss(bool hasPlayed) {
    if (hasPlayed) _hitCounter.increment();
  }

  @override
  void initState() {
    super.initState();
    _hitCounter = PlayAlongHitCounter(
        songName: widget.songName.toString(), numNotes: widget.notes.length);
    PlayAlongEndingInstructions endMenuBuilder = PlayAlongEndingInstructions(
        context: context,
        restart: reset,
        hitCounter: _hitCounter,
        onBack: widget.onBackToPlayAlongMenu);
    _endMenu = PopUpController(context: context, menuBuilder: endMenuBuilder);
    _currentNoteToPlay =
        NotePlayedChecker(noteNotifier: _noteToPlay, onNotePass: recordHitMiss);
    _sheet = MovingMusicSheet(
        nextNote: _nextNote,
        clef: widget.clef,
        notePlayedChecker: _currentNoteToPlay);
    _timer = PlayAlongSongTimer(
      sheet: _sheet,
      nextNote: _nextNote,
      updater: updateScreen,
      notes: widget.notes,
      bpm: widget.bpm,
      onStop: _displayMenu,
      hitCounter: _hitCounter,
    );
    getDifficulty();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.stop();
    _endMenu.delete();
  }

  /// Resets the state back to the start and starts the song again
  void reset() {
    _hitCounter.score = 0;
    PlayAlongEndingInstructions endMenuBuilder = PlayAlongEndingInstructions(
        context: context,
        restart: reset,
        hitCounter: _hitCounter,
        onBack: widget.onBackToPlayAlongMenu);
    _endMenu = PopUpController(context: context, menuBuilder: endMenuBuilder);
    _timer.restart();
  }

  /// Displays the end menu
  Future<void> _displayMenu() async {
    _hitCounter.isNewHighScore();
    _endMenu.show();
    List displayNotification = await storage.displayPlayAlongNotification(
      difficulty,
      widget.songName.toString(),
      _hitCounter,
    );
    if (displayNotification[0]) {
      inAppNotification(context, displayNotification[1]);
    }
  }

  /// Gets the key pressed on the keyboard
  void playKey(String text) {
    _currentNoteToPlay.checkPress(text);
  }

  @override
  Widget build(BuildContext context) {
    int octave = 4;
    if (widget.clef == Clef.bass) {
      octave = 3;
    }

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
              child: PageKeyboard(playKey, startOctave: octave),
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
  final String songName;

  final VoidCallback onBackToPlayAlongMenu;

  const PlayAlongScreen(
      {Key? key,
      required this.notes,
      required this.clef,
      required this.bpm,
      required this.songName,
      required this.onBackToPlayAlongMenu})
      : super(key: key);

  @override
  _PlayAlongScreenState createState() => _PlayAlongScreenState();
}
