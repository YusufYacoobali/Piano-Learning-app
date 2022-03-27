import 'note_helper_info.dart';

/// This class indicated a note_helper list.
class NoteHelperList {
  /// The id for the specific note_helper.
  late int noteHelperID;

  /// List of note_helper information holder.
  late List<NoteHelperInfo> noteHelperList;

  /// Constructor
  NoteHelperList({required this.noteHelperID, required this.noteHelperList});
}
