import 'package:flutter/material.dart';

import 'note.dart';
import 'note_image_builder.dart';
import 'note_on_stave.dart';
import 'stave_builder.dart';
import '../../constants.dart';

class MusicSheet extends CustomPainter {
  /// The place where the notes appear
  late double startLine;

  /// The place where the notes disappear
  late double endLine;

  /// The first line of the stave
  late double baseLine;

  final List<NoteOnStave> notesOnStaves = <NoteOnStave>[];

  /// Builds the notes on the stave
  late final NoteImageBuilder noteImageBuilder;

  /// Gets the next note to be played
  final NextNoteNotifier nextNote;

  Clef clef;

  /// Whether the initial values have been set
  bool hasSet = false;

  MusicSheet(this.nextNote, this.clef) {
    noteImageBuilder = NoteImageBuilder(clef);
  }

  @override
  void paint(Canvas canvas, Size size) {
    noteImageBuilder.setCanvas(canvas);
    if (!hasSet) {
      hasSet = true;
      baseLine = size.height / 2 + 20;
      noteImageBuilder.setBaseLine(baseLine);
    }

    double start = size.width / 3;
    double canvasWidth = size.width / 3;
    startLine = start + (canvasWidth / 2);

    endLine = 100;
    StaveBuilder.makeBackground(canvas, size, start, start + canvasWidth);
    StaveBuilder.drawStave(canvas, size, baseLine, start, start + canvasWidth,
        clef == Clef.treble);

    removeNotes(canvas, size);

    if (nextNote.hasNextNote) {
      clear();
      drawNewNote();
    }
    drawNotes();
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

  /// Draws a new note on the canvas at the start line
  void drawNewNote() {
    if (!nextNote.isNull()) {
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
  }

  /// Draws all the notes on the screen
  void drawNotes() {
    for (NoteOnStave note in notesOnStaves) {
      noteImageBuilder.drawNote(note);
    }
  }

  /// Clears the notes from the sheet
  void clear() {
    int length = notesOnStaves.length;
    for (int i = 0; i < length; i++) {
      notesOnStaves.removeLast();
    }
  }

  /// Gets the clef
  Clef getClef() {
    return clef;
  }

  /// Changes the clef
  void changeClef(Clef c) {
    clef = c;
    noteImageBuilder.changeClef(clef);
  }

  @override
  bool shouldRepaint(MusicSheet oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(MusicSheet oldDelegate) => false;
}
