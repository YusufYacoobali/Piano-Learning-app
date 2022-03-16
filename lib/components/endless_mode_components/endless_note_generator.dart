import 'dart:async';
import 'dart:math';

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

  final List<String> _easyNotes = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
  final List<String> _mediumNotes = ['C', 'D', 'E', 'Eb', 'F', 'G', 'A', 'Bb', 'B'];
  final List<String> _hardNotes = ['C', 'Db', 'Eb', 'D', 'E', 'F', 'Gb', 'G', 'Ab', 'A', 'Bb', 'B'];

  late final String _difficulty;

  late final int _bpm;

  late List<String> _availableNotes;

  late final int _timeBetweenMovements;

  EndlessNoteGenerator({required this.sheet, required this.nextNote, required this.updater});

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

  void setDifficulty(String difficulty) {
    _difficulty = difficulty;
    setDifficultyValues();
  }

  void setDifficultyValues() {
    if (_difficulty == 'hard') {
      _bpm = 120;
      _availableNotes = _hardNotes;
      _minTime = 1;
      _maxTime = 4;
    }
    else if (_difficulty == 'medium') {
      _bpm = 100;
      _availableNotes = _mediumNotes;
      _minTime = 3;
      _maxTime = 5;
    }
    else {
      _bpm = 80;
      _availableNotes = _easyNotes;
      _minTime = 4;
      _maxTime = 7;
    }
    _timeBetweenMovements = ((1 / ((_bpm / 60) * iterationsPerTimeUnit)) * 1000).round();
  }

  /// Gets a new random note to be displayed
  getRandomNote() {
    String name = _availableNotes[_random.nextInt(_availableNotes.length)];
    nextNote.setNextNote(Note(name: name, duration: 1));
  }

  void start() {
    _isOn = true;
    Timer.periodic(Duration(milliseconds: _timeBetweenMovements), (Timer t) {
      if (!_isOn) {
        t.cancel();
      } else {
        //print(_index);
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
