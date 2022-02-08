
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

  void updateCurrentTheme(Object theme) => _currentTheme = theme;
  void updateCurrentDifficulty(Object difficulty) => _currentDifficulty = difficulty;
  void updateVolume(int v) => _volume = v;
  void updateSound(bool s) => _sound = s;

  void setDefaultValues() {
    _volume = 100;
    _sound = true;
    _currentDifficulty = _difficulties.first;
    _currentTheme = _themes.first;
  }
}