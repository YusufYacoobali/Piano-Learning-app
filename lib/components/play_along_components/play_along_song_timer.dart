import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../constants.dart' as constants;
import '../sheet_music_components/moving_music_sheet.dart';
import '../sheet_music_components/note.dart';
import 'play_along_hit_counter.dart';

class PlayAlongSongTimer {
  /// Whether the sheet is moving or not
  bool _isOn = false;

  /// The music sheet
  final MovingMusicSheet sheet;

  /// Notifies the sheet with the next note to be played
  final NextNoteNotifier nextNote;

  /// How far into the time unit we are
  int _index = 0;

  /// The number of movements before the time unit changes
  late final int _iterationsPerTimeUnit;

  /// The function to be called when a note has been hit or missed
  final Function(String) updater;

  /// Timing
  int _time = -1;

  /// Notes to be played
  final Map<int, Note> notes;

  /// The time of the last note
  late final int _endTime;

  /// Whether the song has ended
  bool _hasEnded = false;

  /// Called when song has finished
  final VoidCallback onStop;

  /// The amount of time between increments
  late final int _timeBetweenMovements;

  /// How fast the notes move along the screen
  final int bpm;

  /// The difficulty level
  late final String _difficulty;

  /// Counter the number of hit notes
  final PlayAlongHitCounter hitCounter;

  PlayAlongSongTimer({
    required this.sheet,
    required this.nextNote,
    required this.updater,
    required this.notes,
    required this.bpm,
    required this.onStop,
    required this.hitCounter,
  }) {

    _endTime = notes.keys.last;

    Note? n = notes[_time];
    if (n != null) {
      Note note = n;
      nextNote.setNextNote(note);
    }
    sheet.onEnd = end;
  }

  /// Sets the values of the moving notes depending on the difficulty
  void _setDifficultyValues() {
    int apparentSpacing = 100;
    if (_difficulty == 'Expert') {
      _iterationsPerTimeUnit = constants.playAlongExpertNoteSpacing;
      apparentSpacing = _iterationsPerTimeUnit - 20;
    }
    else if (_difficulty == 'Intermediate') {
      _iterationsPerTimeUnit = constants.playAlongIntermediateNoteSpacing;
      apparentSpacing = _iterationsPerTimeUnit - 60;
    }
    else {
      _iterationsPerTimeUnit = constants.playAlongBeginnerNoteSpacing;
      apparentSpacing = 80;
    }
    _timeBetweenMovements = ((1 / ((bpm / 60) * apparentSpacing)) * 1000).round();
  }

  void setDifficulty(String diff) {
    _difficulty = diff;
    _setDifficultyValues();
  }

  /// Starts moving the notes along the screen
  void start() {
    _isOn = true;
    Timer.periodic(Duration(milliseconds: _timeBetweenMovements), (Timer t) {
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
        _index = (_index+1) % _iterationsPerTimeUnit;
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