import '../sheet_music_components/note.dart';

///This class provides the basic information of note in a note_helper card.
class NoteHelperInfo {
  final Note noteImageName;
  final String noteName;
  final String noteSound;

  ///description for new note_helper
  final String description;

  /// Constructor
  NoteHelperInfo({
    required this.noteImageName,
    required this.noteName,
    required this.noteSound,
    required this.description,
  });
}
