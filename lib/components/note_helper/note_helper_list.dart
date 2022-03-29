import 'note_helper_info.dart';

/// This class indicated a helper list.
class NoteHelperList {
  /// The id for the specific helper.
  late int noteHelperID;

  /// List of helper information holder.
  late List<NoteHelperInfo> noteHelperList;

  /// Constructor
  NoteHelperList({required this.noteHelperID, required this.noteHelperList});
}
