import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/key_detection_screen.dart';

import '../components/sheet_music_components/note.dart';
import '../components/sheet_music_components/music_sheet.dart';

/// Temporary screen to test replacement for note images
class NoteSelectorSheetScreenState extends State<NoteSelectorSheetScreen> {

  late final MusicSheet _sheet;

  final NextNoteNotifier _nextNote = NextNoteNotifier();

  int _index = 0;

  final List<Note> _notes = <Note>[
    Note('Cb4', 1),
    Note('D4', 1.5),
    Note('E4', 0.5),
    Note('F#4', 2),
    Note('G4', 3),
    Note('A4', 3),
    Note('B4', 4),
    Note('C5', 0.5),
    Note('D5', 3),
    Note('E5', 1),
  ];

  @override
  void initState() {
    super.initState();
    _nextNote.setNextNote(_notes[_index % _notes.length]);
    _sheet = MusicSheet(_nextNote, MusicSheetModes.showNotes, Clef.treble);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Selector Music'),
        actions: [
          ElevatedButton(child: const Text('Go to yet another demo'), onPressed: () {
            Navigator.pushNamed(context, KeyDetectionScreen.id);
          }),
          ElevatedButton(child: const Text('Next'), onPressed: () {
            setState(() {
              _index++;
              _nextNote.setNextNote(_notes[_index % _notes.length]);
            });
          }),
          ElevatedButton(child: const Text('Clear'), onPressed: () {
            setState(() {
              _sheet.clear();
            });
          }),
        ],
      ),
      body: CustomPaint(
        painter: _sheet,
        child: Container(),
      ),
    );
  }
}

class NoteSelectorSheetScreen extends StatefulWidget {
  static const String id = 'note_selector_sheet_screen';

  const NoteSelectorSheetScreen({Key? key}) : super(key: key);

  @override
  NoteSelectorSheetScreenState createState() => NoteSelectorSheetScreenState();
}