import 'dart:ui';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'note.dart';
import 'note_on_stave.dart';
import '../../constants.dart' as constants;

/// Builds a note on the stave
class NoteImageBuilder {
  Clef _clef;
  late Canvas _canvas;
  late final double _baseLine;

  NoteImageBuilder(this._clef);

  void changeClef(Clef clef) {
    _clef = clef;
  }

  /// Updates the canvas
  void setCanvas(Canvas canvas) {
    _canvas = canvas;
  }

  void setBaseLine(double baseLine) {
    _baseLine = baseLine;
  }

  /// Whether the note is on a line
  bool _isOnLine(Note note) {
    List<String> trebleNotes = <String>['C4', 'E4', 'G4', 'B4', 'D5', 'F5'];
    List<String> bassNotes = <String>['C4', 'A3', 'F3', 'D3', 'B2'];
    if (_clef == Clef.treble) {
      for (String n in trebleNotes) {
        if (note.getNameWithoutSymbol() == n) return true;
      }
    } else {
      for (String n in bassNotes) {
        if (note.getNameWithoutSymbol() == n) return true;
      }
    }
    return false;
  }

  /// Draws a quaver
  void _drawQuaver(NoteOnStave note) {
    _drawCircle(note);
    _drawTail(note);

    Paint accent = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    String min = constants.trebleClefMidLineNote;
    if (_clef == Clef.bass) {
      min = constants.bassClefMidLineNote;
    }

    if (Note.greaterOrEqualTo(note.note, Note(name: min, duration: -1))) {
      Offset start = Offset(note.pos, _baseLine - note.height + 60);
      Offset end = Offset(note.pos + 20, _baseLine - note.height + 30);
      _canvas.drawLine(start, end, accent);
    } else {
      Offset start = Offset(note.pos + 20, _baseLine - note.height - 60);
      Offset end = Offset(note.pos + 40, _baseLine - note.height - 30);
      _canvas.drawLine(start, end, accent);
    }
  }

  /// Draws a dot beside a note
  void _drawDot(NoteOnStave note) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    double pos = _baseLine - note.height + 8;
    if (_isOnLine(note.note)) pos = pos - 9;

    Offset point = Offset(note.pos + 34, pos);
    _canvas.drawPoints(PointMode.points, <Offset>[point], paint);
  }

  /// Draws either a sharp or a flat beside the note
  void _drawSymbol(NoteOnStave note, bool isFlat) {
    double font = constants.androidSharpFontSize;
    String symbol = constants.sharp;
    double x = note.pos - 27;
    double position = _baseLine - note.height - constants.androidSharpOffset;
    if (Platform.isIOS) {
      font = constants.iosSharpFontSize;

      /// Change this to change ios sharp position
      position = _baseLine - constants.iosSharpOffset;

      if (isFlat) {
        x = note.pos - 25;
        symbol = constants.flat;
        font = constants.iosFlatFontSize;

        /// Change this to change ios flat position
        position = _baseLine - note.height - constants.iosFlatOffset;
      }
    } else {
      if (isFlat) {
        x = note.pos - 25;
        symbol = constants.flat;
        font = constants.androidFlatFontSize;
        position = _baseLine - note.height - constants.androidFlatOffset;
      }
    }

    // Draws on the Clef
    TextPainter textPainter = TextPainter(
        textScaleFactor: 1,
        text: TextSpan(
            text: symbol,
            style: TextStyle(fontSize: font, color: Colors.black)),
        textDirection: TextDirection.ltr)
      ..layout();

    textPainter.paint(
      _canvas,
      Offset(x, position),
    );
  }

  /// Draws a tail
  void _drawTail(NoteOnStave note) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    double lineStart = _baseLine - note.height + 10;
    double lineEnd = _baseLine - note.height - 60;
    double lineXPos = note.pos + 20;

    String min = constants.trebleClefMidLineNote;
    if (_clef == Clef.bass) {
      min = constants.bassClefMidLineNote;
    }

    if (Note.greaterOrEqualTo(note.note, Note(name: min, duration: -1))) {
      lineEnd = _baseLine - note.height + 60;
      lineXPos = note.pos;
    }

    Offset startingPoint = Offset(lineXPos, lineStart);
    Offset endingPoint = Offset(lineXPos, lineEnd);

    _canvas.drawLine(startingPoint, endingPoint, paint);
  }

  _drawLines(NoteOnStave note) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    List<String>? lines;
    if (_clef == Clef.treble) {
      lines =
          constants.trebleClefNoteLinesOffset[note.note.getNameWithoutSymbol()];
    } else {
      lines =
          constants.bassClefNoteLinesOffset[note.note.getNameWithoutSymbol()];
    }
    if (lines != null) {
      for (String pos in lines) {
        int? offset;
        if (_clef == Clef.treble) {
          offset = constants.trebleClefSheetNoteOffset[pos];
        } else {
          offset = offset = constants.bassClefSheetNoteOffset[pos];
        }
        if (offset != null) {
          Offset startingPoint1 = Offset(note.pos - 5, _baseLine - offset + 8);
          Offset endingPoint1 = Offset(note.pos + 26, _baseLine - offset + 8);
          _canvas.drawLine(startingPoint1, endingPoint1, paint);
        }
      }
    }
  }

  /// Draws the circle
  void _drawCircle(NoteOnStave note,
      {PaintingStyle style = PaintingStyle.fill}) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = style;

    _drawLines(note);

    Rect rect = Rect.fromLTWH(note.pos, _baseLine - note.height, 20, 15);

    _canvas.drawOval(rect, paint);

    if (note.note.name.length == 3) {
      _drawSymbol(note, note.note.name[1] == 'b');
    }
  }

  /// Draws the note on the screen
  void drawNote(NoteOnStave note) {
    if (note.note.duration == 0.5) {
      // Quaver
      _drawQuaver(note);
    } else if (note.note.duration == 1) {
      // Crotchet
      _drawCircle(note);
      _drawTail(note);
    } else if (note.note.duration == 1.5) {
      // Dotted crotchet
      _drawCircle(note);
      _drawTail(note);
      _drawDot(note);
    } else if (note.note.duration == 2) {
      // Minim
      _drawCircle(note, style: PaintingStyle.stroke);
      _drawTail(note);
    } else if (note.note.duration == 3) {
      // Dotted minim
      _drawCircle(note, style: PaintingStyle.stroke);
      _drawTail(note);
      _drawDot(note);
    } else if (note.note.duration == 4) {
      // Semibreve
      _drawCircle(note, style: PaintingStyle.stroke);
    }
  }
}
