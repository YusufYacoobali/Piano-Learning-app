import 'package:shared_preferences/shared_preferences.dart';

const List<Object> difficulties = ['Beginner', 'Intermediate', 'Expert'];
const List<Object> themes = ['Dark', 'Light'];

class Settings {

  static const bool _defaultSoundToggle = true;
  static const int _defaultVolumeLevel = 100;
  static const String _defaultDifficultyLevel = 'Beginner';
  static const String _defaultTheme = 'Dark';

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
    } else if (value.runtimeType == bool) {
      await pref.setBool(name, value == true);
    } else {
      await pref.setString(name, value.toString());
    }
  }

  void reset() {
    _setDefaultValues();
    _writeDefaultsToDisk();
  }

  void _setDefaultValues() {
    _map['sound'] = _defaultSoundToggle;
    _map['volume'] = _defaultVolumeLevel;
    _map['difficulty'] = _defaultDifficultyLevel;
    _map['theme'] = _defaultTheme;
  }

  Future<void> _writeDefaultsToDisk() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('sound', _defaultSoundToggle);
    pref.setInt('volume', _defaultVolumeLevel);
    pref.setString('difficulty', _defaultDifficultyLevel);
    pref.setString('theme', _defaultTheme);
  }

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