import 'dart:async';

import 'package:flutter/material.dart';

/// Progresses the sheet according to a beat
class ProgressTimer {
  final Sheet _sheet;
  bool _isOn = false;

  ProgressTimer(this._sheet);

  // TODO: Make start method work to get timer working

  void start() {
    _isOn = true;
      Timer.periodic(const Duration(milliseconds: 1000), (Timer t) {
        if (!_isOn) {
          t.cancel();
        } else {
          _sheet.increment();
        }
      }
      );
  }

  void stop() {
    _isOn = false;
  }
}

class Note {
  late String name;
  late int time;
  late double duration;

  Note(this.name, this.time, this.duration);
}

class NoteOnStave {
  late Note note;
  late double pos;
  late double height;

  NoteOnStave(this.note, this.pos, this.height);

  void move(int x) {
    pos-=x;
  }
}

class Sheet extends CustomPainter {

  late double _startLine;

  late double _endLine;

  // The first line of the stave
  late double _baseLine;

  final Map<String, int> _notes = <String, int>{
    'C4': -10,
    'D4': 0,
    'E4':7,
    'F4': 18,
    'G4': 27,
    'A4': 38,
    'B4': 47,
    'C5': 58,
    'D5': 67,
    'E5': 78,
  };

  int _time = 0;

  final double _noteSpacing = 50;

  final Map<int, Note> _map = <int, Note>{
    0: Note('C4', 0, 1),
    2: Note('E4', 2, 1),
    5: Note('D4', 5, 1),
    8: Note('D5', 8, 1),
    15: Note('D4', 15, 1),
    20: Note('G4', 20, 1),
    25: Note('F4', 25, 1),
  };

  final List<NoteOnStave> _notesOnStaves = <NoteOnStave>[];

  bool _increment = false;

  void _drawStaves(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    Offset startingPoint = Offset(0, _baseLine);
    Offset endingPoint = Offset(size.width, _baseLine);
    canvas.drawLine(startingPoint, endingPoint, paint);

    Offset startingPoint1 = Offset(0, _baseLine - 20);
    Offset endingPoint1 = Offset(size.width, _baseLine - 20);
    canvas.drawLine(startingPoint1, endingPoint1, paint);

    Offset startingPoint2 = Offset(0, _baseLine - 40);
    Offset endingPoint2 = Offset(size.width, _baseLine - 40);
    canvas.drawLine(startingPoint2, endingPoint2, paint);

    Offset startingPoint3 = Offset(0, _baseLine - 60);
    Offset endingPoint3 = Offset(size.width, _baseLine - 60);
    canvas.drawLine(startingPoint3, endingPoint3, paint);

    Offset startingPoint4 = Offset(0, _baseLine - 80);
    Offset endingPoint4 = Offset(size.width, _baseLine - 80);
    canvas.drawLine(startingPoint4, endingPoint4, paint);

    TextPainter textPainter = TextPainter(
        text: const TextSpan(
            text: '𝄞',
            style: TextStyle(
                fontSize: 70, color: Colors.black)),
        textDirection: TextDirection.ltr)
      ..layout();

    textPainter.paint(canvas, Offset(20, _baseLine - 80));
  }

  void drawNote(NoteOnStave note, Canvas canvas) {

    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    Rect rect = Rect.fromLTWH(note.pos, _baseLine - note.height, 20, 15);

    double lineStart = _baseLine - note.height+10;
    double lineEnd = _baseLine - note.height - 60;
    double lineXPos = note.pos + 20;

    if (int.parse(note.note.name[1]) > 4) {
      lineEnd = _baseLine - note.height + 60;
      lineXPos = note.pos;
    }

    Offset startingPoint = Offset(lineXPos, lineStart);
    Offset endingPoint = Offset(lineXPos, lineEnd);

    canvas.drawOval(rect, Paint());
    canvas.drawLine(startingPoint, endingPoint, paint);

    if (note.note.name == 'C4') {
      Offset startingPoint1 = Offset(note.pos - 5, _baseLine - note.height + 8);
      Offset endingPoint1 = Offset(note.pos + 27, _baseLine - note.height  + 8);
      canvas.drawLine(startingPoint1, endingPoint1, paint);
    }
  }


  @override
  void paint(Canvas canvas, Size size) {
    _baseLine = size.height / 2 + 20;

    _startLine = size.width + 40;

    _endLine = 100;

    canvas.drawRect(Offset(0, size.height ~/ 2 - 100) & Size(size.width, 170), Paint() ..color = Colors.white);

    _drawStaves(canvas, size);

    for (int count = 0; count < _notesOnStaves.length; count++)  {
      if (_notesOnStaves[count].pos < _endLine) {
        _notesOnStaves.remove(_notesOnStaves[count]);
        count--;
      }
    }

    if (_increment) {
      move(canvas);
      _increment = false;
    }
    else {
      for (NoteOnStave note in _notesOnStaves) {
        drawNote(note, canvas);
      }
    }

    Note? n = _map[_time];
    if (n != null) {
      int? i = _notes[n.name];
      if (i != null) {
        NoteOnStave note = NoteOnStave(n, _startLine, i.toDouble());
        _notesOnStaves.add(note);

        Rect rect = Rect.fromLTWH(note.pos, _baseLine - note.height, 20, 20);
        canvas.drawOval(rect, Paint());
      }
    }
  }

  void move(Canvas canvas) {
    for (NoteOnStave note in _notesOnStaves) {
      note.pos-=_noteSpacing;
    }
  }

  void increment() {
    _increment = true;
    _time++;
  }

  @override
  bool shouldRepaint(Sheet oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(Sheet oldDelegate) => false;
}

class _SheetMusicScreenState extends State<SheetMusicScreen> {

  final Sheet _sheet = Sheet();
  late ProgressTimer _timer;
  bool _isStarted = false;

  @override
  void initState() {
    super.initState();
    _timer = ProgressTimer(_sheet);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sheet Music'),
        actions: [
          ElevatedButton(child: const Text('Start'), onPressed: () {
            if (!_isStarted) {
              _isStarted = true;
            }
            setState(() {
              _timer.start();
          });}),
          ElevatedButton(child: const Text('Stop'), onPressed: () {
            if (_isStarted) {
              _isStarted = false;
            }
            setState(() {
              _timer.stop();
            });}),
          ElevatedButton(child: const Text('Increment'), onPressed: () => setState(() {_sheet.increment();})),
        ],
      ),
      body: CustomPaint(
        painter: _sheet,
        child: Container(),
      ),
    );
  }
}

class SheetMusicScreen extends StatefulWidget {
  static const String id = 'sheet_music_screen';

  const SheetMusicScreen({Key? key}) : super(key: key);

  @override
  _SheetMusicScreenState createState() => _SheetMusicScreenState();
}