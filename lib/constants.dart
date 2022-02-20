import 'package:flutter/material.dart';

// List of the different difficulties
const List<Object> difficultyList = ['Beginner', 'Intermediate', 'Expert'];

// Default values of individual settings
const bool defaultSoundToggle = true;
const int defaultVolumeLevel = 100;
const String defaultDifficultyLevel = 'Beginner';
const String defaultTheme = 'Dark';

// The themes and the theme data associated with it
final Map<String, ThemeData> themeColors = <String, ThemeData>{
  'Dark': ThemeData.dark(),
  'Light': ThemeData.light(),
  'Pink': ThemeData.dark().copyWith(
    backgroundColor: const Color.fromARGB(255, 200, 130, 255),
    scaffoldBackgroundColor: const Color.fromARGB(255, 200, 130, 255),
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 200, 110, 255),
    ),
  ),
};

const titleWidgetTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 50.0,
);

const scoreWidgetTextStyle = TextStyle(
  fontWeight: FontWeight.w200,
  fontSize: 40.0,
);

const String formattedAppName = 'Read\n That\n Sheet';
final Color appNameBoxColour = Colors.indigo.shade300;
final Color buttonBoxColour = Colors.indigo.shade400;
const EdgeInsets boxMargin = EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0);
const double boxRadii = 10.0;
final TextStyle appNameTextStyle = TextStyle(
    fontSize: 100.0,
    fontWeight: FontWeight.bold,
    color: Colors.grey.shade300,
    shadows: [
      Shadow(
        color: Colors.blueGrey.shade800,
        offset: const Offset(4.0, 4.0),
      ),
    ]);
final TextStyle buttonTextStyle = TextStyle(
  fontSize: 100.0,
  color: Colors.orange.shade500,
  fontWeight: FontWeight.bold,
);
final Icon settingsIcon = Icon(
  Icons.settings,
  //size: 75.0,
  color: Colors.orange.shade300,
);

final whiteKeyButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.white,
  minimumSize: const Size(double.infinity, double.infinity),
  padding: const EdgeInsets.all(20.0),
);

const whiteKeyTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);

final blackKeyButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.black,
  minimumSize: const Size(double.infinity, double.infinity),
  padding: const EdgeInsets.all(10.0),
);

const blackKeyTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);
