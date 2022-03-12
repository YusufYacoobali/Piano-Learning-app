import 'dart:ui';

import 'note_on_stave.dart';
import 'note_played_checker.dart';
import 'stave_builder.dart';
import 'note.dart';
import 'music_sheet.dart';

class MovingMusicSheet extends MusicSheet{
  final NotePlayedChecker _currentNoteToPlay;
  late final double _currentNoteStart;
  late final double _currentNoteEnd;
  late NoteOnStave _noteInPlayArea = NoteOnStave(Note(name: '', duration: -1), -1, -10);
  bool _firstNoteInPlayArea = false;

  MovingMusicSheet(NextNoteNotifier nextNote, Clef clef, this._currentNoteToPlay) : super(nextNote, clef);

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

    if (_currentNoteToPlay.noteNotifier.hasNextNote && _firstNoteInPlayArea) {
      if (_noteInPlayArea.pos < _currentNoteEnd - 15) {
        _currentNoteToPlay.noteNotifier.hasNextNote = false;
        _currentNoteToPlay.removeNote();
      }
    }

    checkIfNoteInPlayArea();

    if (nextNote.hasNextNote) {
      drawNewNote();
    }
    drawNotes();
  }

  void checkIfNoteInPlayArea() {
    for (NoteOnStave note in notesOnStaves) {
      if (note.pos <= _currentNoteStart && note.pos >= _currentNoteEnd) {
        if (note != _noteInPlayArea) {
          _currentNoteToPlay.setNewNote(note.note);
          _noteInPlayArea = note;
          _firstNoteInPlayArea = true;
        }
      }
    }
  }
}