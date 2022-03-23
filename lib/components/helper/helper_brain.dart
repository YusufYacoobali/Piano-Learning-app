import 'package:sight_reading_app/components/helper/helper_list.dart';

class HelperBrain {
  late int currentHelperid;

  final HelperList helpers;

  HelperBrain({required this.helpers});

  String getHelperNoteName(currentHelperid) {
    return helpers.helperList[currentHelperid].noteName;
  }

  String getHelperNoteImageName(currentHelperid) {
    return helpers.helperList[currentHelperid].noteImageName;
  }

  String getHelperNoteSoundName(currentHelperid) {
    return helpers.helperList[currentHelperid].noteSound;
  }
}
