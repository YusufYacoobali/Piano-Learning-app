import 'dart:async';
import 'dart:math';
import '../../constants.dart' as constants;
import '../sheet_music_components/note.dart';
import '../sheet_music_components/moving_music_sheet_timer.dart';

/// Generates random notes on a moving screen
class EndlessNoteGenerator extends MovingMusicSheetTimer {
  /// Random number generator
  final Random _random = Random();

  /// The maximum amount of time between notes being displayed
  late final int _maxTime;

  /// The minimum amount of time between notes being displayed
  late final int _minTime;

  /// The notes that are available to be played
  late List<String> _availableNotes;

  /// The clef of the mode
  late final Clef _clef;

  EndlessNoteGenerator({required sheet, required nextNote, required updater})
      : super(sheet: sheet, nextNote: nextNote, updater: updater) {
    iterationsPerTimeUnit = constants.endlessIterationsPerTimeUnit;
  }

  /// Sets the clef of the mode
  void setClef(Clef clef) {
    _clef = clef;
    _setClefAndValues();
    _generateRandomNote();
  }

  /// Sets the values and available notes depending on the difficulty
  void _setClefAndValues() {
    if (difficulty == 'Expert') {
      _setExpertDifficulty();
    }
    else if (difficulty == 'Intermediate') {
      _setIntermediateDifficulty();
    }
    else {
      _setBeginnerDifficulty();
    }
    timeBetweenMovements =
        ((1 / ((bpm / 60) * iterationsPerTimeUnit)) * 1000).round();
  }

  /// Sets the beginner difficulty values
  void _setBeginnerDifficulty() {
    bpm = constants.endlessBeginnerBpm;
    _availableNotes = constants.endlessBeginnerTrebleNotes;
    if (_clef == Clef.bass) {
      _availableNotes = constants.endlessBeginnerBassNotes;
    }
    _minTime = constants.endlessBeginnerMinTime;
    _maxTime = constants.endlessBeginnerMaxTime;
  }

  /// Sets the intermediate difficulty values
  void _setIntermediateDifficulty() {
    bpm = constants.endlessIntermediateBpm;
    _availableNotes = constants.endlessIntermediateTrebleNotes;
    if (_clef == Clef.bass) {
      _availableNotes = constants.endlessIntermediateBassNotes;
    }
    _minTime = constants.endlessIntermediateMinTime;
    _maxTime = constants.endlessIntermediateMaxTime;
  }

  /// Sets the expert difficulty values
  void _setExpertDifficulty() {
    bpm = constants.endlessExpertBpm;
    _availableNotes = constants.endlessExpertTrebleNotes;
    if (_clef == Clef.bass) {
      _availableNotes = constants.endlessExpertBassNotes;
    }
    _minTime = constants.endlessExpertMinTime;
    _maxTime = constants.endlessExpertMaxTime;
  }

  /// Gets a new random note to be displayed
  void _generateRandomNote() {
    String name = _availableNotes[_random.nextInt(_availableNotes.length)];
    nextNote.setNextNote(Note(name: name, duration: 1));
  }

  /// Sets the difficulty of the mode
  @override
  void setDifficulty(String diff) {
    difficulty = diff;
  }

  /// Starts the timer and movement
  @override
  void start() {
    isOn = true;
    Timer.periodic(Duration(milliseconds: timeBetweenMovements), (Timer t) {
      if (!isOn) {
        t.cancel();
      } else {
        if (index == 0) {
          increment();
        } else {
          sheet.move();
        }
        index = (index + 1) % iterationsPerTimeUnit;
        updater(index.toString());
      }
    });
  }

  /// Stops the timer
  @override
  void stop() {
    isOn = false;
  }

  /// Moves notes along screen and displays a new random note
  @override
  void increment() {
    sheet.move();
    if (time == 0) {
      _generateRandomNote();
      time = _minTime + _random.nextInt(_maxTime - _minTime);
    }
    time--;
  }
}
