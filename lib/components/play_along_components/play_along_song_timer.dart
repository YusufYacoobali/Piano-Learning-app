import 'package:flutter/material.dart';
import 'dart:async';

import 'play_along_hit_counter.dart';
import '../sheet_music_components/moving_music_sheet_timer.dart';
import '../sheet_music_components/note.dart';
import '../../constants.dart' as constants;

/// A timing mechanism for the scrolling music sheet for the various play along tracks.
///
/// Notes to be played by the user are displayed, moved and checked for based on the timer.
class PlayAlongSongTimer extends MovingMusicSheetTimer {
  /// Notes to be played
  final Map<int, Note> notes;

  /// The time of the last note, and by extension the end of the track.
  late final int _endTime;

  /// Whether the song has ended
  bool _hasEnded = false;

  /// Called when song has finished
  final VoidCallback onStop;

  /// Counter the number of hit notes
  final PlayAlongHitCounter hitCounter;

  PlayAlongSongTimer({
    required sheet,
    required nextNote,
    required updater,
    required bpm,
    required this.notes,
    required this.onStop,
    required this.hitCounter,
  }) : super(sheet: sheet, nextNote: nextNote, updater: updater) {
    /// The speed at which notes will be played.
    this.bpm = bpm;

    _endTime = notes.keys.last;

    Note? n = notes[time];
    if (n != null) {
      Note note = n;
      nextNote.setNextNote(note);
    }
    sheet.onEnd = end;
  }

  /// Sets the values of the moving notes depending on the difficulty.
  void _setDifficultyValues() {
    int apparentSpacing = 100;
    if (difficulty == 'Expert') {
      iterationsPerTimeUnit = constants.playAlongExpertNoteSpacing;
      apparentSpacing = iterationsPerTimeUnit - 20;
    } else if (difficulty == 'Intermediate') {
      iterationsPerTimeUnit = constants.playAlongIntermediateNoteSpacing;
      apparentSpacing = iterationsPerTimeUnit - 60;
    } else {
      iterationsPerTimeUnit = constants.playAlongBeginnerNoteSpacing;
      apparentSpacing = 80;
    }
    timeBetweenMovements =
        ((1 / ((bpm / 60) * apparentSpacing)) * 1000).round();
  }

  /// Sets the difficulty of the song
  @override
  void setDifficulty(String diff) {
    difficulty = diff;
    _setDifficultyValues();
  }

  /// Starts moving the notes along the screen
  @override
  void start() {
    isOn = true;
    Timer.periodic(Duration(milliseconds: timeBetweenMovements), (Timer t) {
      if (!isOn) {
        t.cancel();
      } else {
        if (time > _endTime) {
          if (!_hasEnded) {
            _hasEnded = true;
            sheet.hasEnded = true;
          }
        }
        if (index == 0) {
          increment();
        } else {
          sheet.move();
        }
        index = (index + 1) % iterationsPerTimeUnit;
        updater(index.toString());
      }
    });
  }

  /// Stops the timer and displays the end pop up
  void end() async {
    stop();
    await Future.delayed(const Duration(milliseconds: 10));
    onStop();
  }

  /// Stops the timer
  @override
  void stop() {
    isOn = false;
  }

  /// Restarts the song
  void restart() {
    time = -1;
    sheet.clear();
    _hasEnded = false;
    sheet.hasEnded = false;
    isOn = true;
    start();
  }

  /// Moves notes along screen and displays a new random note
  @override
  void increment() {
    time++;
    sheet.move();
    Note? n = notes[time];
    if (n != null) {
      Note note = n;
      nextNote.setNextNote(note);
    }
  }
}
