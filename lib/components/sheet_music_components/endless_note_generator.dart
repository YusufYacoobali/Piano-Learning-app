import 'dart:async';
import 'dart:math';

import 'music_sheet.dart';
import 'note.dart';

/// Progresses the sheet according to a beat
class EndlessNoteGenerator {
  bool _isOn = false;

  final MusicSheet _sheet;
  final NextNoteNotifier _nextNote;

  int _index = 0;
  static const int iterationsPerTimeUnit = 80;

  final Function _updater;

  final Random random = Random();

  final trebleClefNotes = ['C4', 'Db4', 'D4', 'E4', 'Eb4', 'F4', 'Gb4', 'G4', 'Ab4', 'A4', 'Bb4', 'B4'];
  final bassClefNotes = ['B3', 'Bb3', 'A3', 'Ab3', 'G3', 'Gb3', 'F3', 'E3', 'Eb3', 'D3', 'Db3', 'C3'];

  static const int maxTime = 5;
  static const int minTime = 3;

  int _time = 0;

  EndlessNoteGenerator(this._sheet, this._nextNote, this._updater) {
    String name = trebleClefNotes[random.nextInt(trebleClefNotes.length)];
    _nextNote.setNextNote(Note(name, 1));
  }

  getRandomNote() {
    String name = trebleClefNotes[random.nextInt(trebleClefNotes.length)];
    _nextNote.setNextNote(Note(name, 1));
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
      _time = minTime + random.nextInt(maxTime - minTime);
    }
    _time--;
  }
}
