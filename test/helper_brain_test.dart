import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/components/helper/helper_brain.dart';
import 'package:sight_reading_app/components/helper/helper_list.dart';
import 'package:sight_reading_app/components/helper/helper_note_info.dart';

void main() {
  ///sample helper brain for bass.
  HelperList getSampleBassHelpers() {
    return HelperList(
      helperId: 1,
      helperList: [
        HelperNoteInfo(
            noteImageName: 'assets/note_images/Bs_A.jpeg',
            noteName: 'Bass A',
            noteSound: 'note_a.wav'),
        HelperNoteInfo(
            noteImageName: 'assets/note_images/Bs_B.jpeg',
            noteName: 'Bass B',
            noteSound: 'note_b.wav'),
      ],
    );
  }

  ///sample helper brain for clef.
  HelperList getSampleClefHelpers() {
    return HelperList(
      helperId: 2,
      helperList: [
        HelperNoteInfo(
            noteImageName: 'assets/note_images/Tr_A.jpeg',
            noteName: 'Clef A',
            noteSound: 'note_a.wav'),
        HelperNoteInfo(
            noteImageName: 'assets/note_images/Tr_B.jpeg',
            noteName: 'Clef B',
            noteSound: 'note_b.wav'),
      ],
    );
  }

  /// Bass helper brain test.
  group('Check for bass helper brain list.', () {
    test(
        'Check that getHelperNoteName(currentHelperListPosition) returns the name of the current bass note in position 0',
        () {
      int currentHelperListPosition = 0;
      HelperList sampleHelpers = getSampleBassHelpers();
      HelperBrain helperBrain = HelperBrain(helpers: sampleHelpers);
      String name = helperBrain.getHelperNoteName(currentHelperListPosition);
      expect(
          name, sampleHelpers.helperList[currentHelperListPosition].noteName);
    });

    test(
        'Check that getHelperNoteImageName(currentHelperListPosition) returns the name of the current bass note in position 0',
        () {
      int currentHelperListPosition = 0;
      HelperList sampleHelpers = getSampleBassHelpers();
      HelperBrain helperBrain = HelperBrain(helpers: sampleHelpers);
      String imageName =
          helperBrain.getHelperNoteImageName(currentHelperListPosition);
      expect(imageName,
          sampleHelpers.helperList[currentHelperListPosition].noteImageName);
    });

    test(
        'Check that getHelperNoteSoundName(currentHelperListPosition) returns the name of the current bass note in position 0',
        () {
      int currentHelperListPosition = 0;
      HelperList sampleHelpers = getSampleBassHelpers();
      HelperBrain helperBrain = HelperBrain(helpers: sampleHelpers);
      String soundName =
          helperBrain.getHelperNoteSoundName(currentHelperListPosition);
      expect(soundName,
          sampleHelpers.helperList[currentHelperListPosition].noteSound);
    });
  });

  /// Clef helper brain test
  group('Check for clef helper brain list.', () {
    test(
        'Check that getHelperNoteName(currentHelperListPosition) returns the name of the current clef note in position 0',
        () {
      int currentHelperListPosition = 0;
      HelperList sampleHelpers = getSampleClefHelpers();
      HelperBrain helperBrain = HelperBrain(helpers: sampleHelpers);
      String name = helperBrain.getHelperNoteName(currentHelperListPosition);
      expect(
          name, sampleHelpers.helperList[currentHelperListPosition].noteName);
    });

    test(
        'Check that getHelperNoteImageName(currentHelperListPosition) returns the name of the current clef note in position 0',
        () {
      int currentHelperListPosition = 0;
      HelperList sampleHelpers = getSampleClefHelpers();
      HelperBrain helperBrain = HelperBrain(helpers: sampleHelpers);
      String imageName =
          helperBrain.getHelperNoteImageName(currentHelperListPosition);
      expect(imageName,
          sampleHelpers.helperList[currentHelperListPosition].noteImageName);
    });

    test(
        'Check that getHelperNoteSoundName(currentHelperListPosition) returns the name of the current clef note in position 0',
        () {
      int currentHelperListPosition = 0;
      HelperList sampleHelpers = getSampleClefHelpers();
      HelperBrain helperBrain = HelperBrain(helpers: sampleHelpers);
      String soundName =
          helperBrain.getHelperNoteSoundName(currentHelperListPosition);
      expect(soundName,
          sampleHelpers.helperList[currentHelperListPosition].noteSound);
    });
  });
}
