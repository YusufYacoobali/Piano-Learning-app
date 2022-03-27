import '../sheet_music_components/note.dart';
import 'helper_list.dart';
import 'helper_note_info.dart';

////// A list that contains all information about BLANK HELPER.

/// The helperNoteInfo I will change to more appropriate name later so
/// it will not just for note only.

final HelperList noteTypeList = HelperList(helperId: 3, helperList: [
  HelperNoteInfo(
      noteImageName: Note(name: 'C4', duration: 4),
      noteName: 'Whole Note',
      noteSound: '',
      description: 'Blank description, pretend this is a longer text...'),
  HelperNoteInfo(
      noteImageName: Note(name: 'C4', duration: 4),
      noteName: 'Quarter Note',
      noteSound: '',
      description: 'Blank description, pretend this is a longer text...'),
]);
