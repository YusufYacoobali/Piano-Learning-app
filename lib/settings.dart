import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/constants.dart' as constants;

class Settings {
  final Map _map = {};

  Settings() {
    _setDefaultValues();
  }

  /// Gets a setting from the map
  Object getSetting(String setting) {
    return _map[setting];
  }

  /// Updates a settings with a key and the value
  Future<void> updateSetting(String name, Object value) async {
    _map[name] = value;
    final SharedPreferences pref = await SharedPreferences.getInstance();

    if (value.runtimeType == double) {
      _map[name] = double.parse(value.toString()).toInt();
      await pref.setInt(name, double.parse(value.toString()).toInt());
    } else {
      await pref.setString(name, value.toString());
    }
  }

  /// Resets the settings back to the defaults
  void reset() {
    _setDefaultValues();
    _writeDefaultsToStorage();
    _resetLessons();
    //_resetAchievements();
    _resetQuizzes();
    resetSpeedrunAchievements();
    resetSpeedrunRecords();
  }

  /// Puts default values into the map
  void _setDefaultValues() {
    _map['volume'] = constants.defaultVolumeLevel;
    _map['difficulty'] = constants.defaultDifficultyLevel;
  }

  /// Writes the default settings values to Shared Preferences
  Future<void> _writeDefaultsToStorage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('volume', int.parse(constants.defaultVolumeLevel));
    pref.setString('difficulty', constants.defaultDifficultyLevel);
  }

  /// Loads the settings from Shared Preferences
  Future<void> loadSettingsFromStorage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int? isOnDisk = pref.getInt('volume');
    if (isOnDisk == null) {
      _setDefaultValues();
      await _writeDefaultsToStorage();
    } else {
      int? volume = pref.getInt('volume');
      String? difficulty = pref.getString('difficulty');
      if (volume != null) _map['volume'] = volume;
      if (difficulty != null) _map['difficulty'] = difficulty;
    }
  }

  Future<void> _resetLessons() async {
    final prefs = await SharedPreferences.getInstance();

    for (int x = 0; x < constants.numOfLessons; x++) {
      prefs.setBool('lesson-num-$x', false);
    }
    //print("lessons reset");
  }

  Future<void> _resetQuizzes() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setInt('completed_quizzes', 0);
    //print("quizzes reset");
  }

  resetSpeedrunAchievements() async {
    final prefs = await SharedPreferences.getInstance();

    for (int x = 10; x < 70; x += 10) {
      prefs.setBool('${x}_second_speedrun_achievement', false);
    }
  }

  resetSpeedrunRecords() async {
    final prefs = await SharedPreferences.getInstance();

    for (int x = 10; x < 70; x += 10) {
      prefs.setInt('${x}_second_speedrun_record', 0);
    }
  }
}
