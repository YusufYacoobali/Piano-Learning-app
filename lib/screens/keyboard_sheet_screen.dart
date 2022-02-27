import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../constants.dart';

import 'sheet_music_screen.dart';

/// This is only a temporary duplicate file to test the keyboard with the sheet music

class _KeyboardSheetScreenState extends State<KeyboardSheetScreen> {
  final player = AudioCache();

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
    List<String> notes = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
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
    List<String> notes = ['Db', 'Eb', 'Gb', 'Ab', 'Bb'];
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
            const Expanded(
              flex: 5,
              // TODO: Add music sheet to play on keyboard
              child: SheetMusicScreen(),
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
  _KeyboardSheetScreenState createState() => _KeyboardSheetScreenState();
}
