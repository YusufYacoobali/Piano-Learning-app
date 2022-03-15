import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'moving_music_sheet.dart';
import 'note.dart';

class PlayAlongSongTimer {
  /// Whether the sheet is moving or not
  bool _isOn = false;

  final MovingMusicSheet sheet;
  final NextNoteNotifier nextNote;

  int _index = 0;

  /// The number of movements before the time unit changes
  static const int iterationsPerTimeUnit = 80;

  /// The function to be called when a note has been hit or missed
  final Function(String) updater;

  /// Timing
  int _time = -1;

  /// Notes to be played
  final Map<int, Note> notes;

  /// The time of the last note
  late final int _endTime;

  bool _hasEnded = false;

  /// Called when song has finished
  final VoidCallback onStop;

  PlayAlongSongTimer({
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

    sheet.onEnd = end;
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

  /// Stops the timer and displays the end pop up
  void end() async {
    stop();
    await Future.delayed(const Duration(milliseconds: 10));
    onStop();
  }

  /// Stops the timer
  void stop() {
    _isOn = false;
  }

  /// Restarts the song
  void restart() {
    _time = -1;
    sheet.clear();
    _hasEnded = false;
    sheet.hasEnded = false;
    _isOn = true;
    start();
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
