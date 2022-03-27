import '../sheet_music_components/note.dart';

///This class provides the basic information of note in a helper card.
class HelperNoteInfo {
  final Note noteImageName;
  final String noteName;
  final String noteSound;

  ///description for new helper
  final String description;

  HelperNoteInfo({
    required this.noteImageName,
    required this.noteName,
    required this.noteSound,
    required this.description,
  });
}
