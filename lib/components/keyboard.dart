import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../storage_reader_writer.dart';
import '../constants.dart';

/// The piano keyboard that is displayed on the screen.
///
/// Users play notes on the keyboard to play along to sheet music or to answer questions.
class Keyboard extends StatefulWidget {
  static const String id = 'keyboard';

  /// The function to be called when a key is pressed
  ///
  /// It should get the key pressed on the keyboard
  final Function(String) onKeyPressed;

  /// The octave of sounds to play
  final int octave;

  //final String difficulty = StorageReaderWriter().read('difficulty').toString();

  const Keyboard(this.onKeyPressed, this.octave, {Key? key}) : super(key: key);

  @override
  State<Keyboard> createState() => _KeyboardState();
}

/// The keyboard widget
class _KeyboardState extends State<Keyboard> {
  /// Used to play note sounds
  final player = AudioCache();

  /// The difficulty the user selected in settings.
  ///
  /// It is set to a default difficulty until the actual difficulty is retrieved.
  String _difficulty = defaultDifficultyLevel;

  /// Constructor
  _KeyboardState() {
    getDifficulty();
  }

  /// Loads the difficulty setting from storage
  void getDifficulty() async {
    StorageReaderWriter writer = StorageReaderWriter();
    writer.loadDataFromStorage().then((value) {
      setState(() {
        _difficulty = writer.read('difficulty').toString();
      });
    });
  }

  /// Plays the sound of the note that was pressed.
  void playSound(String noteName) {
    // Play a sound file depending on the current octave
    if (widget.octave == 1) {
      player.play('note_low_$noteName.wav');
    } else if (widget.octave == 2) {
      player.play('note_middle_$noteName.wav');
    } else {
      player.play('note_high_$noteName.wav');
    }
  }

  /// The text widget displayed on the white keys.
  Widget getWhiteKeyChild(String buttonText) {
    return Visibility(
      // Beginners see the names of all white keys
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

  /// The text widget displayed on the black keys.
  Widget getBlackKeyChild(String buttonText) {
    return Visibility(
      // Non-expert difficulty users see the names of all black keys
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

  /// A button for the white key.
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
          String text = buttonText + (widget.octave + 2).toString();
          if (buttonText[0] == 'C') text = buttonText;
          widget.onKeyPressed(text);
        },
        style: whiteKeyButtonStyle,
      ),
    );
  }

  /// The button for the black key.
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
        String text = buttonText + (widget.octave + 2).toString();
        if (buttonText[0] == 'C') text = buttonText;
        widget.onKeyPressed(text);
      },
      style: blackKeyButtonStyle,
    );
  }

  /// The list of white keys.
  List<Widget> getWhiteKeys() {
    List<Widget> whiteKeys = [];
    List<String> notes = whiteKeyNames;
    for (int i = 0; i < notes.length; ++i) {
      String keyName = notes[i];

      ///assigns the key names to the right octave
      if (notes[i] == 'C') {
        if (widget.octave == 1) {
          keyName = 'C3';
        } else if (widget.octave == 2) {
          keyName = 'C4';
        } else {
          keyName = 'C5';
        }
        whiteKeys.add(getWhiteKey(keyName));
      } else {
        whiteKeys.add(getWhiteKey(keyName));
      }
    }
    return whiteKeys;
  }

  /// An empty expanded used to create a gap between the black keys.
  Widget getBlackKeySpace(int flex) {
    return Expanded(
      flex: flex,
      child: Container(),
    );
  }

  /// The list of black keys with the gaps in between them.
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
