import 'dart:ui';

import 'package:flutter/material.dart';

import 'note_on_stave.dart';

class NoteImageBuilder {

  static bool _isOnLine (String note) {
    List<String> notes = <String>['C4', 'E4', 'G4', 'B4', 'D5'];
    for (String n in notes) {
      if (note == n) return true;
    }
    return false;
  }

  static void _drawDot(NoteOnStave note, Canvas canvas, double baseLine) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    double pos = baseLine - note.height + 8;
    if (_isOnLine(note.note.name)) pos = pos - 9;

    Offset point = Offset(note.pos + 32, pos);
    canvas.drawPoints(PointMode.points, <Offset>[point], paint);
  }

  static void _drawTail(NoteOnStave note, Canvas canvas, double baseLine) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    double lineStart = baseLine - note.height+10;
    double lineEnd = baseLine - note.height - 60;
    double lineXPos = note.pos + 20;

    if (int.parse(note.note.name[note.note.name.length - 1]) > 4) {
      lineEnd = baseLine - note.height + 60;
      lineXPos = note.pos;
    }

    Offset startingPoint = Offset(lineXPos, lineStart);
    Offset endingPoint = Offset(lineXPos, lineEnd);

    canvas.drawLine(startingPoint, endingPoint, paint);
  }

  static void _drawCircle(NoteOnStave note, Canvas canvas, double baseLine, {PaintingStyle style = PaintingStyle.fill}) {

    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = style;

    Rect rect = Rect.fromLTWH(note.pos, baseLine - note.height, 20, 15);

    canvas.drawOval(rect, paint);

    if (note.note.name == 'C4') {
      Offset startingPoint1 = Offset(note.pos - 5, baseLine - note.height + 8);
      Offset endingPoint1 = Offset(note.pos + 27, baseLine - note.height  + 8);
      canvas.drawLine(startingPoint1, endingPoint1, paint);
    }
  }

  /// Draws the note on the screen
  static void drawNote(NoteOnStave note, Canvas canvas, double baseLine) {
    if (note.note.duration == 1) {
      _drawCircle(note, canvas, baseLine);
      _drawTail(note, canvas, baseLine);
    }
    else if (note.note.duration == 1.5) {
      _drawCircle(note, canvas, baseLine);
      _drawTail(note, canvas, baseLine);
      _drawDot(note, canvas, baseLine);
    }
    else if (note.note.duration == 2) {
      _drawCircle(note, canvas, baseLine, style: PaintingStyle.stroke);
      _drawTail(note, canvas, baseLine);
    }
    else if (note.note.duration == 3) {
      _drawCircle(note, canvas, baseLine, style: PaintingStyle.stroke);
      _drawTail(note, canvas, baseLine);
      _drawDot(note, canvas, baseLine);
    }
    else if (note.note.duration == 4) {
      _drawCircle(note, canvas, baseLine, style: PaintingStyle.stroke);
    }
  }
}