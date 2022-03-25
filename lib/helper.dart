import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/screens/speedrun_menu_screen.dart';
import 'package:sight_reading_app/screens/quiz_selection_screen.dart';

/// The shared preference keys for the inputted mode.
///
/// The available modes are:
/// - 'speedrun'
/// - 'quiz'
/// - 'play along'
/// - 'endless'
///
/// All other inputs return the empty list.
getRecordKeysForMode(String mode) {
  // Identifies which keys need to be obtained.
  List<String> keyList = [];
  if (mode == 'speedrun') {
    for (int category in modes) {
      keyList.add('${category}_second_speedrun_record');
    }
  }
  else if (mode == 'quiz') {
    List<String> tempKeyList = replaceSpacesWithUnderscoresFromStrings(quizzes);
    for (String key in tempKeyList) {
      keyList.add('${key}_record');
    }
  }
  //TODO: Move play_along and endless records retrieval into here.
  return keyList;
}

/// The records for each category of the inputted mode.
///
/// The available modes are:
/// - 'speedrun'
/// - 'quiz'
/// - 'play along'
/// - 'endless'
///
/// All other inputs return the empty list.
Future<List<String>> getRecordsForMode(String mode) async {
  List<String> keyList = getRecordKeysForMode(mode);
  final prefs = await SharedPreferences.getInstance();
  List<String> records = [];
  for (String key in keyList) {
    try {
      int toAdd = prefs.getInt(key) ?? 0;
      records.add(toAdd.toString());
    } catch (_) { //TODO: Find correct exception type
      records.add('N/A');
    }
  }
  return records;
}

/// Replaces all blank spaces from all strings with underscores in a list
List<String> replaceSpacesWithUnderscoresFromStrings(List<String> toConvert) {
  List<String> stringsWithNoSpaces = <String>[];
  for (String string in toConvert) {
    String stringWithNoSpaces = '';
    for (var rune in string.runes) {
      String char = String.fromCharCode(rune);
      if (char != ' ') {
        stringWithNoSpaces = stringWithNoSpaces + char;
      }
      else {
        stringWithNoSpaces = stringWithNoSpaces + '_';
      }
    }
    stringsWithNoSpaces.add(stringWithNoSpaces);
  }
  return stringsWithNoSpaces;
}