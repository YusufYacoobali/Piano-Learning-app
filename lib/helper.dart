import 'package:sight_reading_app/screens/speedrun_menu_screen.dart';
import 'package:sight_reading_app/screens/quiz_selection_screen.dart';
import 'package:sight_reading_app/screens/play_along_menu_screen.dart';
import 'package:sight_reading_app/storage_reader_writer.dart';

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
  else if (mode == 'play along') {
    final StorageReaderWriter _writer = StorageReaderWriter();
    for (String track in trackNames) {
      keyList.add('${track.toLowerCase()}-${_writer.read('difficulty').toString().toLowerCase()}-high-score');
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
  final StorageReaderWriter _reader = StorageReaderWriter();
  List<String> records = [];
  await _reader.loadDataFromStorage();
  for (String key in keyList) {
    records.add(_reader.read(key).toString());
  }
  return records;
}

/// A variant of getRecords which returns void.
///
/// Used for parts of the code where you need a function with a void return type and no parameters.
void loadRecordsForPlayAlongMode() {
  getRecordsForMode('play along');
}