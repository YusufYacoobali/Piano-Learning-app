import 'package:sight_reading_app/components/helper/helper_list.dart';

/// Manages the Helper information.
class HelperBrain {
  /// The current helper position in the list.
  late int currentHelperPosition;

  /// The list of helper informations.
  final HelperList helpers;

  /// Constructor.
  HelperBrain({required this.helpers});

  /// Get the name of helper's note.
  String getHelperNoteName(currentHelperPosition) {
    return helpers.helperList[currentHelperPosition].noteName;
  }

  /// Get the image file name of helper's note.
  String getHelperNoteImageName(currentHelperPosition) {
    return helpers.helperList[currentHelperPosition].noteImageName;
  }

  /// Get the sound file name of helper's note.
  String getHelperNoteSoundName(currentHelperPosition) {
    return helpers.helperList[currentHelperPosition].noteSound;
  }
}
