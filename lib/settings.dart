import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  int _volume = 0;
  bool _sound = false;
  final List<Object> _difficulties = ["Beginner", "Intermediate", "Expert"];
  final List<Object> _themes = ["Dark", "Light", "Custom"];
  Object _currentDifficulty = "";
  Object _currentTheme = "";

  Settings() {
    setDefaultValues();
  }

  List<Object> getDifficulties() => _difficulties;
  List<Object> getThemes() => _themes;
  int getVolume() => _volume;
  bool getSound() => _sound;
  Object getCurrentDifficulty() => _currentDifficulty;
  Object getCurrentTheme() => _currentTheme;

  Future<void> updateSound(bool s) async {
    _sound = s;
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('sound', s);
  }

  Future<void> updateVolume(double vol) async {
    _volume = vol.toInt();
    final pref = await SharedPreferences.getInstance();
    await pref.setInt('volume', vol.toInt());
  }

  Future<void> updateDifficulty(Object difficulty) async {
    _currentDifficulty = difficulty;
    final pref = await SharedPreferences.getInstance();
    await pref.setString('difficulty', difficulty.toString());
  }

  Future<void> updateTheme(Object theme) async {
    _currentTheme = theme;
    final pref = await SharedPreferences.getInstance();
    await pref.setString('theme', theme.toString());
  }

  void setDefaultValues() {
    _volume = 100;
    _sound = true;
    _currentDifficulty = _difficulties.first;
    _currentTheme = _themes.first;
  }

  Future<void> writeToDisk() async {
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
      await writeToDisk();
    }
    else {
      bool? sound = pref.getBool('sound');
      int? volume = pref.getInt('volume');
      String? difficulty = pref.getString('difficulty');
      String? theme = pref.getString('theme');
      if (sound != null) _sound = sound;
      if (volume != null) _volume = volume;
      if (difficulty != null) _currentDifficulty = difficulty;
      if (theme != null) _currentTheme = theme;
    }
  }
}
