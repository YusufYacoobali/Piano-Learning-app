import 'dart:ui';

import 'package:sight_reading_app/constants.dart';
import 'note_on_stave.dart';
import 'note_played_checker.dart';
import 'stave_builder.dart';
import 'note.dart';
import 'music_sheet.dart';

class MovingMusicSheet extends MusicSheet{
  final NotePlayedChecker notePlayedChecker;
  late final double _currentNoteStart;
  late final double _currentNoteEnd;
  late NoteOnStave _noteInPlayArea;
  bool _firstNoteInPlayArea = false;

  MovingMusicSheet({required NextNoteNotifier nextNote, required Clef clef, required this.notePlayedChecker}) : super(nextNote, clef);

  @override
  void paint(Canvas canvas, Size size) {
    noteImageBuilder.setCanvas(canvas);
    if (!hasSet) {
      hasSet = true;
      baseLine = size.height/2 + 20;
      noteImageBuilder.setBaseLine(baseLine);
      endLine = 100;
      _currentNoteEnd = endLine + 50;
      _currentNoteStart = _currentNoteEnd + 100;
    }

    removeNotes(canvas, size);

    StaveBuilder.makeBackground(canvas, size, 0, size.width);
    StaveBuilder.drawBox(canvas, size, baseLine, _currentNoteEnd, _currentNoteStart);
    StaveBuilder.drawStave(canvas, size, baseLine, 0, size.width, clef == Clef.treble);

    double canvasWidth = size.width;
    startLine = canvasWidth + 40;

    if (notePlayedChecker.noteNotifier.hasNextNote && _firstNoteInPlayArea) {
      if (_noteInPlayArea.pos < _currentNoteEnd - 15) {
        notePlayedChecker.noteNotifier.hasNextNote = false;
        notePlayedChecker.removeNote();
      }
    }

    checkIfNoteInPlayArea();

    if (nextNote.hasNextNote) {
      drawNewNote();
    }
    drawNotes();
  }

  /// Moves the notes on the canvas towards the end line
  void move() {
    for (NoteOnStave note in notesOnStaves) {
      note.pos-=noteMovement;
    }
  }

  /// Checks if a note is in the green area to be played
  void checkIfNoteInPlayArea() {
    for (NoteOnStave note in notesOnStaves) {
      if (note.pos <= _currentNoteStart && note.pos >= _currentNoteEnd) {
        if (_firstNoteInPlayArea) {
          if (note != _noteInPlayArea) {
            notePlayedChecker.setNewNote(note.note);
            _noteInPlayArea = note;
          }
        }
        else {
          notePlayedChecker.setNewNote(note.note);
          _noteInPlayArea = note;
          _firstNoteInPlayArea = true;
        }

      }
    }
  }
}