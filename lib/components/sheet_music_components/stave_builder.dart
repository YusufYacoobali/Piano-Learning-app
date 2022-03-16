import 'package:flutter/material.dart';

import 'dart:io' show Platform;

import '../../constants.dart' as constants;

class StaveBuilder {
  static void makeBackground(Canvas canvas, Size size, double start, double end) {
    // Draws the white background
    canvas.drawRect(
        Offset(start, size.height ~/ 2 - 100) & Size(end - start, 170), Paint()
      ..color = Colors.white);
  }

  static void drawStave(Canvas canvas, Size size, double baseLine, double start, double end, bool isTrebleClef) {

    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    // Draws the lines

    Offset startingPoint = Offset(start, baseLine);
    Offset endingPoint = Offset(end, baseLine);
    canvas.drawLine(startingPoint, endingPoint, paint);

    Offset startingPoint1 = Offset(start, baseLine - 20);
    Offset endingPoint1 = Offset(end, baseLine - 20);
    canvas.drawLine(startingPoint1, endingPoint1, paint);

    Offset startingPoint2 = Offset(start, baseLine - 40);
    Offset endingPoint2 = Offset(end, baseLine - 40);
    canvas.drawLine(startingPoint2, endingPoint2, paint);

    Offset startingPoint3 = Offset(start, baseLine - 60);
    Offset endingPoint3 = Offset(end, baseLine - 60);
    canvas.drawLine(startingPoint3, endingPoint3, paint);

    Offset startingPoint4 = Offset(start, baseLine - 80);
    Offset endingPoint4 = Offset(end, baseLine - 80);
    canvas.drawLine(startingPoint4, endingPoint4, paint);

    //int trebleFont =

    double font = constants.androidTrebleClefFont;
    String clef = constants.trebleClef;
    double position = baseLine - constants.androidTrebleClefOffset;
    if (Platform.isIOS) {
      font = constants.iosTrebleClefFont;

      /// Change this to change ios treble clef position
      position = baseLine - constants.iosTrebleClefOffset;

      if (!isTrebleClef) {
        clef = constants.bassClef;
        font = constants.iosBassClefFont;

        /// Change this to change ios bass clef position
        position = baseLine - constants.iosBassClefOffset;
      }
    }
    else {
      if (!isTrebleClef) {
        clef = constants.bassClef;
        font = constants.androidBassClefFont;
        position = baseLine - constants.androidBassClefOffset;
      }
    }

    // Draws on the Clef
    TextPainter textPainter = TextPainter(
      textScaleFactor: 1,
        text: TextSpan(
            text: clef,
            style: TextStyle(
                fontSize: font, color: Colors.black)),
        textDirection: TextDirection.ltr)
      ..layout();

    textPainter.paint(canvas, Offset(start + 20, position));
  }

  static void drawBox(Canvas canvas, Size size, double baseLine, double start, double end) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(100, 0, 255, 0)
      ..style = PaintingStyle.fill;

    canvas.drawRect(Offset(start, baseLine - 120) & Size(end - start, 170), paint);
  }
}