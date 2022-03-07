import 'package:flutter/material.dart';

import 'note.dart';
import 'note_image_builder.dart';
import 'note_on_stave.dart';
import 'stave_builder.dart';
import 'package:sight_reading_app/constants.dart';

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

  // The place where the notes disappear
  late double _endLine;

  // The first line of the stave
  late double _baseLine;

  // How far each note should move
  final double _noteSpacing = 1;

  final List<NoteOnStave> _notesOnStaves = <NoteOnStave>[];

  // Builds the notes on the stave
  late final NoteImageBuilder _noteImageBuilder;

  final NextNoteNotifier _nextNote;

  final MusicSheetModes _mode;

  final Clef _clef;

  bool _hasSet = false;

  MusicSheet(this._nextNote, this._mode, this._clef) {
    _noteImageBuilder = NoteImageBuilder(_clef);
  }

  @override
  void paint(Canvas canvas, Size size) {
    _noteImageBuilder.setCanvas(canvas);
    if (!_hasSet) {
      _hasSet = true;
      _baseLine = size.height/2 + 20;
      _noteImageBuilder.setBaseLine(_baseLine);
    }
    double start = 0;
    double canvasWidth = 0;
    if (_mode == MusicSheetModes.playAlong) {
      canvasWidth = size.width;
      _startLine = canvasWidth + 40;
    }
    else if (_mode == MusicSheetModes.showNotes) {
      start = size.width/3;
      canvasWidth = size.width/3;
      _startLine =  start + (canvasWidth/2);
    }
    else {
      start = size.width/3;
      canvasWidth = size.width/3;
      _startLine = start + (canvasWidth/2);
    }
    _endLine = 100;

    StaveBuilder.drawStave(canvas, size, _baseLine, start, start + canvasWidth, _clef == Clef.treble);

    for (int count = 0; count < _notesOnStaves.length; count++) {
      if (_notesOnStaves[count].pos < _endLine) {
        _notesOnStaves.remove(_notesOnStaves[count]);
        count--;
      }
    }

    if (_nextNote.hasNextNote) {
      if (!(_mode == MusicSheetModes.playAlong)) {
        clear();
      }
      Note note = _nextNote.getNextNote();
      int? position = trebleClefSheetNoteOffset[note.getNameWithoutSymbol()];
      if (_clef == Clef.bass) {
        position = bassClefSheetNoteOffset[note.getNameWithoutSymbol()];
      }
      if (position != null) {
        double pos = position.toDouble();
        NoteOnStave newNote = NoteOnStave(note, _startLine, pos);
        _notesOnStaves.add(newNote);
        _noteImageBuilder.drawNote(newNote);
      }
    }
    drawNotes();
  }

  void drawNotes() {
    for (NoteOnStave note in _notesOnStaves) {
      _noteImageBuilder.drawNote(note);
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

  Clef getClef() {
    return _clef;
  }

  @override
  bool shouldRepaint(MusicSheet oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(MusicSheet oldDelegate) => false;
}