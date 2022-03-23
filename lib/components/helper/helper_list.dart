import 'helper_note_info.dart';

/// This class indicated a helper list.
class HelperList {
  /// The id for the specific helper.
  late int helperId;

  /// List of helper information holder.
  late List<HelperNoteInfo> helperList;

  /// Constructor
  HelperList({required this.helperId, required this.helperList});
}
