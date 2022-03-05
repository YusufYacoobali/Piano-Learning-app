import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
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

  // Returns the text displayed on the white keys
  Widget getWhiteKeyChild(String buttonText) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        buttonText,
        style: whiteKeyTextStyle,
        textAlign: TextAlign.right,
      ),
    );
  }

  // Returns the text displayed on the black keys
  Widget getBlackKeyChild(String buttonText) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        buttonText,
        style: blackKeyTextStyle,
        textAlign: TextAlign.right,
      ),
    );
  }

  // Returns the buttons for the white keys
  Widget getWhiteKey(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        child: Column(
          children: [
            // Ensures the name of the key is at the bottom
            const Spacer(),
            getWhiteKeyChild(buttonText),
          ],
        ),
        onPressed: () {
          playSound(buttonText.toLowerCase());
          setState(() {
            String level = '4';
            if (_sheet.getClef() == Clef.bass) {
              level = '3';
            }
            Note note = Note(buttonText + level, 1);
            _nextNote.setNextNote(note);
          });
        },
        style: whiteKeyButtonStyle,
      ),
    );
  }

  // Returns the buttons for the black keys
  Widget getBlackKey(String buttonText) {
    return ElevatedButton(
      child: Column(
        children: [
          // Ensures the name of the key is at the bottom
          const Spacer(),
          getBlackKeyChild(buttonText),
        ],
      ),
      onPressed: () {
        playSound(buttonText.toLowerCase());
        String level = '4';
        if (_sheet.getClef() == Clef.bass) {
          level = '3';
        }
        Note note = Note(buttonText + level, 1);
        _nextNote.setNextNote(note);
      },
      style: blackKeyButtonStyle,
    );
  }

  // Returns the list of white keys
  List<Widget> getWhiteKeys() {
    List<Widget> whiteKeys = [];
    List<String> notes = whiteKeyNames;
    for (int i = 0; i < notes.length; ++i) {
      whiteKeys.add(getWhiteKey(notes[i]));
    }
    return whiteKeys;
  }

  // Returns an empty expanded used to create a gap between the black keys
  Widget getBlackKeySpace(int flex) {
    return Expanded(
      flex: flex,
      child: Container(),
    );
  }

  // Returns the list of black keys with the gaps in between them
  List<Widget> getBlackKeys() {
    List<String> notes = blackKeyNames;
    List<Widget> blackKeys = [
      getBlackKeySpace(4),
      // C# or Db key
      Expanded(
        flex: 3,
        child: getBlackKey(notes[0]),
      ),
      getBlackKeySpace(3),
      // D# or Eb key
      Expanded(
        flex: 3,
        child: getBlackKey(notes[1]),
      ),
      getBlackKeySpace(8),
      // F# or Gb key
      Expanded(
        flex: 3,
        child: getBlackKey(notes[2]),
      ),
      getBlackKeySpace(3),
      // G# or Ab key
      Expanded(
        flex: 3,
        child: getBlackKey(notes[3]),
      ),
      getBlackKeySpace(3),
      // A# or Bb key
      Expanded(
        flex: 3,
        child: getBlackKey(notes[4]),
      ),
      getBlackKeySpace(4),
    ];
    return blackKeys;
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
              child: Container(
                color: Colors.black,
                // The black keys are stacked on top of the white keys
                child: Stack(
                  children: [
                    Row(
                      children: getWhiteKeys(),
                    ),
                    Column(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Row(
                            children: getBlackKeys(),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
