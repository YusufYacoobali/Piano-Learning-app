import 'package:sight_reading_app/components/helper/note_helper_list.dart';

import '../sheet_music_components/note.dart';

/// Manages the Helper information.
class NoteHelperBrain {
  /// The current helper position in the list.
  late int currentHelperListPosition;

  /// The list of helper informations.
  final NoteHelperList helpers;

  /// Constructor.
  NoteHelperBrain({required this.helpers});

  /// Get the name of helper's note.
  String getHelperNoteName(currentHelperListPosition) {
    return helpers.helperList[currentHelperListPosition].noteName;
  }

  /// Get the image file name of helper's note.
  Note getHelperNoteImageName(currentHelperListPosition) {
    return helpers.helperList[currentHelperListPosition].noteImageName;
  }

  /// Get the sound file name of helper's note.
  String getHelperNoteSoundName(currentHelperListPosition) {
    return helpers.helperList[currentHelperListPosition].noteSound;
  }

  ///Get the length of the helper's list.
  int getNumbersOfHelperNote() {
    return helpers.helperList.length;
  }
}
