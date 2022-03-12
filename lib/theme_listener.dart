import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:sight_reading_app/constants.dart' as constants;

class ThemeNotifier extends ChangeNotifier {

  String _theme = constants.defaultTheme;

  ThemeNotifier() {
    getPreferences();
  }

  String get theme => _theme;

  /// Updates theme
  set theme(String value) {
    _theme = value;
    _updateTheme(value);
    notifyListeners();
  }

  /// Gets the theme if there is one else use the default
  _getTheme() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? theme = pref.getString('theme');
    if (theme != null) {
      return theme;
    }
    pref.setString('theme', constants.defaultTheme);
    return constants.defaultTheme;
  }

  /// Updates the theme in storage
  void _updateTheme(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('theme', value);
  }

  /// Gets and updates the theme
  getPreferences() async {
    _theme = await _getTheme();
    notifyListeners();
  }

  /// Converts the theme to a actual usable theme profile
  ThemeData? convertThemeToThemeData() {
    return constants.themeColors[_theme];
  }
}