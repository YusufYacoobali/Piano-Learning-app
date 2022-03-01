import 'dart:async';

import 'music_sheet.dart';
import 'note.dart';

/// Progresses the sheet according to a beat
class ProgressTimer {
  int _time = 0;
  bool _isOn = false;

  final MusicSheet _sheet;
  final NextNote _nextNote;

  final Map<int, Note> _notes = <int, Note>{
    0: Note('Cb4', 0, 1),
    2: Note('B3', 2, 1.5),
    5: Note('A3', 5, 0.5),
    8: Note('G#3', 8, 2),
    13: Note('F3', 13, 3),
    18: Note('E3', 28, 3),
    23: Note('D3', 23, 4),
    26: Note('C3', 26, 0.5),
    29: Note('B2', 29, 3),
    32: Note('A2', 32, 1),
    34: Note('G2', 34, 1),
  };

  /*final Map<int, Note> _notes = <int, Note>{
    0: Note('Cb4', 0, 1),
    2: Note('D4', 2, 1.5),
    5: Note('E4', 5, 0.5),
    8: Note('F#4', 8, 2),
    13: Note('G4', 15, 3),
    18: Note('A4', 20, 3),
    23: Note('B4', 25, 4),
    26: Note('C5', 25, 0.5),
    29: Note('D5', 25, 3),
    32: Note('E5', 25, 1),
  };*/

  ProgressTimer(this._sheet, this._nextNote) {
    Note? n = _notes[_time];
    if (n != null) {
      Note note = n;
      _nextNote.setNextNote(note);
    }
  }

  // TODO: Make the start timer work

  // Problem: The timer only runs when the UI thread is running

  void start() {
    _isOn = true;
    Timer.periodic(const Duration(milliseconds: 1000), (Timer t) {
        if (!_isOn) {
          t.cancel();
        } else {
          increment();
        }
      }
      );
  }

  void stop() {
    _isOn = false;
  }

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
