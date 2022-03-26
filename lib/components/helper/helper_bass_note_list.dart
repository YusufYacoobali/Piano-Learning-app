import '../sheet_music_components/note.dart';
import 'helper_list.dart';
import 'helper_note_info.dart';

/// A list that contains all information about helper of bass.
final HelperList bassNoteImageNameList = HelperList(
  helperId: 1,
  helperList: [
    HelperNoteInfo(
        noteImageName: Note(name: 'C4', duration: 4),
        noteName: 'Bass Mid C',
        noteSound: 'note_middle_c'),
    HelperNoteInfo(
        noteImageName: Note(name: 'B3', duration: 4), noteName: 'Bass B', noteSound: 'note_low_b'),
    HelperNoteInfo(
        noteImageName: Note(name: 'A3', duration: 4), noteName: 'Bass A', noteSound: 'note_low_a'),
    HelperNoteInfo(
        noteImageName: Note(name: 'G3', duration: 4), noteName: 'Bass G', noteSound: 'note_low_g'),
    HelperNoteInfo(
        noteImageName: Note(name: 'F3', duration: 4), noteName: 'Bass F', noteSound: 'note_low_f'),
    HelperNoteInfo(
        noteImageName: Note(name: 'E3', duration: 4), noteName: 'Bass E', noteSound: 'note_low_e'),
    HelperNoteInfo(
        noteImageName: Note(name: 'D3', duration: 4), noteName: 'Bass D', noteSound: 'note_low_d'),
    HelperNoteInfo(
        noteImageName: Note(name: 'C3', duration: 4), noteName: 'Bass C', noteSound: 'note_low_c'),
  ],
);
