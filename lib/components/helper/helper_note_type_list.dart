import '../sheet_music_components/note.dart';
import 'helper_list.dart';
import 'helper_note_info.dart';

////// A list that contains all information about BLANK HELPER.

/// The helperNoteInfo I will change to more appropriate name later so
/// it will not just for note only.

final HelperList noteTypeList = HelperList(helperId: 3, helperList: [
  HelperNoteInfo(
      noteImageName: Note(name: 'C4', duration: 4),
      noteName: 'Quarter Note',
      noteSound: '',
      description: 'This note has length of 1 beat.'),
  HelperNoteInfo(
      noteImageName: Note(name: 'C4', duration: 4),
      noteName: 'Half Note',
      noteSound: '',
      description:
          'This note has a length of 2 beats. Equivalent to 2 quarter notes.'),
  HelperNoteInfo(
      noteImageName: Note(name: 'C4', duration: 4),
      noteName: 'Whole Note',
      noteSound: '',
      description:
          'This note has a length of 4 beats. Equivalent to 4 quarter notes.'),
  HelperNoteInfo(
      noteImageName: Note(name: 'C4', duration: 4),
      noteName: 'Eighth Note',
      noteSound: '',
      description:
          'This note has a length of half a beat. 2 eighth notes is equivalent to a quarter note.'),
]);
