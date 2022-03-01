import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/sheet%20music%20components/stave_builder.dart';

import 'note.dart';
import 'note_image_builder.dart';
import 'note_on_stave.dart';

class MusicSheet extends CustomPainter {

  // The place where the notes appear
  late double _startLine;

  // THe place where the notes disappear
  late double _endLine;

  // The first line of the stave
  late double _baseLine;

  // The offset from baseline of the notes
  final Map<String, int> _notes = <String, int>{
    'C4': -10,
    'D4': 0,
    'E4': 7,
    'F4': 18,
    'G4': 27,
    'A4': 38,
    'B4': 47,
    'C5': 58,
    'D5': 67,
    'E5': 78,
  };

  int _time = 0;

  // How far each note should be spaced
  final double _noteSpacing = 50;

  final Map<int, Note> _map = <int, Note>{
    0: Note('Cb4', 0, 1),
    2: Note('D4', 2, 1.5),
    5: Note('E4', 5, 0.5),
    8: Note('F#4', 8, 2),
    13: Note('G4', 15, 3),
    18: Note('A4', 20, 3),
    23: Note('B4', 25, 4),
    26: Note('C5', 25, 0.5),
    29: Note('D5', 25, 3),
    32: Note('E5', 25, 1),
  };

  final List<NoteOnStave> _notesOnStaves = <NoteOnStave>[];

  bool _increment = false;

  @override
  void paint(Canvas canvas, Size size) {

    _baseLine = size.height / 2 + 20;
    _startLine = size.width + 40;
    _endLine = 100;

    StaveBuilder.drawStave(canvas, size, _baseLine, false);

    for (int count = 0; count < _notesOnStaves.length; count++) {
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
        NoteImageBuilder.drawNote(note, canvas, _baseLine);
      }
    }

    Note? n = _map[_time];
    if (n != null) {
      int? i = _notes[n.name[0] + n.name[n.name.length - 1]];
      if (i != null) {
        NoteOnStave note = NoteOnStave(n, _startLine, i.toDouble());
        _notesOnStaves.add(note);

        NoteImageBuilder.drawNote(note, canvas, _baseLine);
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
  bool shouldRepaint(MusicSheet oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(MusicSheet oldDelegate) => false;
}