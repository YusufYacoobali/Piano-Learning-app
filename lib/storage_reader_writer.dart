import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_answer_data.dart';
import 'package:sight_reading_app/questions.dart';
import 'package:sight_reading_app/screens/play_along_menu_screen.dart';

import 'constants.dart';

/// Writes data to storage
class StorageReaderWriter {
  /// The key-value pairs to store in memory
  final Map _map = {};

  /// Constructor
  StorageReaderWriter() {
    _setDefaultSettings();
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
    _setDefaultSettings();
    _writeDefaultSettingsToStorage();
  }

  /// Puts default values into the map
  void _setDefaultValues() {
    // With 7 lessons:

    for (int i = 1; i <= 7; ++i) {
      _map['lesson $i'] = 0;
    }

    _setDefaultEndlessRecords();
    _setDefaultPlayAlongRecords();
  }

  /// Writes the default StorageWriter values to Shared Preferences
  Future<void> _writeDefaultsToStorage() async {
    WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences pref = await SharedPreferences.getInstance();
    for (int i = 1; i <= 7; ++i) {
      pref.setString('lesson $i', '0');
    }
    _writeEndlessRecordsToStorage();
    _writePlayAlongRecordsToStorage();
  }

  /// Loads the StorageWriter from Shared Preferences
  Future<void> loadDataFromStorage() async {
    WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await _loadSettingsFromStorage(pref);
    await loadLessonScoresFromStorage(pref);
    await loadQuestionAnswerDataFromStorage(pref);
    await _loadEndlessRecordsFromStorage(pref);
    await _loadPlayAlongRecordsFromStorage(pref);
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

  loadAchievementValues() async {
    final prefs = await SharedPreferences.getInstance();
    int completedLessons = (prefs.getInt('completed_lessons') ?? 0);
    int completedQuizzes = (prefs.getInt('completed_quizzes') ?? 0);
    int endlessBassHS =
        int.parse(prefs.getString('endless-bass-high-score') ?? '0');
    int endlessTrebleHS =
        int.parse(prefs.getString('endless-treble-high-score') ?? '0');

    return [completedLessons, completedQuizzes, endlessBassHS, endlessTrebleHS];
  }

  /// Loads endless records from storage
  Future<void> _loadEndlessRecordsFromStorage(SharedPreferences pref) async {
    String? isOnDisk = pref.getString('endless-treble-beginner-high-score');
    if (isOnDisk == null) {
      _setDefaultEndlessRecords();
      _writeEndlessRecordsToStorage();
    } else {
      for (String clef in <String>['treble', 'bass']) {
        for (Object difficulty in difficultyList) {
          String key = 'endless-$clef-${difficulty.toString().toLowerCase()}-high-score';
          _map[key] = pref.getString(key);
        }
      }
    }
  }

  /// Sets the default endless records
  void _setDefaultEndlessRecords() {
    for (String clef in <String>['treble', 'bass']) {
      for (Object difficulty in difficultyList) {
        String key = 'endless-$clef-${difficulty.toString().toLowerCase()}-high-score';
        _map[key] = '0';
      }
    }
  }

  /// Writes the endless records to storage
  void _writeEndlessRecordsToStorage() {
    for (String clef in <String>['treble', 'bass']) {
      for (Object difficulty in difficultyList) {
        String key = 'endless-$clef-${difficulty.toString().toLowerCase()}-high-score';
        write(key, '0');
      }
    }
  }

  /// Loads play along records from storage
  Future<void> _loadPlayAlongRecordsFromStorage(SharedPreferences pref) async {
    String? isOnDisk = pref.getString('ode to joy - treble only-beginner-high-score');
    if (isOnDisk == null) {
      _setDefaultPlayAlongRecords();
      _writePlayAlongRecordsToStorage();
    } else {
      for (String track in trackNames) {
        for (Object difficulty in difficultyList) {
          String key = '${track.toLowerCase()}-${difficulty.toString().toLowerCase()}-high-score';
          _map[key] = pref.get(key);
        }
      }
    }
  }

  /// Sets default play along records
  void _setDefaultPlayAlongRecords() {
    for (String track in trackNames) {
      for (Object difficulty in difficultyList) {
        String key = '${track.toLowerCase()}-${difficulty.toString().toLowerCase()}-high-score';
        _map[key] = '0';
      }
    }
  }

  /// Writes play along records to storage
  void _writePlayAlongRecordsToStorage() {
    for (String track in trackNames) {
      for (Object difficulty in difficultyList) {
        String key = '${track.toLowerCase()}-${difficulty.toString().toLowerCase()}-high-score';
        write(key, '0');
      }
    }
  }

  /// Loads settings from storage
  Future<void> _loadSettingsFromStorage(SharedPreferences pref) async {
    String? isOnDisk = pref.getString('difficulty');
    if (isOnDisk == null) {
      _setDefaultValues();
      await _writeDefaultsToStorage();
    } else {
      _map['volume'] = pref.get('volume');
      _map['difficulty'] = pref.get('difficulty');
    }
  }

  /// Sets the default settings in the map
  void _setDefaultSettings() {
    _map['volume'] = defaultVolumeLevel;
    _map['difficulty'] = defaultDifficultyLevel;
  }

  /// Writes default settings to storage
  void _writeDefaultSettingsToStorage() async {
    write('volume', defaultVolumeLevel);
    write('difficulty', defaultDifficultyLevel);
  }
}
