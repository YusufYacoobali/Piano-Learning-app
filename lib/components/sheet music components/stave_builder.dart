import 'package:flutter/material.dart';

class StaveBuilder {
  static void drawStave(Canvas canvas, Size size, double baseLine, bool isTrebleClef) {
    // Draws the white background
    canvas.drawRect(
        Offset(0, size.height ~/ 2 - 100) & Size(size.width, 170), Paint()
      ..color = Colors.white);

    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    // Draws the lines

    Offset startingPoint = Offset(0, baseLine);
    Offset endingPoint = Offset(size.width, baseLine);
    canvas.drawLine(startingPoint, endingPoint, paint);

    Offset startingPoint1 = Offset(0, baseLine - 20);
    Offset endingPoint1 = Offset(size.width, baseLine - 20);
    canvas.drawLine(startingPoint1, endingPoint1, paint);

    Offset startingPoint2 = Offset(0, baseLine - 40);
    Offset endingPoint2 = Offset(size.width, baseLine - 40);
    canvas.drawLine(startingPoint2, endingPoint2, paint);

    Offset startingPoint3 = Offset(0, baseLine - 60);
    Offset endingPoint3 = Offset(size.width, baseLine - 60);
    canvas.drawLine(startingPoint3, endingPoint3, paint);

    Offset startingPoint4 = Offset(0, baseLine - 80);
    Offset endingPoint4 = Offset(size.width, baseLine - 80);
    canvas.drawLine(startingPoint4, endingPoint4, paint);

    String clef = '𝄞';
    double font = 70;
    double position = baseLine - 80;
    if (!isTrebleClef) {
      clef = '𝄢';
      font = 83;
      position = baseLine - 93;
    }

    // Draws on the Clef
    TextPainter textPainter = TextPainter(
        text: TextSpan(
            text: clef,
            style: TextStyle(
                fontSize: font, color: Colors.black)),
        textDirection: TextDirection.ltr)
      ..layout();

    textPainter.paint(canvas, Offset(20, position));
  }
}