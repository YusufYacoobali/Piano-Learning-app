import 'dart:async';

import 'music_sheet.dart';
import 'note.dart';

/// Progresses the sheet according to a beat
class ProgressTimer {
  int _time = 0;
  bool _isOn = false;

  final MusicSheet _sheet;
  final NextNoteNotifier _nextNote;

  int _index = 0;
  static const int iterationsPerTimeUnit = 80;

  // Bass clef notes

  // final Map<int, Note> _notes = <int, Note>{
  //   0: Note(name: 'Cb4', time: 0, duration: 1),
  //   2: Note(name: 'B3', time: 2, duration: 1.5),
  //   5: Note(name: 'A3', time: 5, duration: 0.5),
  //   8: Note(name: 'G#3', time: 8, duration: 2),
  //   13: Note(name: 'F3', time: 13, duration: 3),
  //   18: Note(name: 'E3', time: 28, duration: 3),
  //   23: Note(name: 'D3', time: 23, duration: 4),
  //   26: Note(name: 'C3', time: 26, duration: 0.5),
  //   29: Note(name: 'B2', time: 29, duration: 3),
  //   32: Note(name: 'A2', time: 32, duration: 1),
  //   34: Note(name: 'G2', time: 34, duration: 1),
  // };

  // Treble clef notes
  final Map<int, Note> _notes = <int, Note>{
    0: Note(name: 'Cb4', duration: 1, time: 0),
    2: Note(name: 'D4', duration: 1.5, time: 2),
    5: Note(name: 'E4', duration: 0.5, time: 5),
    8: Note(name: 'F#4', duration: 2, time: 8),
    13: Note(name: 'G4', duration: 3, time: 15),
    18: Note(name: 'A4', duration: 3, time: 20),
    23: Note(name: 'B4', duration: 4, time: 25),
    26: Note(name: 'C5', duration: 0.5, time: 25),
    29: Note(name: 'D5', duration: 3, time: 25),
    32: Note(name: 'E5', duration: 1, time: 25),
  };

  final Function _updater;

  ProgressTimer(this._sheet, this._nextNote, this._updater) {
    Note? n = _notes[_time];
    if (n != null) {
      Note note = n;
      _nextNote.setNextNote(note);
    }
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

  /// Increments the time factor
  void increment() {
    _time++;
    _sheet.move();
    Note? n = _notes[_time];
    if (n != null) {
      Note note = n;
      _nextNote.setNextNote(note);
    }
  }
}
