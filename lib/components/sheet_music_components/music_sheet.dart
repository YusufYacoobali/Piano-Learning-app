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

enum Clef {
  treble,
  bass,
}

class MusicSheet extends CustomPainter {

  // The place where the notes appear
  late double _startLine;

  // THe place where the notes disappear
  late double _endLine;

  // The first line of the stave
  late double _baseLine;

  // The offset from baseline of the notes on the treble clef
  final Map<String, int> _trebleClefNotes = <String, int>{
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
    'F5': 87,
    'G5': 98,
  };

  // The offset from baseline of the notes on the bass clef
  final Map<String, int> _bassClefNotes = <String, int>{
    'C4': 107,
    'B3': 96,
    'A3': 87,
    'G3': 78,
    'F3': 67,
    'E3': 58,
    'D3': 47,
    'C3': 37,
    'B2': 27,
    'A2': 17,
    'G2': 7,
  };

  // How far each note should be spaced
  final double _noteSpacing = 50;

  final List<NoteOnStave> _notesOnStaves = <NoteOnStave>[];

  final NextNote _nextNote;

  final MusicSheetModes _mode;

  final Clef _clef;

  MusicSheet(this._nextNote, this._mode, this._clef);

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
      int? position = _trebleClefNotes[note.getNameWithoutSymbol()];
      if (_clef == Clef.bass) {
        position = _bassClefNotes[note.getNameWithoutSymbol()];
      }
      if (position != null) {
        double pos = position.toDouble();
        NoteOnStave newNote = NoteOnStave(note, _startLine, pos);
        _notesOnStaves.add(newNote);
        NoteImageBuilder.drawNote(newNote, canvas, _baseLine, _clef);
      }
    }
    else {
      for (NoteOnStave note in _notesOnStaves) {
        NoteImageBuilder.drawNote(note, canvas, _baseLine, _clef);
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