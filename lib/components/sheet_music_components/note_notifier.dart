import 'note.dart';

/// A way to send and notify if notes are ready to be output to the stave
class NextNoteNotifier {
  /// Whether the sender has sent the note
  bool hasNextNote = false;

  /// The note to be received by the receiver
  late Note _nextNote;

  /// Checks if there is a note
  bool _isThereNote = false;

  /// Gives the note to the receiver
  Note getNextNote() {
    hasNextNote = false;
    return _nextNote;
  }

  /// Gives the note to the receiver without removing it from the notifier
  Note get() {
    return _nextNote;
  }

  /// Checks if there is a note to be played
  bool isNull () => !_isThereNote;

  /// Sends the note from the sender
  void setNextNote(Note note) {
    _isThereNote = true;
    hasNextNote = true;
    _nextNote = note;
  }
}