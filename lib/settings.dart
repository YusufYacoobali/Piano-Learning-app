import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/constants.dart' as constants;

class Settings {

  final Map _map = {};

  Settings() {
    _setDefaultValues();
  }

  Object getSetting(String setting) {
    return _map[setting];
  }

  Future<void> updateSetting(String name, Object value) async {
    _map[name] = value;
    final pref = await SharedPreferences.getInstance();

    if (value.runtimeType == double) {
      _map[name] = double.parse(value.toString()).toInt();
      await pref.setInt(name, double.parse(value.toString()).toInt());
    }
    else if (value.runtimeType == bool) {
      await pref.setBool(name, value == true);
    }
    else {
      await pref.setString(name, value.toString());
    }
  }

  // Resets the settings back to the defaults
  void reset() {
    _setDefaultValues();
    _writeDefaultsToDisk();
  }

  // Puts default values into the map
  void _setDefaultValues() {
    _map['sound'] = constants.defaultSoundToggle;
    _map['volume'] = constants.defaultVolumeLevel;
    _map['difficulty'] = constants.defaultDifficultyLevel;
    _map['theme'] = constants.defaultTheme;
  }

  // Writes the default settings values to Shared Preferences
  Future<void> _writeDefaultsToDisk() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('sound', constants.defaultSoundToggle);
    pref.setInt('volume', constants.defaultVolumeLevel);
    pref.setString('difficulty', constants.defaultDifficultyLevel);
    pref.setString('theme', constants.defaultTheme);
  }

  // Loads the settings from Shared Preferences
  Future<void> loadSettingsFromDisk() async {
    final pref = await SharedPreferences.getInstance();
    bool? isOnDisk = pref.getBool('sound');
    if (isOnDisk == null) {
      _setDefaultValues();
      await _writeDefaultsToDisk();
    }
    else {
      bool? sound = pref.getBool('sound');
      int? volume = pref.getInt('volume');
      String? difficulty = pref.getString('difficulty');
      String? theme = pref.getString('theme');
      if (sound != null) _map['sound'] = sound;
      if (volume != null) _map['volume'] = volume;
      if (difficulty != null) _map['difficulty'] = difficulty;
      if (theme != null) _map['theme'] = theme;
    }
  }
}