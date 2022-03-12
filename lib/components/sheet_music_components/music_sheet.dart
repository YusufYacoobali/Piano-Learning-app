import 'package:flutter/material.dart';

import 'note.dart';
import 'note_image_builder.dart';
import 'note_on_stave.dart';
import 'stave_builder.dart';
import '../../constants.dart';


class MusicSheet extends CustomPainter {

  // The place where the notes appear
  late double startLine;

  // The place where the notes disappear
  late double endLine;

  // The first line of the stave
  late double baseLine;

  // How far each note should move
  final double noteSpacing = 1;

  final List<NoteOnStave> notesOnStaves = <NoteOnStave>[];

  // Builds the notes on the stave
  late final NoteImageBuilder noteImageBuilder;

  final NextNoteNotifier nextNote;

  final Clef clef;

  bool hasSet = false;

  MusicSheet(this.nextNote, this.clef) {
    noteImageBuilder = NoteImageBuilder(clef);
  }

  @override
  void paint(Canvas canvas, Size size) {
    noteImageBuilder.setCanvas(canvas);
    if (!hasSet) {
      hasSet = true;
      baseLine = size.height/2 + 20;
      noteImageBuilder.setBaseLine(baseLine);
    }

    double start = size.width/3;
    double canvasWidth = size.width/3;
    startLine =  start + (canvasWidth/2);

    endLine = 100;
    StaveBuilder.makeBackground(canvas, size, 0, canvasWidth);
    StaveBuilder.drawStave(canvas, size, baseLine, 0, canvasWidth, clef == Clef.treble);

    removeNotes(canvas, size);

    if (nextNote.hasNextNote) {
      clear();
      drawNewNote();
    }
    drawNotes();
  }


  void removeNotes(Canvas canvas, Size size) {
    for (int count = 0; count < notesOnStaves.length; count++) {
      if (notesOnStaves[count].pos < endLine) {
        notesOnStaves.remove(notesOnStaves[count]);
        count--;
      }
    }
  }

  void drawNewNote() {
    Note note = nextNote.getNextNote();
    int? position = trebleClefSheetNoteOffset[note.getNameWithoutSymbol()];
    if (clef == Clef.bass) {
      position = bassClefSheetNoteOffset[note.getNameWithoutSymbol()];
    }
    if (position != null) {
      double pos = position.toDouble();
      NoteOnStave newNote = NoteOnStave(note, startLine, pos);
      notesOnStaves.add(newNote);
      noteImageBuilder.drawNote(newNote);
    }
  }

  void drawNotes() {
    for (NoteOnStave note in notesOnStaves) {
      noteImageBuilder.drawNote(note);
    }
  }

  void move() {
    for (NoteOnStave note in notesOnStaves) {
      note.pos-=noteSpacing;
    }
  }

  void clear() {
    int length = notesOnStaves.length;
    for (int i = 0; i < length; i++) {
      notesOnStaves.removeLast();
    }
  }

  Clef getClef() {
    return clef;
  }

  void changeClef(Clef clef) {
    _clef = clef;
    _noteImageBuilder.changeClef(clef);
  }

  @override
  bool shouldRepaint(MusicSheet oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(MusicSheet oldDelegate) => false;
}