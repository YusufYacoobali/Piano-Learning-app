import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {

  String _theme = 'Dark';
  String get theme => _theme;

  ThemeNotifier() {
    getPreferences();
  }

  set theme(String value) {
    _theme = value;
    notifyListeners();
  }

  _getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('theme');
  }

  getPreferences() async {
    _theme = await _getTheme();
    notifyListeners();
  }

  ThemeData convertThemeToThemeData(ThemeNotifier themeNotifier) {
    if (themeNotifier.theme == 'Light') {
      return ThemeData.light();
    }
    return ThemeData.dark();
  }
}