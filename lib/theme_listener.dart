import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:sight_reading_app/constants.dart' as constants;

class ThemeNotifier extends ChangeNotifier {

  String _theme = constants.defaultTheme;

  ThemeNotifier() {
    getPreferences();
  }

  String get theme => _theme;

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

  ThemeData? convertThemeToThemeData() {
    return constants.themeColors[_theme];
  }
}