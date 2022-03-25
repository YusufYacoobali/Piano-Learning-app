import '../sheet_music_components/note.dart';
import 'helper_list.dart';
import 'helper_note_info.dart';

/// A list that contains all information about helper of clef.
final HelperList clefNoteImageNameList = HelperList(
  helperId: 2,
  helperList: [
    HelperNoteInfo(
        noteImageName: Note(name: 'C4', duration: 4),
        noteName: 'Clef Mid C',
        noteSound: 'note_middle_c'),
    HelperNoteInfo(
        noteImageName: Note(name: 'D4', duration: 4), noteName: 'Clef D', noteSound: 'note_middle_d'),
    HelperNoteInfo(
        noteImageName: Note(name: 'E4', duration: 4), noteName: 'Clef E', noteSound: 'note_middle_e'),
    HelperNoteInfo(
        noteImageName: Note(name: 'F4', duration: 4), noteName: 'Clef F', noteSound: 'note_middle_f'),
    HelperNoteInfo(
        noteImageName: Note(name: 'G4', duration: 4), noteName: 'Clef G', noteSound: 'note_middle_g'),
    HelperNoteInfo(
        noteImageName: Note(name: 'A4', duration: 4), noteName: 'Clef A', noteSound: 'note_middle_a'),
    HelperNoteInfo(
        noteImageName: Note(name: 'B4', duration: 4), noteName: 'Clef B', noteSound: 'note_middle_b'),
    HelperNoteInfo(
        noteImageName: Note(name: 'C5', duration: 4),
        noteName: 'Clef High C',
        noteSound: 'note_high_c'),
  ],
);