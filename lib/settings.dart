import 'package:shared_preferences/shared_preferences.dart';

class Settings {

  final List<Object> _difficulties = ["Beginner", "Intermediate", "Expert"];
  final List<Object> _themes = ["Dark", "Light", "Custom"];

  final Map _map = {};

  Settings() {
    setDefaultValues();
  }

  List<Object> getDifficulties() => _difficulties;
  List<Object> getThemes() => _themes;

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

  void setDefaultValues() {
    _map['sound'] = true;
    _map['volume'] = 100;
    _map['difficulty'] = _difficulties.first;
    _map['theme'] = _themes.first;
  }

  Future<void> _writeToDisk() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('sound', true);
    pref.setInt('volume', 100);
    pref.setString('difficulty', _difficulties[0].toString());
    pref.setString('theme', _themes[0].toString());
  }

  Future<void> loadSettingsFromDisk() async {
    final pref = await SharedPreferences.getInstance();
    bool? isOnDisk = pref.getBool('sound');
    if (isOnDisk == null) {
      setDefaultValues();
      await _writeToDisk();
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