import 'package:sight_reading_app/components/helper/helper_list.dart';

import '../sheet_music_components/note.dart';

/// Manages the Helper information.
class HelperBrain {
  /// The current helper position in the list.
  late int currentHelperListPosition;

  /// The list of helper informations.
  final HelperList helpers;

  /// Constructor.
  HelperBrain({required this.helpers});

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
}
