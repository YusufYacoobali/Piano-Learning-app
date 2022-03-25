import 'dart:async';
import 'dart:math';

import '../../constants.dart' as constants;
import '../sheet_music_components/moving_music_sheet.dart';
import '../sheet_music_components/note.dart';

/// Generates random notes on a moving screen
class EndlessNoteGenerator {
  /// Whether the sheet is moving or not
  bool _isOn = false;

  final MovingMusicSheet sheet;
  final NextNoteNotifier nextNote;

  int _index = 0;

  /// The number of movements before the time unit changes
  static const int iterationsPerTimeUnit = 120;

  /// The function to be called when a note has been hit or missed
  final Function updater;

  final Random _random = Random();

  /// The maximum amount of time between notes being displayed
  late final int _maxTime;

  /// The minimum amount of time between notes being displayed
  late final int _minTime;

  int _time = 0;

  late final String _difficulty;

  late int _bpm;

  late List<String> _availableNotes;

  late final int _timeBetweenMovements;

  late final Clef _clef;

  EndlessNoteGenerator({required this.sheet, required this.nextNote, required this.updater});

  void setClef(Clef clef) {
    _clef = clef;
    _setClefAndValues();
    getRandomNote();
  }

  void _setClefAndValues() {
    if (_difficulty == 'Expert') {
      _bpm = constants.endlessExpertBpm;
      _availableNotes = constants.endlessExpertTrebleNotes;
      if (_clef == Clef.bass) _availableNotes = constants.endlessExpertBassNotes;
      _minTime = constants.endlessExpertMinTime;
      _maxTime = constants.endlessExpertMaxTime;
    }
    else if (_difficulty == 'Intermediate') {
      _bpm = constants.endlessIntermediateBpm;
      _availableNotes = constants.endlessIntermediateTrebleNotes;
      if (_clef == Clef.bass) _availableNotes = constants.endlessIntermediateBassNotes;
      _minTime = constants.endlessIntermediateMinTime;
      _maxTime = constants.endlessIntermediateMaxTime;
    }
    else {
      _bpm = constants.endlessBeginnerBpm;
      _availableNotes = constants.endlessBeginnerTrebleNotes;
      if (_clef == Clef.bass) _availableNotes = constants.endlessBeginnerBassNotes;
      _minTime = constants.endlessBeginnerMinTime;
      _maxTime = constants.endlessBeginnerMaxTime;
    }
    _timeBetweenMovements = ((1 / ((_bpm / 60) * iterationsPerTimeUnit)) * 1000).round();
  }

  /// Gets a new random note to be displayed
  getRandomNote() {
    String name = _availableNotes[_random.nextInt(_availableNotes.length)];
    nextNote.setNextNote(Note(name: name, duration: 1));
  }

  void setDifficulty(String difficulty) {
    _difficulty = difficulty;
  }

  void start() {
    _isOn = true;
    Timer.periodic(Duration(milliseconds: _timeBetweenMovements), (Timer t) {
      if (!_isOn) {
        t.cancel();
      } else {
        if (_index == 0) {
          increment();
        }
        else {
          sheet.move();
        }
        _index = (_index+1) % iterationsPerTimeUnit;
        updater(_index.toString());
      }
    }
    );
  }

  void stop() {
    _isOn = false;
  }

  /// Moves notes along screen and displays a new random note
  void increment() {
    sheet.move();
    if (_time == 0) {
      getRandomNote();
      _time = _minTime + _random.nextInt(_maxTime - _minTime);
    }
    _time--;
  }
}