import 'note.dart';

class NotePlayedChecker {
  final NextNoteNotifier noteNotifier;
  bool _isHit = false;
  final Function _function;

  NotePlayedChecker(this.noteNotifier, this._function);

  void checkPress(String name) {
    if (!noteNotifier.isNull()) {
      Note note = noteNotifier.get();
      if (note.name == name) {
        _isHit = true;
        _function(_isHit);
      }
    }
  }

  void setNewNote(Note note) {
    noteNotifier.setNextNote(note);
  }

  void removeNote() {
    if (!_isHit) _function(_isHit);
    _isHit = false;
  }
}