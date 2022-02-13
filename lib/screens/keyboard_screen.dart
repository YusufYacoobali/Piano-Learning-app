import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final whiteKeyButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.white,
  minimumSize: const Size(double.infinity, double.infinity),
  padding: const EdgeInsets.all(20.0),
);

const whiteKeyTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);

final blackKeyButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.black,
  minimumSize: const Size(double.infinity, double.infinity),
  padding: const EdgeInsets.all(10.0),
);

const blackKeyTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);

class _KeyboardScreenState extends State<KeyboardScreen> {
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

  Widget getWhiteKey(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        child: Column(
          children: [
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

  Widget getBlackKey(String buttonText) {
    return ElevatedButton(
      child: Column(
        children: [
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

  List<Widget> getWhiteKeys() {
    List<Widget> whiteKeys = [];
    List<String> notes = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
    for (int i = 0; i < notes.length; ++i) {
      whiteKeys.add(getWhiteKey(notes[i]));
    }
    return whiteKeys;
  }

  Widget getBlackKeySpace(int flex) {
    return Expanded(
      flex: flex,
      child: Container(),
    );
  }

  List<Widget> getBlackKeys() {
    List<String> notes = ['Db', 'Eb', 'Gb', 'Ab', 'Bb'];
    List<Widget> blackKeys = [
      getBlackKeySpace(4),
      Expanded(
        flex: 3,
        child: getBlackKey(notes[0]),
      ),
      getBlackKeySpace(3),
      Expanded(
        flex: 3,
        child: getBlackKey(notes[1]),
      ),
      getBlackKeySpace(8),
      Expanded(
        flex: 3,
        child: getBlackKey(notes[2]),
      ),
      getBlackKeySpace(3),
      Expanded(
        flex: 3,
        child: getBlackKey(notes[3]),
      ),
      getBlackKeySpace(3),
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
              // TODO: Add music sheet to play on keyboard
              child: Container(),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.black,
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

class KeyboardScreen extends StatefulWidget {
  static const String id = 'keyboard_screen';

  const KeyboardScreen({Key? key}) : super(key: key);

  @override
  _KeyboardScreenState createState() => _KeyboardScreenState();
}
