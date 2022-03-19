import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/constants.dart';

/// Writes data to storage
class StorageReaderWriter {
  /// The key-value pairs to store in memory
  final Map _map = {};

  /// Constructor
  StorageReaderWriter() {
    _areValuesInStorage();
  }

  /// If there are no values in storage it sets everything to default values
  void _areValuesInStorage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getKeys().isEmpty) {
      reset();
    }
  }

  /// Gets the value using the key in [_map]
  Object? read(String key) {
    return _map[key];
  }

  /// Writes the key-value pair to storage
  Future<void> write(String key, Object value) async {
    // Key: lesson name
    // Value: score
    // Format: 'lesson 1' -> 3
    final SharedPreferences pref = await SharedPreferences.getInstance();
    _map[key] = value.toString();
    await pref.setString(key, value.toString());
  }

  /// Resets the StorageWriter back to the defaults
  void reset() {
    _setDefaultValues();
    _writeDefaultsToStorage();
    _resetLessons();
    _resetAchievements();
  }

  /// Puts default values into the map
  void _setDefaultValues() {
    // _map['volume'] = constants.defaultVolumeLevel;
    // _map['difficulty'] = constants.defaultDifficultyLevel;
    // With 7 lessons:

    for (int i = 1; i <= 7; ++i) {
      _map['lesson $i'] = 0;
    }

    _map['endless-treble-high-score'] = 0;
    _map['endless-bass-high-score'] = 0;
  }

  /// Writes the default StorageWriter values to Shared Preferences
  Future<void> _writeDefaultsToStorage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.setInt('volume', constants.defaultVolumeLevel);
    // pref.setString('difficulty', constants.defaultDifficultyLevel);
    for (int i = 1; i <= 7; ++i) {
      pref.setString('lesson $i', '0');
    }

    pref.setString('endless-treble-high-score', '0');
    pref.setString('endless-bass-high-score', '0');
  }

  /// Loads the StorageWriter from Shared Preferences
  Future<void> loadStorageWriterFromStorage() async {
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

  //for achievements
  Future<List<int>> loadAchievementValues() async {
    final prefs = await SharedPreferences.getInstance();

    int lessonsPassed = 0;

    for (int x = 0; x < numOfLessons; x++) {
      bool value = prefs.getBool('lesson-num-$x') ?? false;
      if (value) lessonsPassed += 1;
      //print('adding the $x one');
    }

    //print("current lessons passed: $lessonsPassed");

    //int completedLessons = (prefs.getInt('completed_lessons') ?? 0);
    int completedQuizzes = (prefs.getInt('completed_quizzes') ?? 0);
    int endlessBassHS =
        int.parse(prefs.getString('endless-bass-high-score') ?? '0');
    int endlessTrebleHS =
        int.parse(prefs.getString('endless-treble-high-score') ?? '0');

    return [lessonsPassed, completedQuizzes, endlessBassHS, endlessTrebleHS];
  }

  // //for lessons
  // Future<bool> isLessonComplete(lessonNum) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('lesson-num-$lessonNum', true);
  //   return prefs.getBool('lesson-num-$lessonNum') ?? true;
  // }

  Future<List<bool>> loadLessonValues() async {
    final prefs = await SharedPreferences.getInstance();
    List<bool> values = [];

    //prefs.setBool('lesson-num-1', false);

    for (int x = 0; x < numOfLessons; x++) {
      values.add(prefs.getBool('lesson-num-$x') ?? false);
      //print('adding the $x one');
    }
    //print(values);
    return values;
  }

  Future<void> saveCompletedLesson(lessonNum) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('lesson-num-$lessonNum', true);
    //print("lesson $lessonNum set to pass");
  }

  Future<void> _resetLessons() async {
    final prefs = await SharedPreferences.getInstance();

    for (int x = 0; x < numOfLessons; x++) {
      prefs.setBool('lesson-num-$x', false);
    }
    //print("lessons reset");
  }

  void _resetAchievements() {}
}
