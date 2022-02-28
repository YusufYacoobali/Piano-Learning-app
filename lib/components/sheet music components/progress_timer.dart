import 'dart:async';

import 'music_sheet.dart';

/// Progresses the sheet according to a beat
class ProgressTimer {
  final MusicSheet _sheet;
  bool _isOn = false;

  ProgressTimer(this._sheet);

  // TODO: Make the timer work

  // Problem: The canvas only runs when the UI thread is running

  void start() {
    _isOn = true;
    Timer.periodic(const Duration(milliseconds: 1000), (Timer t) {
        if (!_isOn) {
          t.cancel();
        } else {
          _sheet.increment();
        }
      }
      );
  }

  void stop() {
    _isOn = false;
  }
}