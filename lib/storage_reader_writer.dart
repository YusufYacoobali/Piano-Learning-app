import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/helper.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_answer_data.dart';
import 'package:sight_reading_app/lessons_and_quizzes/questions.dart';
import 'package:sight_reading_app/screens/play_along_menu_screen.dart';

import 'constants.dart';

/// A class that handles anything related to stored Shared Preferences.
///
/// This contains various methods to read, write and reset data stored in devices.
class StorageReaderWriter {
  /// The key-value pairs to store in memory.
  final Map _map = {};

  /// Constructor for the class.
  StorageReaderWriter() {
    _setDefaultSettings(); // Sets default values as a failsafe.
    _areValuesInStorage(); // Replaces default values if the actual values can be found.
  }

  /// If there are no values in storage it sets everything to default values.
  void _areValuesInStorage() async {
    WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getKeys().isEmpty) {
      reset();
    }
  }

  /// Gets the value using the key in [_map].
  Object? read(String key) {
    return _map[key];
  }

  /// Writes the key-value pair to storage.
  Future<void> write(String key, Object value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    _map[key] = value.toString();
    await pref.setString(key, value.toString());
    if (key == 'volume') {
      // PerfectVolumeControl.setVolume(
      //     double.parse(value.toString()) / 100); //Needs values from 0 to 1
    }
  }

  /// Resets the StorageWriter back to the defaults.
  void reset() {
    _setDefaultValues();
    _writeDefaultsToStorage();
    _setDefaultSettings();
    _writeDefaultSettingsToStorage();
    _resetLessons();
    _resetQuizRecords();
    _resetAllAchievements();
  }

  /// Resets all achievement related storage values.
  void _resetAllAchievements() {
    _resetLessons();
    _resetQuizzes();
    _resetSpeedrunAchievements();
    _resetSpeedrunRecords();
    _resetEndlessAchievements();
    _resetPlayAlongAchievements();
  }

  /// Puts default values into the map.
  void _setDefaultValues() {
    // _map['volume'] = constants.defaultVolumeLevel;
    // _map['difficulty'] = constants.defaultDifficultyLevel;

    _setDefaultEndlessRecords();
    _setDefaultPlayAlongRecords();
  }

  /// Writes the default StorageWriter values to Shared Preferences.
  Future<void> _writeDefaultsToStorage() async {
    //final SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.setInt('volume', constants.defaultVolumeLevel);
    // pref.setString('difficulty', constants.defaultDifficultyLevel);
    _writeEndlessRecordsToStorage();
    _writePlayAlongRecordsToStorage();
  }

  /// Loads the StorageWriter from Shared Preferences.
  Future<void> loadDataFromStorage() async {
    WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await _loadSettingsFromStorage(pref);
    await loadQuestionAnswerDataFromStorage(pref);
    await _loadEndlessRecordsFromStorage(pref);
    await _loadPlayAlongRecordsFromStorage(pref);
    await _loadSpeedrunRecordsFromStorage(pref);
    await _loadQuizRecordsFromStorage(pref);
  }

  /// Loads question and answer data.
  ///
  /// 'Questions' are used in lessons, quizzes and the speedrun mode.
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

  /// Gets achievement related information from storage to be displayed.
  ///
  /// Used for the achievement screen.
  Future<Map<String, int>> loadAchievementValues() async {
    final prefs = await SharedPreferences.getInstance();

    Map<String, int> values = {};

    int lessonsPassed = 0;
    //gets the number of lessons passed.
    for (int x = 0; x < numOfLessons; x++) {
      bool value = prefs.getBool('lesson-num-$x') ?? false;
      if (value) lessonsPassed += 1;
    }

    values['completedLessons'] = lessonsPassed;

    values['completedQuizzes'] = (prefs.getInt('completed_quizzes') ?? 0);

    for (String clef in <String>['treble', 'bass']) {
      for (Object difficulty in difficultyList) {
        String key =
            'endless-$clef-${difficulty.toString().toLowerCase()}-high-score';
        values[key] = int.parse(prefs.getString(key) ?? '0');
      }
    }

    for (int x = 10; x < 70; x += 10) {
      values['speedrun${x}HS'] = int.parse(
          (prefs.get('${x}_second_speedrun_record') ?? '0').toString());
    }

    for (String track in trackNames) {
      for (Object difficulty in difficultyList) {
        String key =
            '${track.toLowerCase()}-${difficulty.toString().toLowerCase()}-high-score';
        values[key] = double.parse(prefs.getString(key) ?? '0').toInt();
      }
    }

    return values;
  }

  /// Gets data on whether each lesson has been completed or not.
  ///
  /// If a lesson is complete, it is marked as True.
  Future<List<bool>> loadLessonValues() async {
    final prefs = await SharedPreferences.getInstance();
    List<bool> values = [];

    for (int x = 0; x < numOfLessons; x++) {
      values.add(prefs.getBool('lesson-num-$x') ?? false);
    }
    return values;
  }

  /// Saves a lesson as completed.
  Future<void> saveCompletedLesson(lessonNum) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('lesson-num-$lessonNum', true);
    //print("lesson $lessonNum set to pass");
  }

  /// Saves a quiz as completed.
  Future<void> saveCompletedQuiz() async {
    final prefs = await SharedPreferences.getInstance();
    int completedQuizzes = (prefs.getInt('completed_quizzes') ?? 0);
    prefs.setInt('completed_quizzes', completedQuizzes + 1);
    //print("quiz passed and saved");
  }

  /// Loads endless records from storage.
  ///
  /// If there are no records in storage, the default values are loaded and written to storage.
  Future<void> _loadEndlessRecordsFromStorage(SharedPreferences pref) async {
    String? isOnDisk = pref.getString('endless-treble-beginner-high-score');
    if (isOnDisk == null) {
      _setDefaultEndlessRecords();
      _writeEndlessRecordsToStorage();
    } else {
      for (String clef in <String>['treble', 'bass']) {
        for (Object difficulty in difficultyList) {
          String key =
              'endless-$clef-${difficulty.toString().toLowerCase()}-high-score';
          _map[key] = pref.getString(key);
        }
      }
    }
  }

  /// Sets the default endless records in the [_map].
  ///
  /// This does not override values already present in storage.
  void _setDefaultEndlessRecords() {
    for (String clef in <String>['treble', 'bass']) {
      for (Object difficulty in difficultyList) {
        String key =
            'endless-$clef-${difficulty.toString().toLowerCase()}-high-score';
        _map[key] = '0';
      }
    }
  }

  /// Writes the default endless records to storage.
  void _writeEndlessRecordsToStorage() {
    for (String clef in <String>['treble', 'bass']) {
      for (Object difficulty in difficultyList) {
        String key =
            'endless-$clef-${difficulty.toString().toLowerCase()}-high-score';
        write(key, '0');
      }
    }
  }

  /// Loads play along records from storage.
  ///
  /// If there are no records in storage, the default values are loaded and written to storage.
  Future<void> _loadPlayAlongRecordsFromStorage(SharedPreferences pref) async {
    String? isOnDisk = pref.getString(
        '${trackNames[0].toLowerCase()}-${defaultDifficultyLevel.toLowerCase()}-high-score');
    if (isOnDisk == null) {
      _setDefaultPlayAlongRecords();
      _writePlayAlongRecordsToStorage();
    } else {
      for (String track in trackNames) {
        for (Object difficulty in difficultyList) {
          String key =
              '${track.toLowerCase()}-${difficulty.toString().toLowerCase()}-high-score';
          _map[key] = pref.get(key);
        }
      }
    }
  }

  /// Sets the default play along records in the [_map].
  ///
  /// This does not override values already present in storage.
  void _setDefaultPlayAlongRecords() {
    for (String track in trackNames) {
      for (Object difficulty in difficultyList) {
        String key =
            '${track.toLowerCase()}-${difficulty.toString().toLowerCase()}-high-score';
        _map[key] = '0';
      }
    }
  }

  /// Writes play along records to storage.
  void _writePlayAlongRecordsToStorage() {
    for (String track in trackNames) {
      for (Object difficulty in difficultyList) {
        String key =
            '${track.toLowerCase()}-${difficulty.toString().toLowerCase()}-high-score';
        write(key, '0');
      }
    }
  }

  /// Loads speedrun records from storage.
  ///
  /// If there are no records in storage, the default values are loaded and written to storage.
  Future<void> _loadSpeedrunRecordsFromStorage(SharedPreferences pref) async {
    Object? isOnDisk = pref.get('10_second_speedrun_record');
    if (isOnDisk == null) {
      _setDefaultSpeedrunRecords();
      _writeSpeedrunRecordsToStorage();
    } else {
      List<String> _modeRecordKeys = getRecordKeysForMode('speedrun');
      for (String key in _modeRecordKeys) {
        _map[key] = pref.get(key);
      }
    }
  }

  /// Sets the default speedrun records in the [_map].
  ///
  /// This does not override values already present in storage.
  void _setDefaultSpeedrunRecords() {
    List<String> _modeRecordKeys = getRecordKeysForMode('speedrun');
    for (String key in _modeRecordKeys) {
      _map[key] = '0';
    }
  }

  /// Writes speedrun records to storage.
  void _writeSpeedrunRecordsToStorage() {
    List<String> _modeRecordKeys = getRecordKeysForMode('speedrun');
    for (String key in _modeRecordKeys) {
      write(key, '0');
    }
  }

  /// Loads quiz records from storage.
  ///
  /// If there are no records in storage, the default values are loaded and written to storage.
  Future<void> _loadQuizRecordsFromStorage(SharedPreferences pref) async {
    List<String> _quizRecordKeys = getRecordKeysForMode('quiz');
    Object? isOnDisk = pref.get(_quizRecordKeys[0]);
    if (isOnDisk == null) {
      _setDefaultQuizRecords();
      _writeQuizRecordsToStorage();
    } else {
      for (String key in _quizRecordKeys) {
        _map[key] = pref.get(key);
      }
    }
  }

  /// Sets the default quiz records in the [_map].
  ///
  /// This does not override values already present in storage.
  void _setDefaultQuizRecords() {
    List<String> _quizRecordKeys = getRecordKeysForMode('quiz');
    for (String key in _quizRecordKeys) {
      _map[key] = 0;
    }
  }

  /// Writes quiz records to storage.
  void _writeQuizRecordsToStorage() {
    List<String> _quizRecordKeys = getRecordKeysForMode('quiz');
    for (String key in _quizRecordKeys) {
      write(key, 0);
    }
  }

  /// Loads settings from storage.
  ///
  /// If there are no records in storage, the default values are loaded and written to storage.
  Future<void> _loadSettingsFromStorage(SharedPreferences pref) async {
    String? isOnDisk = pref.getString('difficulty');
    if (isOnDisk == null) {
      _setDefaultValues();
      await _writeDefaultsToStorage();
    } else {
      _map['volume'] = pref.get('volume');
      _map['difficulty'] = pref.get('difficulty');
      _map['theme'] = pref.get('theme');
    }
  }

  /// Sets the default settings in the [_map].
  ///
  /// This does not override values already present in storage.
  void _setDefaultSettings() {
    _map['difficulty'] = defaultDifficultyLevel;
    _map['theme'] = defaultTheme;
  }

  /// Writes default settings to storage.
  void _writeDefaultSettingsToStorage() async {
    write('difficulty', defaultDifficultyLevel);
    write('theme', defaultTheme);
  }

  /// Resets all lesson data related to achievements.
  void _resetLessons() async {
    final prefs = await SharedPreferences.getInstance();

    for (int x = 0; x < numOfLessons; x++) {
      prefs.setBool('lesson-num-$x', false);
    }
    prefs.setBool('all-lessons-complete', false);
  }

  /// Resets all quiz data related to achievements.
  void _resetQuizzes() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setInt('completed_quizzes', 0);
    prefs.setBool('all-quizzes-complete', false);
  }

  /// Resets all speedrun data related to achievements.
  void _resetSpeedrunAchievements() async {
    final prefs = await SharedPreferences.getInstance();

    for (int x = 10; x < 70; x += 10) {
      prefs.setBool('${x}_second_speedrun_achievement', false);
    }
  }

  /// Resets all speedrun records.
  void _resetSpeedrunRecords() async {
    final prefs = await SharedPreferences.getInstance();

    for (int x = 10; x < 70; x += 10) {
      prefs.setInt('${x}_second_speedrun_record', 0);
    }
  }

  /// Resets all quiz records.
  void _resetQuizRecords() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final List<String> _quizRecordKeys = getRecordKeysForMode('quiz');
    for (String key in _quizRecordKeys) {
      _prefs.setString(key, '0');
    }
  }

  /// Resets all play along data related to achievements.
  void _resetPlayAlongAchievements() async {
    final prefs = await SharedPreferences.getInstance();

    for (String track in trackNames) {
      for (Object difficulty in difficultyList) {
        prefs.setBool('${track}_${difficulty}_play_along_achievement', false);
      }
    }
  }

  /// Resets all endless data related to achievements.
  void _resetEndlessAchievements() async {
    final prefs = await SharedPreferences.getInstance();

    for (String clef in <String>['treble', 'bass']) {
      for (Object difficulty in difficultyList) {
        String level = difficulty.toString().toLowerCase();
        //print('endless-Clef.$clef-$level-achievement');
        prefs.setBool('endless-Clef.$clef-$level-achievement', false);
      }
    }
  }

  /// Decides whether a lesson achievement needs to be shown.
  ///
  /// If yes, the text of the achievement is also sent.
  Future<List> displayLessonNotification() async {
    final prefs = await SharedPreferences.getInstance();

    String text = "";
    int lessonsPassed = 0;
    bool achieved = true;

    for (int x = 0; x < numOfLessons; x++) {
      bool value = prefs.getBool('lesson-num-$x') ?? false;
      if (value) lessonsPassed += 1;
    }

    bool allAchieved = prefs.getBool('all-lessons-complete') ?? false;

    if (lessonsPassed == 1) {
      text = "You completed 1 lesson";
    } else if (lessonsPassed == 5) {
      text = "You completed 5 lessons";
    } else if (lessonsPassed == numOfLessons && allAchieved == false) {
      text = "You completed all lessons";
      prefs.setBool('all-lessons-complete', true);
    } else {
      achieved = false;
    }

    return [achieved, text];
  }

  /// Decides whether a quiz achievement needs to be shown.
  ///
  /// If yes, the text of the achievement is also sent.
  Future<List> displayQuizNotification() async {
    final prefs = await SharedPreferences.getInstance();
    int completedQuizzes = (prefs.getInt('completed_quizzes') ?? 0);
    bool allAchieved = prefs.getBool('all-quizzes-complete') ?? false;

    String text = "";
    bool achieved = true;

    if (completedQuizzes == 1) {
      text = "You completed 1 quiz";
    } else if (completedQuizzes == 5) {
      text = "You completed 5 quizzes";
    } else if (completedQuizzes == numOfQuizzes && allAchieved == false) {
      text = "You completed all quizzes";
      prefs.setBool('all-quizzes-complete', true);
    } else {
      achieved = false;
    }

    return [achieved, text];
  }

  /// Decides whether a speedrun achievement needs to be shown.
  ///
  /// If yes, the text of the achievement is also sent.
  Future<List> displaySpeedrunNotification(time, score) async {
    final prefs = await SharedPreferences.getInstance();
    bool achieved =
        (prefs.getBool('${time}_second_speedrun_achievement') ?? false);

    bool toDisplay = true;

    String text = "";

    if (achieved) {
      toDisplay = false;
    } else {
      if (score >= time / 2) {
        prefs.setBool('${time}_second_speedrun_achievement', true);
        text = "You got 50% or more in this speedrun";
      } else {
        toDisplay = false;
      }
    }
    return [toDisplay, text];
  }

  /// Decides whether a endless achievement needs to be shown.
  ///
  /// If yes, the text of the achievement is also sent.
  displayEndlessNotification(difficulty, score, clef) async {
    final prefs = await SharedPreferences.getInstance();

    String level = difficulty.toString().toLowerCase();

    bool achieved =
        (prefs.getBool('endless-$clef-$level-achievement') ?? false);

    bool toDisplay = true;
    String text = "";

    if (achieved) {
      toDisplay = false;
    } else {
      if (level == 'beginner') {
        if (score >= bgnrScore) {
          text = "You scored 10 or more in this endless mode";
          prefs.setBool('endless-$clef-$level-achievement', true);
        } else {
          toDisplay = false;
        }
      } else if (level == 'intermediate') {
        if (score >= interScore) {
          text = "You scored 20 or more in this endless mode";
          prefs.setBool('endless-$clef-$level-achievement', true);
        } else {
          toDisplay = false;
        }
      } else if (level == 'expert') {
        if (score >= expertScore) {
          text = "You scored 30 or more in this endless mode";
          prefs.setBool('endless-$clef-$level-achievement', true);
        } else {
          toDisplay = false;
        }
      } else {
        toDisplay = false;
      }
    }
    return [toDisplay, text];
  }

  /// Decides whether a play along achievement needs to be shown.
  ///
  /// If yes, the text of the achievement is also sent.
  displayPlayAlongNotification(difficulty, track, hitCounter) async {
    final prefs = await SharedPreferences.getInstance();

    String percentage =
        ((hitCounter.score / hitCounter.numNotes) * 100).toStringAsFixed(1);
    if (percentage[percentage.length - 1] == '0') {
      percentage = double.parse(percentage).round().toString();
    }

    bool achieved =
        (prefs.getBool('${track}_${difficulty}_play_along_achievement') ??
            false);

    bool toDisplay = true;
    String text = "";

    if (achieved) {
      toDisplay = false;
    } else {
      if (percentage == playAlongScore) {
        prefs.setBool('${track}_${difficulty}_play_along_achievement', true);
        text = "You got 100% in this play along! Good job!";
      } else {
        toDisplay = false;
      }
    }
    return [toDisplay, text];
  }
}
