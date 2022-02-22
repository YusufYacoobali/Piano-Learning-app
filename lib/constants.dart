import 'package:flutter/material.dart';

// List of the different difficulties
const List<Object> difficultyList = ['Beginner', 'Intermediate', 'Expert'];

// Default values of individual settings
const int defaultVolumeLevel = 100;
const String defaultDifficultyLevel = 'Beginner';
const String defaultTheme = 'Dark';

// The themes and the theme data associated with it
final Map<String, ThemeData> themeColors = <String, ThemeData> {
  'Dark':  ThemeData.dark(),
  'Light': ThemeData.light(),
  'Pink': ThemeData.dark().copyWith(
    backgroundColor: const Color.fromARGB(255, 200, 130, 255),
    scaffoldBackgroundColor: const Color.fromARGB(255, 200, 130, 255),
    appBarTheme: const AppBarTheme(
      color:   Color.fromARGB(255, 200, 110, 255),
    ),
  ),
};