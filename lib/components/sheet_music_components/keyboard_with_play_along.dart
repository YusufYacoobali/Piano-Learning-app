import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/sheet_music_components/note_played_checker.dart';
import '../../constants.dart';
import '../keyboard.dart';
import 'music_sheet.dart';
import 'note.dart';

class KeyboardWithPlayAlong extends Keyboard {
  final MusicSheet _sheet;
  final NotePlayedChecker _notePlayedChecker;

  KeyboardWithPlayAlong(this._sheet, this._notePlayedChecker, {Key? key}) : super(key: key);

  // Returns the buttons for the white keys
  @override
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
          String level = '4';
          if (_sheet.getClef() == Clef.bass) {
            level = '3';
          }
          _notePlayedChecker.checkPress(buttonText + level);
        },
        style: whiteKeyButtonStyle,
      ),
    );
  }

  // Returns the buttons for the black keys
  @override
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
        _notePlayedChecker.checkPress(buttonText + level);
      },
      style: blackKeyButtonStyle,
    );
  }
}