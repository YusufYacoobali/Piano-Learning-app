import 'dart:async';

import 'music_sheet.dart';
import 'note.dart';

/// Progresses the sheet according to a beat
class ProgressTimer {
  final MusicSheet _sheet;
  bool _isOn = false;

  final NextNote _nextNote;

  ProgressTimer(this._sheet, this._nextNote);

  int _time = 0;

  final Map<int, Note> _map = <int, Note>{
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
  };

  // TODO: Make the start timer work

  // Problem: The canvas only runs when the UI thread is running

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
    //_increment = true;
    _time++;
    _sheet.move();
    Note? n = _map[_time];
    if (n != null) {
      Note note = n;
      _nextNote.setNextNote(note);
    }
  }
}
