import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/components/note_helper/note_helper_brain.dart';
import 'package:sight_reading_app/components/note_helper/note_helper_info.dart';
import 'package:sight_reading_app/components/note_helper/note_helper_list.dart';
import 'package:sight_reading_app/components/sheet_music_components/note.dart';

void main() {
  ///sample note_helper brain for bass.
  NoteHelperList _getSampleBassHelpers() {
    return NoteHelperList(
      noteHelperID: 1,
      noteHelperList: [
        NoteHelperInfo(
            noteImageName: Note(name: 'A3', duration: 4),
            noteName: 'Bass A',
            noteSound: 'note_a',
            description: ''),
      ],
    );
  }

  ///sample note_helper brain for clef.
  NoteHelperList _getSampleClefHelpers() {
    return NoteHelperList(
      noteHelperID: 2,
      noteHelperList: [
        NoteHelperInfo(
            noteImageName: Note(name: 'A4', duration: 4),
            noteName: 'Clef A',
            noteSound: 'note_a',
            description: ''),
      ],
    );
  }

  /// Bass note_helper brain test.
  group('Check for bass note_helper brain sample list.', () {
    test(
        'Check that getHelperNoteName(currentNoteHelperListPosition) returns the name of the current bass note in position 0',
        () {
      int currentNoteHelperListPosition = 0;
      NoteHelperList sampleHelpers = _getSampleBassHelpers();
      NoteHelperBrain noteHelperBrain = NoteHelperBrain(helpers: sampleHelpers);
      String name =
          noteHelperBrain.getHelperNoteName(currentNoteHelperListPosition);
      expect(name,
          sampleHelpers.noteHelperList[currentNoteHelperListPosition].noteName);
    });

    test(
        'Check that getHelperNoteImageName(currentNoteHelperListPosition) returns the name of the current bass note in position 0',
        () {
      int currentNoteHelperListPosition = 0;
      NoteHelperList sampleHelpers = _getSampleBassHelpers();
      NoteHelperBrain noteHelperBrain = NoteHelperBrain(helpers: sampleHelpers);
      Note imageName =
          noteHelperBrain.getHelperNoteImageName(currentNoteHelperListPosition);
      expect(
          imageName,
          sampleHelpers
              .noteHelperList[currentNoteHelperListPosition].noteImageName);
    });

    test(
        'Check that getHelperNoteSoundName(currentNoteHelperListPosition) returns the name of the current bass note in position 0',
        () {
      int currentNoteHelperListPosition = 0;
      NoteHelperList sampleHelpers = _getSampleBassHelpers();
      NoteHelperBrain noteHelperBrain = NoteHelperBrain(helpers: sampleHelpers);
      String soundName =
          noteHelperBrain.getHelperNoteSoundName(currentNoteHelperListPosition);
      expect(
          soundName,
          sampleHelpers
              .noteHelperList[currentNoteHelperListPosition].noteSound);
    });
  });

  /// Clef note_helper brain test
  group('Check for clef note_helper brain sample list.', () {
    test(
        'Check that getHelperNoteName(currentNoteHelperListPosition) returns the name of the current clef note in position 0',
        () {
      int currentNoteHelperListPosition = 0;
      NoteHelperList sampleHelpers = _getSampleClefHelpers();
      NoteHelperBrain noteHelperBrain = NoteHelperBrain(helpers: sampleHelpers);
      String name =
          noteHelperBrain.getHelperNoteName(currentNoteHelperListPosition);
      expect(name,
          sampleHelpers.noteHelperList[currentNoteHelperListPosition].noteName);
    });

    test(
        'Check that getHelperNoteImageName(currentNoteHelperListPosition) returns the name of the current clef note in position 0',
        () {
      int currentNoteHelperListPosition = 0;
      NoteHelperList sampleHelpers = _getSampleClefHelpers();
      NoteHelperBrain noteHelperBrain = NoteHelperBrain(helpers: sampleHelpers);
      Note imageName =
          noteHelperBrain.getHelperNoteImageName(currentNoteHelperListPosition);
      expect(
          imageName,
          sampleHelpers
              .noteHelperList[currentNoteHelperListPosition].noteImageName);
    });

    test(
        'Check that getHelperNoteSoundName(currentNoteHelperListPosition) returns the name of the current clef note in position 0',
        () {
      int currentNoteHelperListPosition = 0;
      NoteHelperList sampleHelpers = _getSampleClefHelpers();
      NoteHelperBrain noteHelperBrain = NoteHelperBrain(helpers: sampleHelpers);
      String soundName =
          noteHelperBrain.getHelperNoteSoundName(currentNoteHelperListPosition);
      expect(
          soundName,
          sampleHelpers
              .noteHelperList[currentNoteHelperListPosition].noteSound);
    });
  });
}
