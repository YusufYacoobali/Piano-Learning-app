import 'moving_music_sheet.dart';
import 'note_notifier.dart';

abstract class MovingMusicSheetTimer {
  /// The music sheet
  final MovingMusicSheet sheet;

  /// The note notifier
  final NextNoteNotifier nextNote;

  /// The function to be called when a note has been hit or missed
  final Function updater;

  /// The amount of time between increments
  late final int timeBetweenMovements;

  /// The number of movements before the time unit changes
  late final int iterationsPerTimeUnit;

  /// How fast the notes move along the screen
  late int bpm;

  /// The difficulty level
  late final String difficulty;

  /// Whether the sheet is moving or not
  bool isOn = false;

  /// How far into the time unit we are
  int index = 0;

  /// Timing
  int time = 0;

  MovingMusicSheetTimer({
    required this.sheet,
    required this.nextNote,
    required this.updater,
  });

  void start();

  void stop();

  void increment();

  void setDifficulty(String difficulty);
}
