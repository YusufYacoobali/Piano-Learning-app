import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_answer_data.dart';
import 'package:sight_reading_app/questions.dart';

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
    WidgetsFlutterBinding.ensureInitialized();
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
    //_resetAchievements();
    _resetQuizzes();
  }

  /// Puts default values into the map
  void _setDefaultValues() {
    // _map['volume'] = constants.defaultVolumeLevel;
    // _map['difficulty'] = constants.defaultDifficultyLevel;
    // With 7 lessons:

    for (int i = 1; i <= 7; ++i) {
      _map['lesson $i'] = 0;
    }

    _map['endless-treble-beginner-high-score'] = 0;
    _map['endless-treble-intermediate-high-score'] = 0;
    _map['endless-treble-expert-high-score'] = 0;
    _map['endless-bass-beginner-high-score'] = 0;
    _map['endless-bass-intermediate-high-score'] = 0;
    _map['endless-bass-expert-high-score'] = 0;
  }

  /// Writes the default StorageWriter values to Shared Preferences
  Future<void> _writeDefaultsToStorage() async {
    WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.setInt('volume', constants.defaultVolumeLevel);
    // pref.setString('difficulty', constants.defaultDifficultyLevel);
    for (int i = 1; i <= 7; ++i) {
      pref.setString('lesson $i', '0');
    }

    pref.setString('endless-treble-high-score', '0');
    pref.setString('endless-bass-high-score', '0');

    pref.setString('endless-treble-beginner-high-score', '0');
    pref.setString('endless-treble-intermediate-high-score', '0');
    pref.setString('endless-treble-expert-high-score', '0');
    pref.setString('endless-bass-beginner-high-score', '0');
    pref.setString('endless-bass-intermediate-high-score', '0');
    pref.setString('endless-bass-expert-high-score', '0');
  }

  /// Loads the StorageWriter from Shared Preferences
  Future<void> loadDataFromStorage() async {
    WidgetsFlutterBinding.ensureInitialized();
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
    String? isOnDisk = pref.getString('lesson 1');
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

  Future<Map<String, int>> loadAchievementValues() async {
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
    int endlessBassBegHS =
        int.parse(prefs.getString('endless-bass-beginner-high-score') ?? '0');
    int endlessBassInterHS = int.parse(
        prefs.getString('endless-bass-intermediate-high-score') ?? '0');
    int endlessBassExpHS =
        int.parse(prefs.getString('endless-bass-expert-high-score') ?? '0');

    int endlessTrebleBegHS =
        int.parse(prefs.getString('endless-treble-beginner-high-score') ?? '0');
    int endlessTrebleInterHS = int.parse(
        prefs.getString('endless-treble-intermediate-high-score') ?? '0');
    int endlessTrebleExpHS =
        int.parse(prefs.getString('endless-treble-expert-high-score') ?? '0');

    int speedrun10HS = prefs.getInt('10_second_speedrun_record') ?? 0;
    int speedrun20HS = prefs.getInt('20_second_speedrun_record') ?? 0;
    int speedrun30HS = prefs.getInt('30_second_speedrun_record') ?? 0;
    int speedrun40HS = prefs.getInt('40_second_speedrun_record') ?? 0;
    int speedrun50HS = prefs.getInt('50_second_speedrun_record') ?? 0;
    int speedrun60HS = prefs.getInt('60_second_speedrun_record') ?? 0;

    Map<String, int> values = {
      'completedLessons': lessonsPassed,
      'completedQuizzes': completedQuizzes,
      'endlessBassBegHS': endlessBassBegHS,
      'endlessBassInterHS': endlessBassInterHS,
      'endlessBassExpHS': endlessBassExpHS,
      'endlessTrebleBegHS': endlessTrebleBegHS,
      'endlessTrebleInterHS': endlessTrebleInterHS,
      'endlessTrebleExpHS': endlessTrebleExpHS,
      'speedrun10HS': speedrun10HS,
      'speedrun20HS': speedrun20HS,
      'speedrun30HS': speedrun30HS,
      'speedrun40HS': speedrun40HS,
      'speedrun50HS': speedrun50HS,
      'speedrun60HS': speedrun60HS,
    };

    return values;
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

  Future<void> saveCompletedQuiz() async {
    final prefs = await SharedPreferences.getInstance();
    int completedQuizzes = (prefs.getInt('completed_quizzes') ?? 0);
    prefs.setInt('completed_quizzes', completedQuizzes + 1);
    //print("quiz passed and saved");
  }

  Future<void> _resetLessons() async {
    final prefs = await SharedPreferences.getInstance();

    for (int x = 0; x < numOfLessons; x++) {
      prefs.setBool('lesson-num-$x', false);
    }
    //print("lessons reset");
  }

  Future<void> _resetQuizzes() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setInt('completed_quizzes', 0);
    //print("quizzes reset");
  }

  Future<bool> displayLessonNotification() async {
    final prefs = await SharedPreferences.getInstance();

    int lessonsPassed = 0;

    for (int x = 0; x < numOfLessons; x++) {
      bool value = prefs.getBool('lesson-num-$x') ?? false;
      if (value) lessonsPassed += 1;
      //print('adding the $x one');
    }

    if (lessonsPassed == 1 ||
        lessonsPassed == 5 ||
        lessonsPassed == numOfLessons) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> displayQuizNotification() async {
    final prefs = await SharedPreferences.getInstance();
    int completedQuizzes = (prefs.getInt('completed_quizzes') ?? 0);

    if (completedQuizzes == 1 ||
        completedQuizzes == 5 ||
        completedQuizzes == numOfquizzes) {
      return true;
    } else {
      return false;
    }
  }

  //void _resetAchievements() {}
}
