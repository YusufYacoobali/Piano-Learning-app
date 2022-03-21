import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../storage_reader_writer.dart';
import '../constants.dart';

/// Keyboard widget
class _KeyboardState extends State<Keyboard> {
  /// Used to play note sounds
  final player = AudioCache();

  String _difficulty = defaultDifficultyLevel;

  /// Constructor
  _KeyboardState() {
    getDifficulty();
  }

  void getDifficulty() async {
    StorageReaderWriter writer = StorageReaderWriter();
    writer.loadDataFromStorage().then((value) {
      setState(() {
        _difficulty = writer.read('difficulty').toString();
      });
    });
  }

  /// Plays the sound of the note that was pressed
  void playSound(String noteName) => player.play('note_$noteName.wav');

  /// Returns the text widget displayed on the white keys
  Widget getWhiteKeyChild(String buttonText) {
    return Visibility(
      visible: _difficulty == 'Beginner',
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          buttonText,
          style: whiteKeyTextStyle,
          textAlign: TextAlign.right,
        ),
      ),
    );
  }

  /// Returns the text widget displayed on the black keys
  Widget getBlackKeyChild(String buttonText) {
    return Visibility(
      visible: _difficulty != 'Expert',
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          buttonText,
          style: blackKeyTextStyle,
          textAlign: TextAlign.right,
        ),
      ),
    );
  }

  /// Returns a button for the white key
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
          widget.onKeyPressed(buttonText);
        },
        style: whiteKeyButtonStyle,
      ),
    );
  }

  /// Returns a button for the black key
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
        widget.onKeyPressed(buttonText);
      },
      style: blackKeyButtonStyle,
    );
  }

  /// Returns the list of white keys
  List<Widget> getWhiteKeys() {
    List<Widget> whiteKeys = [];
    List<String> notes = whiteKeyNames;
    for (int i = 0; i < notes.length; ++i) {
      whiteKeys.add(getWhiteKey(notes[i]));
    }
    return whiteKeys;
  }

  /// Returns an empty expanded used to create a gap between the black keys
  Widget getBlackKeySpace(int flex) {
    return Expanded(
      flex: flex,
      child: Container(),
    );
  }

  /// Returns the list of black keys with the gaps in between them
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
    return Container(
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
    );
  }
}

class Keyboard extends StatefulWidget {
  static const String id = 'keyboard';

  /// The function to be called when a key is pressed
  final Function(String) onKeyPressed;

  //final String difficulty = StorageReaderWriter().read('difficulty').toString();

  const Keyboard({Key? key, required this.onKeyPressed}) : super(key: key);

  @override
  State<Keyboard> createState() => _KeyboardState();

}
