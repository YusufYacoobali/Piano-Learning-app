import 'package:flutter/material.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/storage_reader_writer.dart';

/// A class that handles theme changes.
class ThemeNotifier extends ChangeNotifier {
  /// The default theme.
  String _theme = defaultTheme;

  /// Handles theme changes and theme selection storage in Shared Preferences.
  final StorageReaderWriter _writer = StorageReaderWriter();

  ThemeNotifier() {
    getPreferences();
  }

  /// Updates theme.
  set theme(String value) {
    _theme = value;
    _updateTheme(value);
    notifyListeners();
  }

  /// Gets the theme if there is one else use the default.
  _getTheme() {
    _writer.loadDataFromStorage().then((value) {
      String theme = _writer.read('theme').toString();
      _theme = theme;
      notifyListeners();
    });
  }

  /// Updates the theme in storage.
  void _updateTheme(String value) async {
    _writer.write('theme', _theme);
  }

  /// Gets and updates the theme.
  getPreferences() {
    _getTheme();
  }

  /// Converts the theme to a actual usable theme profile.
  ThemeData? convertThemeToThemeData() {
    return themeColors[_theme];
  }
}
