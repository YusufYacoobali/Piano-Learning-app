import '../sheet_music_components/note.dart';
import 'note_helper_list.dart';

/// Manages the Helper information.
class NoteHelperBrain {
  /// The list of helper informations.
  final NoteHelperList helpers;

  /// Constructor.
  NoteHelperBrain({required this.helpers});

  /// Get the name of helper's note.
  String getHelperNoteName(currentHelperListPosition) {
    return helpers.noteHelperList[currentHelperListPosition].noteName;
  }

  /// Get the image file name of helper's note.
  Note getHelperNoteImageName(currentHelperListPosition) {
    return helpers.noteHelperList[currentHelperListPosition].noteImageName;
  }

  /// Get the sound file name of helper's note.
  String getHelperNoteSoundName(currentHelperListPosition) {
    return helpers.noteHelperList[currentHelperListPosition].noteSound;
  }

  ///Get the description of helper's note.
  String getHelperDescription(currentHelperListPosition) {
    return helpers.noteHelperList[currentHelperListPosition].description;
  }

  ///Get the length of the helper's list.
  int getNumbersOfHelperNote() {
    return helpers.noteHelperList.length;
  }
}
