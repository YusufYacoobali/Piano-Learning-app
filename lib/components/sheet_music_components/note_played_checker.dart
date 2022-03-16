import 'note.dart';

class NotePlayedChecker {
  final NextNoteNotifier noteNotifier;
  bool _noteHit = false;
  final Function function;

  NotePlayedChecker({required this.noteNotifier, required this.function});

  void checkPress(String name) {
    if (!noteNotifier.isNull()) {
      Note note = noteNotifier.get();
      if (note.name == name) {
        _noteHit = true;
        function(_noteHit);
      }
    }
  }

  void setNewNote(Note note) {
    noteNotifier.setNextNote(note);
  }

  void removeNote() {
    if (!_noteHit) function(_noteHit);
    _noteHit = false;
  }
}