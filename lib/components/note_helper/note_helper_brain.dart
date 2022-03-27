import 'note_helper_list.dart';

import '../sheet_music_components/note.dart';

/// Manages the Helper information.
class NoteHelperBrain {
  /// The current note_helper position in the list.
  late int currentNoteHelperListPosition;

  /// The list of note_helper informations.
  final NoteHelperList helpers;

  /// Constructor.
  NoteHelperBrain({required this.helpers});

  /// Get the name of note_helper's note.
  String getHelperNoteName(currentHelperListPosition) {
    return helpers.noteHelperList[currentHelperListPosition].noteName;
  }

  /// Get the image file name of note_helper's note.
  Note getHelperNoteImageName(currentHelperListPosition) {
    return helpers.noteHelperList[currentHelperListPosition].noteImageName;
  }

  /// Get the sound file name of note_helper's note.
  String getHelperNoteSoundName(currentHelperListPosition) {
    return helpers.noteHelperList[currentHelperListPosition].noteSound;
  }

  String getHelperDescription(currentHelperListPosition) {
    return helpers.noteHelperList[currentHelperListPosition].description;
  }

  ///Get the length of the note_helper's list.
  int getNumbersOfHelperNote() {
    return helpers.noteHelperList.length;
  }
}
