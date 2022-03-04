import 'dart:async';

import '../../screens/keyboard_sheet_screen.dart';
import 'music_sheet.dart';
import 'note.dart';

/// Progresses the sheet according to a beat
class ProgressTimer {
  int _time = 0;
  bool _isOn = false;

  final MusicSheet _sheet;
  final NextNote _nextNote;

  final KeyboardSheetScreenState _screen;

  // Bass clef notes

  // final Map<int, Note> _notes = <int, Note>{
  //   0: Note('Cb4', 0, 1),
  //   2: Note('B3', 2, 1.5),
  //   5: Note('A3', 5, 0.5),
  //   8: Note('G#3', 8, 2),
  //   13: Note('F3', 13, 3),
  //   18: Note('E3', 28, 3),
  //   23: Note('D3', 23, 4),
  //   26: Note('C3', 26, 0.5),
  //   29: Note('B2', 29, 3),
  //   32: Note('A2', 32, 1),
  //   34: Note('G2', 34, 1),
  // };

  // Treble clef notes
  final Map<int, Note> _notes = <int, Note>{
    0: Note('Cb4', 1, time: 0),
    2: Note('D4', 1.5, time: 2),
    5: Note('E4', 0.5, time: 5),
    8: Note('F#4', 2, time: 8),
    13: Note('G4', 3, time: 15),
    18: Note('A4', 3, time: 20),
    23: Note('B4', 4, time: 25),
    26: Note('C5', 0.5, time: 25),
    29: Note('D5', 3, time: 25),
    32: Note('E5', 1, time: 25),
  };

  ProgressTimer(this._sheet, this._nextNote, this._screen) {
    Note? n = _notes[_time];
    if (n != null) {
      Note note = n;
      _nextNote.setNextNote(note);
    }
  }

  // TODO: Make the start timer work

  // Problem: The timer only runs when the UI thread is running

  void start() async {
    _isOn = true;
    Timer.periodic(const Duration(milliseconds: 1000), (Timer t) {
        if (!_isOn) {
          t.cancel();
        } else {
          _time++;
          increment();
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
    _screen.rebuild();
  }
}