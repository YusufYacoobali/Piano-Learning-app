import 'package:flutter/material.dart';
import '../../constants.dart';
import '../keyboard.dart';
import 'music_sheet.dart';
import 'note.dart';

class KeyboardWithDetection extends Keyboard {
  final MusicSheet _sheet;
  final NextNoteNotifier _nextNote;

  KeyboardWithDetection(this._sheet, this._nextNote, {Key? key}) : super(key: key);

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
          Note note = Note(buttonText + level, 1);
          _nextNote.setNextNote(note);
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
        Note note = Note(buttonText + level, 1);
        _nextNote.setNextNote(note);
      },
      style: blackKeyButtonStyle,
    );
  }
}