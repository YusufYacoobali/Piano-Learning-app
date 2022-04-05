import 'package:flutter/material.dart';
import '../components/notifications/in_app_notification_pop_up.dart';
import '../storage_reader_writer.dart';
import '../components/page_keyboard.dart';
import '../components/pop_up_components/pop_up_controller.dart';
import '../components/pop_ups/play_along_ending_pop_up.dart';
import '../components/sheet_music_components/note_played_checker.dart';
import '../components/sheet_music_components/moving_music_sheet.dart';
import '../components/sheet_music_components/note.dart';
import '../components/sheet_music_components/note_notifier.dart';
import '../components/play_along_components/play_along_hit_counter.dart';
import '../components/play_along_components/play_along_song_timer.dart';

class PlayAlongScreen extends StatefulWidget {
  static const String id = 'play_along_screen';

  /// The song notes that are to be played
  final Map<int, Note> notes;

  /// The clef of the song
  final Clef clef;

  /// How fast the song moves
  final int bpm;

  /// The song name
  final String songName;

  /// When the song is restarted
  final VoidCallback onBackToPlayAlongMenu;

  /// The difficulty of the track
  final String difficulty;

  const PlayAlongScreen(
      {Key? key,
      required this.notes,
      required this.clef,
      required this.difficulty,
      required this.bpm,
      required this.songName,
      required this.onBackToPlayAlongMenu})
      : super(key: key);

  @override
  _PlayAlongScreenState createState() => _PlayAlongScreenState();
}

/// The screen that runs the "play along" practice mode with a given track.
///
/// The track is selected by the user, then passed in to this screen.
class _PlayAlongScreenState extends State<PlayAlongScreen> {
  /// The music sheet
  late final MovingMusicSheet _sheet;

  /// The timer that controls the song movement and note display
  late final PlayAlongSongTimer _timer;

  /// Keeps the score of number of notes hit
  late final PlayAlongHitCounter _hitCounter;

  /// Displays the next note on the screen
  final NextNoteNotifier _nextNote = NextNoteNotifier();

  /// The next note in the play area
  final NextNoteNotifier _noteToPlay = NextNoteNotifier();

  /// Checks if the note is played when a key is pressed
  late final NotePlayedChecker _currentNoteToPlay;

  /// The text that updates the screen
  String updater = '';

  /// Whether the song has stopped
  bool exit = false;

  /// The end menu
  late PopUpController _endMenu;

  /// Reads and writes from storage
  StorageReaderWriter storage = StorageReaderWriter();

  /// Updates the screen
  void updateScreen(String update) {
    setState(() {
      updater = update;
    });
  }

  /// Records if the note has been hit or not
  void recordHitMiss(bool hasPlayed) {
    if (hasPlayed) _hitCounter.increment();
  }

  @override
  void initState() {
    super.initState();
    _hitCounter = PlayAlongHitCounter(
        songName: widget.songName, numNotes: widget.notes.length);

    /// Sets up the end menu
    PlayAlongEndingInstructions endMenuBuilder = PlayAlongEndingInstructions(
        context: context,
        restart: reset,
        hitCounter: _hitCounter,
        onBack: widget.onBackToPlayAlongMenu);
    _endMenu = PopUpController(context: context, menuBuilder: endMenuBuilder);

    /// Sets up the music sheet
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

    _timer.setDifficulty(widget.difficulty);
    _hitCounter.setDifficulty(widget.difficulty);
    _timer.start();
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
    List displayNotification = await storage.displayPlayAlongNotification(
      widget.difficulty,
      widget.songName.toString(),
      _hitCounter,
    );
    if (displayNotification[0]) {
      inAppNotification(context, displayNotification[1],
          onBack: () => _endMenu.show());
    } else {
      _endMenu.show();
    }
  }

  /// Gets the key pressed on the keyboard
  void playKey(String text) {
    _currentNoteToPlay.checkPress(text);
  }

  @override
  Widget build(BuildContext context) {
    /// Sets the default keyboard octave
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
