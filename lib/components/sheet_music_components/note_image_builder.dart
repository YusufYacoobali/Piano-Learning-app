import 'dart:ui';

import 'package:flutter/material.dart';

import 'note.dart';
import 'note_on_stave.dart';
import 'package:sight_reading_app/constants.dart';

/// Builds a note on the stave
class NoteImageBuilder {

  final Clef _clef;
  late Canvas _canvas;
  late final double _baseLine;

  NoteImageBuilder(this._clef);

  void setCanvas(Canvas canvas) {
    _canvas = canvas;
  }

  void setBaseLine(double baseLine) {
    _baseLine = baseLine;
  }

  /// Whether the note is on a line
  bool _isOnLine (Note note) {
    List<String> trebleNotes = <String>['C4', 'E4', 'G4', 'B4', 'D5', 'F5'];
    List<String> bassNotes = <String>['C4', 'A3', 'F3', 'D3', 'B2'];
    if (_clef == Clef.treble) {
      for (String n in trebleNotes) {
        if (note.getNameWithoutSymbol() == n) return true;
      }
    }
    else {
      for (String n in bassNotes) {
        if (note.getNameWithoutSymbol() == n) return true;
      }
    }
    return false;
  }

  void _drawQuaver(NoteOnStave note) {
    _drawCircle(note);
    _drawTail(note);

    Paint accent = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    String min = trebleClefMidLineNote;
    if (_clef == Clef.bass) {
      min = bassClefMidLineNote;
    }

    if (Note.greaterOrEqualTo(note.note, Note(min, -1))) {
      Offset start = Offset(note.pos, _baseLine - note.height + 60);
      Offset end = Offset(note.pos + 20, _baseLine - note.height + 30);
      _canvas.drawLine(start, end, accent);
    }
    else {
      Offset start = Offset(note.pos + 20, _baseLine - note.height - 60);
      Offset end = Offset(note.pos + 40, _baseLine - note.height - 30);
      _canvas.drawLine(start, end, accent);
    }
  }

  void _drawDot(NoteOnStave note) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    double pos = _baseLine - note.height + 8;
    if (_isOnLine(note.note)) pos = pos - 9;

    Offset point = Offset(note.pos + 32, pos);
    _canvas.drawPoints(PointMode.points, <Offset>[point], paint);
  }

  void _drawSymbol(NoteOnStave note, bool isFlat) {
    String symbol = '♯';
    double x = note.pos - 27;
    double y = _baseLine - note.height - 20;
    double size = 30;
    if (isFlat) {
      symbol = '♭';
      x = note.pos - 25;
      y = _baseLine - note.height - 35;
      size = 45;
    }

    TextPainter textPainter = TextPainter(
        text: TextSpan(
            text: symbol,
            style: TextStyle(
                fontSize: size, color: Colors.black)),
        textDirection: TextDirection.ltr
    )
      ..layout();

    textPainter.paint(_canvas, Offset(x, y), );
  }

  void _drawTail(NoteOnStave note) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    double lineStart = _baseLine - note.height+10;
    double lineEnd = _baseLine - note.height - 60;
    double lineXPos = note.pos + 20;

    String min = trebleClefMidLineNote;
    if (_clef == Clef.bass) {
      min = bassClefMidLineNote;
    }

    if (Note.greaterOrEqualTo(note.note, Note(min, -1))) {
      lineEnd = _baseLine - note.height + 60;
      lineXPos = note.pos;
    }

    Offset startingPoint = Offset(lineXPos, lineStart);
    Offset endingPoint = Offset(lineXPos, lineEnd);

    _canvas.drawLine(startingPoint, endingPoint, paint);
  }

  void _drawCircle(NoteOnStave note, {PaintingStyle style = PaintingStyle.fill}) {

    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = style;

    Rect rect = Rect.fromLTWH(note.pos, _baseLine - note.height, 20, 15);

    _canvas.drawOval(rect, paint);

    if (note.note.getNameWithoutSymbol() == 'C4') {
      Offset startingPoint1 = Offset(note.pos - 5, _baseLine - note.height + 8);
      Offset endingPoint1 = Offset(note.pos + 27, _baseLine - note.height  + 8);
      _canvas.drawLine(startingPoint1, endingPoint1, paint);
    }

    if (note.note.name.length == 3) {
      _drawSymbol(note, note.note.name[1] == 'b');
    }
  }

  /// Draws the note on the screen
  void drawNote(NoteOnStave note) {
    if (note.note.duration == 0.5) {
      _drawQuaver(note);
    }
    else if (note.note.duration == 1) {
      _drawCircle(note);
      _drawTail(note);
    }
    else if (note.note.duration == 1.5) {
      _drawCircle(note);
      _drawTail(note);
      _drawDot(note);
    }
    else if (note.note.duration == 2) {
      _drawCircle(note, style: PaintingStyle.stroke);
      _drawTail(note);
    }
    else if (note.note.duration == 3) {
      _drawCircle(note, style: PaintingStyle.stroke);
      _drawTail(note);
      _drawDot(note);
    }
    else if (note.note.duration == 4) {
      _drawCircle(note, style: PaintingStyle.stroke);
    }
  }
}