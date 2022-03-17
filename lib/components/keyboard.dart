import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../constants.dart';

/// Keyboard widget
class Keyboard extends StatelessWidget {
  /// Used to play note sounds
  final player = AudioCache();

  /// The function to be called when a key is pressed
  final Function function;

  /// Constructor
  Keyboard({Key? key, required this.function}) : super(key: key);

  /// Plays the sound of the note that was pressed
  void playSound(String noteName) => player.play('note_$noteName.wav');

  /// Returns the text widget displayed on the white keys
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

  /// Returns the text widget displayed on the black keys
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
          function(buttonText);
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
        function(buttonText);
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
