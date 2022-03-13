import 'dart:async';

import 'moving_music_sheet.dart';
import 'note.dart';

class PlayAlongNoteDisplay {
  /// Whether the sheet is moving or not
  bool _isOn = false;

  final MovingMusicSheet _sheet;
  final NextNoteNotifier _nextNote;

  int _index = 0;

  /// The number of movements before the time unit changes
  static const int iterationsPerTimeUnit = 80;

  /// The function to be called when a note has been hit or missed
  final Function _updater;

  int _time = 0;

  final Map<int, Note> _notes;

  PlayAlongNoteDisplay(this._sheet, this._nextNote, this._updater, this._notes) {
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

  /// Moves notes along screen and displays a new random note
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
