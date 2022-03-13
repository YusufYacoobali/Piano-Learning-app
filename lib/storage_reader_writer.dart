import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_answer_data.dart';
import 'package:sight_reading_app/questions.dart';

/// Writes data to storage
class StorageReaderWriter {
  /// The key-value pairs to store in memory
  final Map _map = {};

  /// Constructor
  StorageReaderWriter() {
    _setDefaultValues();
    _writeDefaultsToStorage();
  }

  /// Gets the value using the key in [_map]
  Object read(String key) {
    return _map[key];
  }

  /// Writes the key-value pair to storage
  Future<void> write(String key, Object value) async {
    // Key: lesson name
    // Value: score
    // Format: 'lesson 1' -> 3
    _map[key] = value;
    final SharedPreferences pref = await SharedPreferences.getInstance();
    _map[key] = value.toString();
    await pref.setString(key, value.toString());
  }

  /// Resets the StorageWriter back to the defaults
  void reset() {
    _setDefaultValues();
    _writeDefaultsToStorage();
  }

  /// Puts default values into the map
  void _setDefaultValues() {
    // _map['volume'] = constants.defaultVolumeLevel;
    // _map['difficulty'] = constants.defaultDifficultyLevel;
    // With 7 lessons:

    for (int i = 1; i <= 7; ++i) {
      _map['lesson $i'] = 0;
    }
  }

  /// Writes the default StorageWriter values to Shared Preferences
  Future<void> _writeDefaultsToStorage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.setInt('volume', constants.defaultVolumeLevel);
    // pref.setString('difficulty', constants.defaultDifficultyLevel);
    for (int i = 1; i <= 7; ++i) {
      pref.setString('lesson $i', '0');
    }
  }

  /// Loads the StorageWriter from Shared Preferences
  Future<void> loadDataFromStorage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    // int? isOnDisk = pref.getInt('volume');
    // if (isOnDisk == null) {
    //   _setDefaultValues();
    //   await _writeDefaultsToStorage();
    // } else {
    //   int? volume = pref.getInt('volume');
    //   String? difficulty = pref.getString('difficulty');
    //   if (volume != null) _map['volume'] = volume;
    //   if (difficulty != null) _map['difficulty'] = difficulty;
    // }
    await loadLessonScoresFromStorage(pref);
    await loadQuestionAnswerDataFromStorage(pref);
  }

  Future<void> loadLessonScoresFromStorage(SharedPreferences pref) async {
    int? isOnDisk = pref.getInt('lesson 1');
    if (isOnDisk == null) {
      _setDefaultValues();
      await _writeDefaultsToStorage();
    } else {
      for (int i = 1; i <= 7; ++i) {
        String? lessonScore = pref.getString('lesson $i');
        if (lessonScore != null) _map['lesson $i'] = lessonScore;
      }
    }
  }

  Future<void> loadQuestionAnswerDataFromStorage(SharedPreferences pref) async {
    int? isOnDisk = pref.getInt('questionID 1');
    if (isOnDisk == null) {
      QuestionAnswerData.createDefaultMap();
    } else {
      for (int i = 1; i <= questions.length; ++i) {
        String? questionStatistic = pref.getString('questionID $i');
        if (questionStatistic != null) {
          _map['questionID $i'] = questionStatistic;
          QuestionAnswerData.updateQuestionStatisticsMap(
            i,
            int.parse(questionStatistic),
          );
        }
      }
    }
  }
}
