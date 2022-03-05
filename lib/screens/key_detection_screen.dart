import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:sight_reading_app/components/sheet_music_components/keyboard_with_detection.dart';
import '../components/keyboard.dart';
import '../components/sheet_music_components/music_sheet.dart';
import '../components/sheet_music_components/note.dart';
import '../constants.dart';

/// Temporary proof of concept of detecting
class _KeyDetectionScreenState extends State<KeyDetectionScreen> {
  final player = AudioCache();

  late MusicSheet _sheet;
  final NextNote _nextNote = NextNote();

  bool _toggle = false;

  _KeyDetectionScreenState() {
    _sheet = MusicSheet(_nextNote, MusicSheetModes.detectKeys, Clef.treble);
  }

  void playSound(String noteName) => player.play('note_$noteName.wav');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                            _sheet = MusicSheet(
                                _nextNote, MusicSheetModes.detectKeys, clef);
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
              child: KeyboardWithDetection(_sheet, _nextNote).build(context),
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
