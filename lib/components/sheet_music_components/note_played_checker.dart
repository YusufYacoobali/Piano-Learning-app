import '../../constants.dart';
import 'note.dart';
import 'note_notifier.dart';

/// Checks a key press on the keyboard against a note in the play area
class NotePlayedChecker {
  /// Gets the note in the note area
  final NextNoteNotifier noteNotifier;

  /// Where the note in the play area is hit
  bool noteHit = false;

  /// Function to be called when a note is hit or missed
  final Function onNotePass;

  NotePlayedChecker({required this.noteNotifier, required this.onNotePass});

  /// Checks if the key pressed is the note
  void checkPress(String name) {
    if (!noteNotifier.isNull() && !noteHit) {
      Note note = noteNotifier.get();
      if (note.name == name) {
        noteHit = true;
        onNotePass(noteHit);
      }
      else if (name.length == 3 && note.name.length == 3) {
        String noteWithoutOctave = name[0] + name[1];
        String alt = sharpFlatEquivalence[noteWithoutOctave]!;
        alt = alt + name[name.length - 1];
        if (note.name == alt) {
          noteHit = true;
          onNotePass(noteHit);
        }
      }
    }
  }

  /// Sets the next note to be played
  void setNewNote(Note note) {
    noteNotifier.setNextNote(note);
    noteHit = false;
  }

  /// Removes the note from the play area
  void removeNote() {
    if (!noteHit) {
      onNotePass(noteHit);
    }
  }
}