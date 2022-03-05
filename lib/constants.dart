import 'package:flutter/material.dart';

/// Settings Screen
// List of the different difficulties
const List<Object> difficultyList = ['Beginner', 'Intermediate', 'Expert'];

/// Default values of individual settings
const int defaultVolumeLevel = 100;
const String defaultDifficultyLevel = 'Beginner';
const String defaultTheme = 'Dark';

/// The themes and the theme data associated with it
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

/// Results Screen
const titleWidgetTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 50.0,
);

const scoreWidgetTextStyle = TextStyle(
  fontWeight: FontWeight.w200,
  fontSize: 35.0,
);

/// Menu Screen
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

/// Keyboard Screen
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

/// Lesson Screen
const Color optionButtonColour = Colors.orange;
const TextStyle optionButtonTextStyle =
    TextStyle(fontSize: 20, color: Colors.black);

/// Question Skeleton
const TextStyle questionTrackerTextStyle = TextStyle(fontSize: 25);

/// Marking Criteria
const double passThreshold = 0.4;

/// The offset from baseline of the notes on the treble clef
const Map<String, int> trebleClefSheetNoteOffset = <String, int>{
  'C4': -10,
  'D4': 0,
  'E4': 7,
  'F4': 18,
  'G4': 27,
  'A4': 38,
  'B4': 47,
  'C5': 58,
  'D5': 67,
  'E5': 78,
  'F5': 87,
  'G5': 98,
};

/// The offset from baseline of the notes on the bass clef
const Map<String, int> bassClefSheetNoteOffset = <String, int>{
  'C4': 107,
  'B3': 96,
  'A3': 87,
  'G3': 78,
  'F3': 67,
  'E3': 58,
  'D3': 47,
  'C3': 37,
  'B2': 27,
  'A2': 17,
  'G2': 7,
};

/// The note of the middle line of the treble clef
const String trebleClefMidLineNote = 'C5';

/// The note of the middle line of the bass clef
const String bassClefMidLineNote = 'D3';

/// Speedrun Screen
final Color countdownTimerBackgroundColour = Colors.purple.shade500;
const Color countdownTimerFillColour = Colors.red;
const Color countdownTimerRingColour = Colors.grey;
const TextStyle countdownTimerTextStyle = TextStyle(
  fontSize: 33.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

/// List of Names of Keys
const List<String> whiteKeyNames = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
const List<String> blackKeyNames = ['Db', 'Eb', 'Gb', 'Ab', 'Bb'];
