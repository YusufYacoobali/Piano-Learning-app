import 'package:flutter/material.dart';

import 'note.dart';
import 'note_image_builder.dart';
import 'note_on_stave.dart';
import 'stave_builder.dart';

enum MusicSheetModes {
  /// Notes move along the screen
  playAlong,

  /// Shows a note for the person to play
  showNotes,

  /// The person plays a key and the sheet writes the note
  detectKeys,
}

class MusicSheet extends CustomPainter {

  // The place where the notes appear
  late double _startLine;

  // THe place where the notes disappear
  late double _endLine;

  // The first line of the stave
  late double _baseLine;

  // The offset from baseline of the notes
  final Map<String, int> _notes = <String, int>{
    'C4': -10,
    'D4': 0,
    'E4': 7,
    'F4': 18,
    'G4': 27,
    'A4': 38,
    'B4': 47,
    'C5': 58,
    'D5': 67,
    'E5': 78,
  };

  // How far each note should be spaced
  final double _noteSpacing = 50;

  final List<NoteOnStave> _notesOnStaves = <NoteOnStave>[];

  final NextNote _nextNote;

  final MusicSheetModes _mode;

  MusicSheet(this._nextNote, this._mode);

  @override
  void paint(Canvas canvas, Size size) {
    _baseLine = size.height/2 + 20;
    double start = 0;
    double canvasWidth = 0;
    if (_mode == MusicSheetModes.playAlong) {
      canvasWidth = size.width;
      _startLine = canvasWidth - 40;
    }
    else if (_mode == MusicSheetModes.showNotes) {
      start = size.width/3;
      canvasWidth = size.width/3;
      _startLine = canvasWidth/2;
    }
    else {
      start = size.width/3;
      canvasWidth = size.width/3;
      _startLine = canvasWidth/2;
    }
    _endLine = 100;

    StaveBuilder.drawStave(canvas, size, _baseLine, start, start + canvasWidth, true);

    for (int count = 0; count < _notesOnStaves.length; count++) {
      if (_notesOnStaves[count].pos < _endLine) {
        _notesOnStaves.remove(_notesOnStaves[count]);
        count--;
      }
    }

    if (_nextNote.hasNextNote) {
      Note note = _nextNote.getNextNote();
      int? position = _notes[note.name];
      if (position != null) {
        double pos = position.toDouble();
        NoteOnStave newNote = NoteOnStave(note, _startLine, pos);
        _notesOnStaves.add(newNote);
        NoteImageBuilder.drawNote(newNote, canvas, _baseLine);
      }
    }
    else {
      for (NoteOnStave note in _notesOnStaves) {
        NoteImageBuilder.drawNote(note, canvas, _baseLine);
      }
    }
  }

  void move() {
    for (NoteOnStave note in _notesOnStaves) {
      note.pos-=_noteSpacing;
    }
  }

  void clear() {
    int length = _notesOnStaves.length;
    for (int i = 0; i < length; i++) {
      _notesOnStaves.removeLast();
    }
  }

  @override
  bool shouldRepaint(MusicSheet oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(MusicSheet oldDelegate) => false;
}