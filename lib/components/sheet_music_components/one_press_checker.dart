import '../../constants.dart';
import 'note.dart';
import 'note_played_checker.dart';

/// Checks the first key press on the keyboard against a note in the play area
class OnePressChecker extends NotePlayedChecker {

  OnePressChecker({required noteNotifier, required onNotePass}) : super(noteNotifier: noteNotifier, onNotePass: onNotePass);

  /// Checks if the first key pressed in the green area is the note
  @override
  void checkPress(String name) {
    if (!noteNotifier.isNull() && !noteHit) {
      Note note = noteNotifier.get();
      if (note.name == name) {
        noteHit = true;
        onNotePass(noteHit, false);
      }
      else if (name.length == 3 && note.name.length == 3) {
        String noteWithoutOctave = name[0] + name[1];
        String alt = sharpFlatEquivalence[noteWithoutOctave]!;
        alt = alt + name[name.length - 1];
        if (note.name == alt) {
          noteHit = true;
          onNotePass(noteHit, false);
        }
        else if (note.name != alt) {
          onNotePass(false, false);
        }
      }
      else if (note.name != name) {
        onNotePass(false, false);
      }
    }
    else if (!noteHit && !noteNotifier.isNull()) {
      onNotePass(false, false);
      noteHit = true;
    }
  }

  /// Removes the note from the play area
  @override
  void removeNote() {
    if (!noteHit) {
      onNotePass(noteHit, true);
    }
  }
}