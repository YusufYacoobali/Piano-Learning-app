import 'dart:async';

import 'moving_music_sheet.dart';
import 'note.dart';

class PlayAlongNoteDisplay {
  /// Whether the sheet is moving or not
  bool _isOn = false;

  final MovingMusicSheet sheet;
  final NextNoteNotifier nextNote;

  int _index = 0;

  /// The number of movements before the time unit changes
  static const int iterationsPerTimeUnit = 80;

  /// The function to be called when a note has been hit or missed
  final Function updater;

  int _time = -1;

  final Map<int, Note> notes;

  late final int _endTime;

  bool _hasEnded = false;

  final Function onStop;

  PlayAlongNoteDisplay({
    required this.sheet,
    required this.nextNote,
    required this.updater,
    required this.notes,
    required this.onStop
  }) {

    _endTime = notes.keys.last;

    Note? n = notes[_time];
    if (n != null) {
      Note note = n;
      nextNote.setNextNote(note);
    }
  }

  void start() {
    _isOn = true;
    Timer.periodic(const Duration(milliseconds: 5), (Timer t) {
      if (!_isOn) {
        t.cancel();
      }
      else {
        if (_time > _endTime) {
          if (!_hasEnded) {
            _hasEnded = true;
            sheet.onEnd = stop;
            sheet.hasEnded = true;
          }
        }
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

  void stop() async {
    _isOn = false;
    await Future.delayed(const Duration(milliseconds: 10));
    onStop();
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
