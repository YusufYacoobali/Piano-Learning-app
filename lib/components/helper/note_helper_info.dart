import '../sheet_music_components/note.dart';

///This class provides the basic information of note in a helper card.
class NoteHelperInfo {
  final Note noteImageName;
  final String noteName;
  final String noteSound;

  NoteHelperInfo({
    required this.noteImageName,
    required this.noteName,
    required this.noteSound,
  });
}
