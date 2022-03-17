import 'dart:async';
import 'dart:math';

import '../sheet_music_components/moving_music_sheet.dart';
import '../sheet_music_components/note.dart';

/// Generates random notes on a moving screen
class EndlessNoteGenerator {
  /// Whether the sheet is moving or not
  bool _isOn = false;

  /// The music sheet
  final MovingMusicSheet sheet;

  /// Notifies the sheet of the next note
  final NextNoteNotifier nextNote;

  /// How far into the next time unit the timer is
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

  /// The time left between notes
  int _time = 0;

  /// Notes that can be displayed at each difficulty
  final List<String> _easyNotes = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
  final List<String> _mediumNotes = ['C', 'D#', 'E', 'E', 'F#', 'G', 'Ab', 'Bb', 'B'];
  final List<String> _hardNotes = ['C', 'C#', 'Db', 'D', 'D#', 'Eb', 'E', 'F', 'F#', 'Gb', 'G', 'G#', 'Ab', 'A', 'A#', 'Bb', 'B'];

  /// How hard the mode is
  late final String _difficulty;

  /// How fast the notes travel across the screen
  late final int _bpm;

  /// What notes can be played
  late List<String> _availableNotes;

  /// The time between each movement
  late final int _timeBetweenMovements;

  EndlessNoteGenerator({required this.sheet, required this.nextNote, required this.updater});

  /// Sets the clef
  void setClef(Clef clef) {
    String num = '4';
    if (clef == Clef.bass) {
      num = '3';
    }
    List<String> notes = [];
    for (String note in _availableNotes) {
      notes.add(note + num);
    }
    _availableNotes = notes;
    getRandomNote();
  }

  /// Saves the difficulty
  void setDifficulty(String difficulty) {
    _difficulty = difficulty;
    setDifficultyValues();
  }

  /// Sets the values depending on the difficulty
  void setDifficultyValues() {
    if (_difficulty == 'hard') {
      _bpm = 120;
      _availableNotes = _hardNotes;
      _minTime = 1;
      _maxTime = 3;
    }
    else if (_difficulty == 'medium') {
      _bpm = 100;
      _availableNotes = _mediumNotes;
      _minTime = 2;
      _maxTime = 4;
    }
    else {
      _bpm = 80;
      _availableNotes = _easyNotes;
      _minTime = 3;
      _maxTime = 5;
    }
    _timeBetweenMovements = ((1 / ((_bpm / 60) * iterationsPerTimeUnit)) * 1000).round();
  }

  /// Gets a new random note to be displayed
  getRandomNote() {
    String name = _availableNotes[_random.nextInt(_availableNotes.length)];
    nextNote.setNextNote(Note(name: name, duration: 1));
  }

  /// Starts moving the screen
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

  /// Stops the movement on the screen
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
