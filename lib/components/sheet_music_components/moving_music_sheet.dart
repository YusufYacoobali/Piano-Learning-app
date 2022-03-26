import 'dart:ui';

import 'note_on_stave.dart';
import 'note_played_checker.dart';
import 'stave_builder.dart';
import 'note.dart';
import 'music_sheet.dart';

/// A music sheet that can move
class MovingMusicSheet extends MusicSheet {

  /// Checks if a note is played or not
  final NotePlayedChecker notePlayedChecker;

  /// Where the green area begins
  late final double _currentNoteStart;

  /// Where the green area ends
  late final double _currentNoteEnd;

  /// The note in the green area
  late NoteOnStave _noteInPlayArea;

  /// Whether the fist note is in the green area
  bool _firstNoteInPlayArea = false;

  /// The place where the notes disappear
  late double endLine;

  /// Whether there are no new notes to be displayed
  bool hasEnded = false;

  /// What happens when there are no more notes on the screen
  late final Function onEnd;

  MovingMusicSheet(
      {required NextNoteNotifier nextNote,
      required Clef clef,
      required this.notePlayedChecker})
      : super(nextNote, clef);

  @override
  void paint(Canvas canvas, Size size) {
    noteImageBuilder.setCanvas(canvas);

    /// Sets the initial values
    if (!hasSet) {
      hasSet = true;
      baseLine = size.height / 2 + 20;
      noteImageBuilder.setBaseLine(baseLine);
      endLine = 100;
      _currentNoteEnd = endLine + 50;
      _currentNoteStart = _currentNoteEnd + 100;
    }

    removeNotes(canvas, size);

    /// Draws the stave and green area
    StaveBuilder.makeBackground(canvas, size, 0, size.width, isRoundedBorder);
    StaveBuilder.drawBox(
        canvas, size, baseLine, _currentNoteEnd, _currentNoteStart);
    StaveBuilder.drawStave(
        canvas, size, baseLine, 0, size.width, clef == Clef.treble);

    double canvasWidth = size.width;
    startLine = canvasWidth + 40;

    /// Removes a note from the green area once it leaves
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
    end();
  }

  /// Removes notes that are beyond the end line
  void removeNotes(Canvas canvas, Size size) {
    for (int count = 0; count < notesOnStaves.length; count++) {
      if (notesOnStaves[count].pos < endLine) {
        notesOnStaves.remove(notesOnStaves[count]);
        count--;
      }
    }
  }

  /// Moves the notes on the canvas towards the end line
  void move() {
    for (NoteOnStave note in notesOnStaves) {
      note.pos--;
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
        } else {
          notePlayedChecker.setNewNote(note.note);
          _noteInPlayArea = note;
          _firstNoteInPlayArea = true;
        }
      }
    }
  }

  /// Checks whether to end the movement
  void end() {
    if (hasEnded && notesOnStaves.isEmpty) {
      onEnd();
    }
  }
}
