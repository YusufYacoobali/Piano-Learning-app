import '../sheet_music_components/note.dart';
import 'note_helper_list.dart';
import 'note_helper_info.dart';

/// A list that contains all information about each note type.

final NoteHelperList noteTypeList =
    NoteHelperList(noteHelperID: 3, noteHelperList: [
  NoteHelperInfo(
      noteImageName: Note(name: 'C4', duration: 1),
      noteName: 'Quarter Note',
      noteSound: '',
      description: 'This note has length of 1 beat.'),
  NoteHelperInfo(
      noteImageName: Note(name: 'C4', duration: 2),
      noteName: 'Half Note',
      noteSound: '',
      description:
          'This note has a length of 2 beats. Equivalent to 2 quarter notes.'),
  NoteHelperInfo(
      noteImageName: Note(name: 'C4', duration: 4),
      noteName: 'Whole Note',
      noteSound: '',
      description:
          'This note has a length of 4 beats. Equivalent to 4 quarter notes.'),
  NoteHelperInfo(
      noteImageName: Note(name: 'C4', duration: 0.5),
      noteName: 'Eighth Note',
      noteSound: '',
      description:
          'This note has a length of half a beat. 2 eighth notes is equivalent to a quarter note.'),
  NoteHelperInfo(
      noteImageName: Note(name: 'C4', duration: 1.5),
      noteName: 'Dotted Note',
      noteSound: '',
      description:
          'The dot behind adds half the beat value of the note in front. This note has a length of 1.5 beats.'),
  NoteHelperInfo(
      noteImageName: Note(name: 'C4', duration: 3),
      noteName: 'Dotted Note',
      noteSound: '',
      description:
          'In this case, the dotted note has a length of 2 + 1 = 3 beats.'),
]);
