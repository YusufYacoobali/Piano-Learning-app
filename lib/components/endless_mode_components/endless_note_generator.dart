import 'dart:async';
import 'dart:math';

import '../sheet_music_components/music_sheet.dart';
import '../sheet_music_components/note.dart';

/// Generates random notes on a moving screen
class EndlessNoteGenerator {
  /// Whether the sheet is moving or not
  bool _isOn = false;

  final MusicSheet _sheet;
  final NextNoteNotifier _nextNote;

  int _index = 0;

  /// The number of movements before the time unit changes
  static const int iterationsPerTimeUnit = 80;

  /// The function to be called when a note has been hit or missed
  final Function _updater;

  final List<String> _trebleClefNotes = ['C4', 'Db4', 'D4', 'E4', 'Eb4', 'F4', 'Gb4', 'G4', 'Ab4', 'A4', 'Bb4', 'B4'];
  final List<String> _bassClefNotes = ['B3', 'Bb3', 'A3', 'Ab3', 'G3', 'Gb3', 'F3', 'E3', 'Eb3', 'D3', 'Db3', 'C3'];

  final Random _random = Random();

  /// The maximum amount of time between notes being displayed
  static const int _maxTime = 5;

  /// The minimum amount of time between notes being displayed
  static const int _minTime = 3;

  int _time = 0;

  late final List<String> _notes;

  EndlessNoteGenerator(this._sheet, this._nextNote, this._updater);

  void setClef(Clef clef) {
    if (clef == Clef.treble) {
      _notes = _trebleClefNotes;
    } else {
      _notes = _bassClefNotes;
    }
    getRandomNote();
  }

  /// Gets a new random note to be displayed
  getRandomNote() {
    String name = _notes[_random.nextInt(_notes.length)];
    _nextNote.setNextNote(Note(name: name, duration: 1));
  }

  void start() {
    _isOn = true;
    Timer.periodic(const Duration(milliseconds: 5), (Timer t) {
      if (!_isOn) {
        t.cancel();
      } else {
        if (_index == 0) {
          increment();
        }
        else {
          _sheet.move();
        }
        _index = (_index+1) % iterationsPerTimeUnit;
        _updater(_index.toString());
      }
    }
    );
  }

  void stop() {
    _isOn = false;
  }

  /// Moves notes along screen and displays a new random note
  void increment() {
    _sheet.move();
    if (_time == 0) {
      getRandomNote();
      _time = _minTime + _random.nextInt(_maxTime - _minTime);
    }
    _time--;
  }
}
