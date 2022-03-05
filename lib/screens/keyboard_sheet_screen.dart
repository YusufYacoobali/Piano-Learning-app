import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../components/sheet_music_components/music_sheet.dart';
import '../components/sheet_music_components/note.dart';
import '../components/sheet_music_components/progress_timer.dart';
import '../constants.dart';

/// Temporary proof of concept screen for moving notes along
class KeyboardSheetScreenState extends State<KeyboardSheetScreen> {
  late final MusicSheet _sheet;
  late ProgressTimer _timer;
  bool _isStarted = false;

  final NextNote _nextNote = NextNote();

  final player = AudioCache();

  void playSound(String noteName) => player.play('note_$noteName.wav');

  void rebuild() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _sheet = MusicSheet(_nextNote, MusicSheetModes.playAlong, Clef.treble);
    _timer = ProgressTimer(_sheet, _nextNote, this);
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
      appBar: AppBar(
        title: const Text('Sheet Music'),
        actions: [
          ElevatedButton(
              child: const Text('Go to another demo'),
              onPressed: () {
                Navigator.pushNamed(context, 'note_selector_sheet_screen');
              }),
          ElevatedButton(
              child: const Text('Start'),
              onPressed: () {
                if (!_isStarted) {
                  _isStarted = true;
                  setState(() {
                    _timer.start();
                  });
                }
              }),
          ElevatedButton(
              child: const Text('Stop'),
              onPressed: () {
                if (_isStarted) {
                  _isStarted = false;
                  setState(() {
                    _timer.stop();
                  });
                }
              }),
          ElevatedButton(
              child: const Text('Increment'),
              onPressed: () {
                setState(() {
                  _timer.increment();
                });
              }),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Scaffold(
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

class KeyboardSheetScreen extends StatefulWidget {
  static const String id = 'keyboard_sheet_screen';

  const KeyboardSheetScreen({Key? key}) : super(key: key);

  @override
  KeyboardSheetScreenState createState() => KeyboardSheetScreenState();
}
