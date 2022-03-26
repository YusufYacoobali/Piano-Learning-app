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

  EndlessNoteGenerator({
    required sheet,
    required nextNote,
    required updater
  }) : super(sheet: sheet, nextNote: nextNote, updater: updater) {
    iterationsPerTimeUnit = constants.endlessIterationsPerTimeUnit;
  }

  /// Sets the clef of the mode
  void setClef(Clef clef) {
    _clef = clef;
    _setClefAndValues();
    getRandomNote();
  }

  /// Sets the values and available notes depending on the difficulty
  void _setClefAndValues() {
    /// Expert mode values
    if (difficulty == 'Expert') {
      bpm = constants.endlessExpertBpm;
      _availableNotes = constants.endlessExpertTrebleNotes;
      if (_clef == Clef.bass) _availableNotes = constants.endlessExpertBassNotes;
      _minTime = constants.endlessExpertMinTime;
      _maxTime = constants.endlessExpertMaxTime;
    }
    /// Intermediate mode values
    else if (difficulty == 'Intermediate') {
      bpm = constants.endlessIntermediateBpm;
      _availableNotes = constants.endlessIntermediateTrebleNotes;
      if (_clef == Clef.bass) _availableNotes = constants.endlessIntermediateBassNotes;
      _minTime = constants.endlessIntermediateMinTime;
      _maxTime = constants.endlessIntermediateMaxTime;
    }
    /// Beginner mode values
    else {
      bpm = constants.endlessBeginnerBpm;
      _availableNotes = constants.endlessBeginnerTrebleNotes;
      if (_clef == Clef.bass) _availableNotes = constants.endlessBeginnerBassNotes;
      _minTime = constants.endlessBeginnerMinTime;
      _maxTime = constants.endlessBeginnerMaxTime;
    }
    timeBetweenMovements = ((1 / ((bpm / 60) * iterationsPerTimeUnit)) * 1000).round();
  }

  /// Gets a new random note to be displayed
  getRandomNote() {
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
        }
        else {
          sheet.move();
        }
        index = (index+1) % iterationsPerTimeUnit;
        updater(index.toString());
      }
    }
    );
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
      getRandomNote();
      time = _minTime + _random.nextInt(_maxTime - _minTime);
    }
    time--;
  }
}