import '../../constants.dart';
import 'note.dart';

/// Checks a key press on the keyboard against a note in the play area
class NotePlayedChecker {
  /// Gets the note in the note area
  final NextNoteNotifier noteNotifier;

  /// Where the note in the play area is hit
  bool _noteHit = false;

  /// Function to be called when a note is hit or missed
  final Function(bool) onNotePass;

  final bool onePress;

  NotePlayedChecker({required this.noteNotifier, required this.onNotePass, this.onePress = false});

  /// Checks if the key pressed is the note
  void checkPress(String name) {
    if (!noteNotifier.isNull() && !_noteHit) {
      Note note = noteNotifier.get();
      if (note.name == name && !onePress) {
        _noteHit = true;
        onNotePass(_noteHit);
      }
      else if (onePress) {
        onNotePass(_noteHit);
      }
      else if (name.length == 3 && note.name.length == 3) {
        String noteWithoutOctave = name[0] + name[1];
        String alt = sharpFlatEquivalence[noteWithoutOctave]!;
        alt = alt + name[name.length - 1];
        if (note.name == alt && !onePress) {
          _noteHit = true;
          onNotePass(_noteHit);
        }
        else if (onePress) {
          onNotePass(_noteHit);
        }
      }
    }
  }

  /// Sets the next note to be played
  void setNewNote(Note note) {
    noteNotifier.setNextNote(note);
    _noteHit = false;
  }

  /// Removes the note from the play area
  void removeNote() {
    if (!_noteHit) onNotePass(_noteHit);
  }
}