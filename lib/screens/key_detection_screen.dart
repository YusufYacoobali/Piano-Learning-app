import 'package:flutter/material.dart';

import '../components/keyboard.dart';
import '../components/sheet_music_components/music_sheet.dart';
import '../components/sheet_music_components/note.dart';

/// Temporary proof of concept of detecting
class _KeyDetectionScreenState extends State<KeyDetectionScreen> {

  late MusicSheet _sheet;
  final NextNoteNotifier _nextNote = NextNoteNotifier();

  bool _toggle = false;

  _KeyDetectionScreenState() {
    _sheet = MusicSheet(_nextNote, Clef.treble);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void playKey(String text) {
    String level = '4';
    if (_sheet.getClef() == Clef.bass) {
      level = '3';
    }
    Note note = Note(name: '$text$level', duration: 1);
    _nextNote.setNextNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Key Detection'),
                  actions: [
                    Row(
                      children: [
                        const Text('Toggle Clefs'),
                        Switch.adaptive(
                          value: _toggle,
                          onChanged: (value) => setState(() {
                            _toggle = value;
                            _sheet.clear();
                            Clef clef = Clef.treble;
                            if (_toggle) clef = Clef.bass;
                            _sheet = MusicSheet(_nextNote, clef);
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
                body: CustomPaint(
                  painter: _sheet,
                  child: Container(),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Keyboard(function: playKey),
            ),
          ],
        ),
      ),
    );
  }
}

class KeyDetectionScreen extends StatefulWidget {
  static const String id = 'key_detection_screen';

  const KeyDetectionScreen({Key? key}) : super(key: key);

  @override
  _KeyDetectionScreenState createState() => _KeyDetectionScreenState();
}
