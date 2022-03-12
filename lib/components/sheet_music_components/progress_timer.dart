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

  final Function _updater;
  final Map<int, Note> _notes;

  ProgressTimer(this._sheet, this._nextNote, this._updater, this._notes) {
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
