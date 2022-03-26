import 'package:flutter/material.dart';

import 'note.dart';
import 'note_image_builder.dart';
import 'note_on_stave.dart';
import 'stave_builder.dart';
import '../../constants.dart';

/// A music sheet
class MusicSheet extends CustomPainter {
  /// The place where the notes appear
  late double startLine;

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

  /// Set the initial value stave background border is not rounded
  bool isRoundedBorder = false;

  MusicSheet(this.nextNote, this.clef) {
    noteImageBuilder = NoteImageBuilder(clef);
  }

  /// The option to change the border of the stave to be round
  void changeToRoundedBorder() {
    isRoundedBorder = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    noteImageBuilder.setCanvas(canvas);

    /// Sets the initial values
    if (!hasSet) {
      hasSet = true;
      baseLine = size.height / 2 + 20;
      noteImageBuilder.setBaseLine(baseLine);
    }
    double start = size.width / 5;
    double canvasWidth = size.width / 1.4;
    startLine = start + (canvasWidth / 1.7);

    /// Draws the stave
    StaveBuilder.makeBackground(
        canvas, size, start, start + canvasWidth, isRoundedBorder);
    StaveBuilder.drawStave(canvas, size, baseLine, start, start + canvasWidth,
        clef == Clef.treble);

    removeNotes();

    /// Draws the next note
    if (nextNote.hasNextNote) {
      clear();
      drawNewNote();
    }

    drawNotes();
  }

  /// Removes notes that are beyond the end line
  void removeNotes() {
    if (notesOnStaves.length > 1) {
      int excess = notesOnStaves.length - 1;
      for (int i = 0; i < excess; ++i) {
        notesOnStaves.removeLast();
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

  /// Changes the clef
  void changeClef(Clef c) {
    clef = c;
    noteImageBuilder.changeClef(clef);
  }

  @override
  bool shouldRepaint(MusicSheet oldDelegate) => true;
}
