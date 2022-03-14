import 'dart:async';

import 'music_sheet.dart';
import 'note.dart';

class PlayAlongNoteDisplay {
  /// Whether the sheet is moving or not
  bool _isOn = false;

  final MusicSheet sheet;
  final NextNoteNotifier nextNote;

  int _index = 0;

  /// The number of movements before the time unit changes
  static const int iterationsPerTimeUnit = 80;

  /// The function to be called when a note has been hit or missed
  final Function updateFunction;

  int _time = 0;

  final Map<int, Note> notes;

  /// The amount of time between increments
  late final int _timeBetweenMovements;

  /// How fast the notes move along the screen
  final int bpm;

  PlayAlongNoteDisplay({required this.sheet, required this.nextNote, required this.updateFunction, required this.notes, required this.bpm}) {
    _timeBetweenMovements = ((1 / ((bpm / 60) * iterationsPerTimeUnit)) * 1000).round();
    Note? n = notes[_time];
    if (n != null) {
      Note note = n;
      nextNote.setNextNote(note);
    }
  }

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
        updateFunction(_index.toString());
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
    sheet.move();
    Note? n = notes[_time];
    if (n != null) {
      Note note = n;
      nextNote.setNextNote(note);
    }
  }
}
