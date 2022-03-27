import 'note_helper_info.dart';

/// This class indicated a helper list.
class NoteHelperList {
  /// The id for the specific helper.
  late int helperId;

  /// List of helper information holder.
  late List<NoteHelperInfo> helperList;

  /// Constructor
  NoteHelperList({required this.helperId, required this.helperList});
}
