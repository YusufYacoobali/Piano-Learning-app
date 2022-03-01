import 'dart:ui';

import 'package:flutter/material.dart';

import 'note_on_stave.dart';

/// TODO Draw quavers on the stave

class NoteImageBuilder {

  static bool _isOnLine (String note) {
    List<String> notes = <String>['C4', 'E4', 'G4', 'B4', 'D5'];
    for (String n in notes) {
      if (note[0] == n[0] && note[note.length - 1] == n[n.length - 1]) return true;
    }
    return false;
  }

  static void _drawQuaver(NoteOnStave note, Canvas canvas, double baseLine) {
    _drawCircle(note, canvas, baseLine);
    _drawTail(note, canvas, baseLine);

    Paint accent = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    if (int.parse(note.note.name[note.note.name.length - 1]) > 4) {
      Offset start = Offset(note.pos, baseLine - note.height + 60);
      Offset end = Offset(note.pos - 20, baseLine - note.height + 30);
      canvas.drawLine(start, end, accent);
    }
    else {
      Offset start = Offset(note.pos + 20, baseLine - note.height - 60);
      Offset end = Offset(note.pos + 40, baseLine - note.height - 30);
      canvas.drawLine(start, end, accent);
    }
  }

  static void drawQuavers(List<NoteOnStave> notes, Canvas canvas, double baseLine, double noteSpacing) {
    NoteOnStave first = notes.first;
    NoteOnStave last = notes.last;

    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    Paint top = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    if (first.note.name[first.note.name.length-1] == '5' || last.note.name[first.note.name.length-1] == '5') {
      double startHeight = baseLine - first.height + 60;
      double endHeight = baseLine - last.height + 60;
      int count = 0;
      for (NoteOnStave note in notes) {
        Offset endNoteHeight = Offset(note.pos, startHeight + (endHeight - startHeight) * (count / notes.length));
        Offset startNoteHeight = Offset(note.pos, baseLine - note.height + 60);
        canvas.drawLine(startNoteHeight, endNoteHeight, paint);
        _drawCircle(note, canvas, baseLine);
        count++;
      }
      canvas.drawLine(Offset(first.pos, startHeight), Offset(last.pos, endHeight), top);
    }
    else {
      double startHeight = baseLine - first.height - 60;
      double endHeight = baseLine - last.height - 60;
      int count = 0;
      for (NoteOnStave note in notes) {
        Offset endNoteHeight = Offset(note.pos, startHeight + (endHeight - startHeight) * (count / notes.length));
        Offset startNoteHeight = Offset(note.pos, baseLine - note.height - 60);
        canvas.drawLine(startNoteHeight, endNoteHeight, paint);
        _drawCircle(note, canvas, baseLine);
        count++;
      }
      canvas.drawLine(Offset(first.pos, startHeight), Offset(last.pos, endHeight), top);
    }
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

  static void _drawSymbol(NoteOnStave note, Canvas canvas, double baseLine, bool isFlat) {
    String symbol = '♯';
    double x = note.pos - 27;
    double y = baseLine - note.height - 20;
    double size = 30;
    if (isFlat) {
      symbol = '♭';
      x = note.pos - 25;
      y = baseLine - note.height - 35;
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

    textPainter.paint(canvas, Offset(x, y), );
  }

  static void _drawTail(NoteOnStave note, Canvas canvas, double baseLine) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
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

    if (note.note.name[0] + note.note.name[note.note.name.length-1] == 'C4') {
      Offset startingPoint1 = Offset(note.pos - 5, baseLine - note.height + 8);
      Offset endingPoint1 = Offset(note.pos + 27, baseLine - note.height  + 8);
      canvas.drawLine(startingPoint1, endingPoint1, paint);
    }

    if (note.note.name.length == 3) {
      _drawSymbol(note, canvas, baseLine, note.note.name[1] == 'b');
    }
  }

  /// Draws the note on the screen
  static void drawNote(NoteOnStave note, Canvas canvas, double baseLine) {
    if (note.note.duration == 0.5) {
      _drawQuaver(note, canvas, baseLine);
    }
    else if (note.note.duration == 1) {
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