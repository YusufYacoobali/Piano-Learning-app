import 'package:flutter/material.dart';

/// Settings Screen
// List of the different difficulties
const List<Object> difficultyList = ['Beginner', 'Intermediate', 'Expert'];

/// Default values of individual settings
const String defaultVolumeLevel = '100';
const String defaultDifficultyLevel = 'Beginner';
const String defaultTheme = 'Dark';

/// The themes and the theme data associated with it
final Map<String, ThemeData> themeColors = <String, ThemeData>{
  'Dark': ThemeData.dark(),
  'Light': ThemeData.light(),
  'Pink': ThemeData.dark().copyWith(
    backgroundColor: const Color.fromARGB(255, 200, 130, 255),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
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

ButtonStyle navButtonDeco = ElevatedButton.styleFrom(
  primary: Colors.orange.shade700,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  ),
  elevation: 15.0,
);

// Menu Screen
const String formattedAppName = 'Read\n That\n Sheet';
final Color buttonBoxColour = Colors.indigo.shade400;
const EdgeInsets boxMargin = EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0);
const double boxRadii = 10.0;
final TextStyle appNameTextStyle = TextStyle(
    fontSize: 100.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    shadows: [
      Shadow(
        color: Colors.blueGrey.shade800,
        offset: const Offset(4.0, 4.0),
      ),
    ]);
final TextStyle buttonTextStyle = TextStyle(
  fontSize: 100.0,
  color: Colors.grey.shade300,
  fontWeight: FontWeight.bold,
);
const Icon settingsIcon = Icon(
  Icons.settings,
  //size: 75.0,
  //color: Color(0xff5f0a87),
);

BoxDecoration menuButtonDeco = BoxDecoration(
  borderRadius: BorderRadius.circular(boxRadii),
  gradient: const LinearGradient(
    colors: [Color(0xff5f0a87), Color(0xffa4508b)],
  ),
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

//Lesson Menu Screen
BoxDecoration lessonButtonDeco = BoxDecoration(
  shape: BoxShape.circle,
  color: buttonBoxColour,
  //borderRadius: BorderRadius.circular(boxRadii),
  gradient: const LinearGradient(
    colors: [Color(0xff5f0a87), Color(0xffa4508b)],
  ),
);

BoxDecoration completeLessonButtonDeco = BoxDecoration(
  shape: BoxShape.circle,
  color: buttonBoxColour,
  //borderRadius: BorderRadius.circular(boxRadii),
  gradient: const LinearGradient(
    colors: [Color(0xff5aff15), Color(0xff00b712)],
  ),
);

// Lesson Screen
const Color optionButtonColour = Colors.purple;
const TextStyle optionButtonTextStyle =
    TextStyle(fontSize: 20, color: Colors.white);

/// Question Skeleton
const TextStyle questionTrackerTextStyle = TextStyle(fontSize: 25);

/// Marking Criteria
const double passThreshold = 0.4;

/// In what positions above or below the treble clef are to be painted
const Map<String, List<String>> trebleClefNoteLinesOffset =
    <String, List<String>>{
  // Notes that are below the treble clef stave
  'C4': ['C4'],
  'B3': ['C4'],
  'A3': ['A3', 'C4'],
  'G3': ['A3', 'C4'],
  'F3': ['F3', 'A3', 'C4'],

  // Notes that are above the treble clef stave
  'A5': ['A5'],
  'B5': ['A5'],
  'C6': ['C6', 'A5'],
  'D6': ['C6', 'A5'],
  'E6': ['E6', 'C6', 'A5'],
};

/// In what positions above or below the bass clef are to be painted
const Map<String, List<String>> bassClefNoteLinesOffset =
    <String, List<String>>{
  // Notes that are below the bass clef stave
  'E2': ['E2'],
  'D2': ['E2'],
  'C2': ['C2', 'E2'],
  'B1': ['C2', 'E2'],
  'A1': ['A1', 'C2', 'E2'],

  // Notes that are above the bass clef stave
  'C4': ['C4'],
  'D4': ['C4'],
  'E4': ['E4', 'C4'],
  'F4': ['E4', 'C4'],
  'G4': ['G4', 'E4', 'C4'],
};

/// The offset from baseline of the notes on the treble clef
const Map<String, int> trebleClefSheetNoteOffset = <String, int>{
  'F3': -48,
  'G3': -37,
  'A3': -28,
  'B3': -19,
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
  'A5': 107,
  'B5': 118,
  'C6': 127,
  'D6': 138,
  'E6': 147,
};

/// The offset from baseline of the notes on the bass clef
const Map<String, int> bassClefSheetNoteOffset = <String, int>{
  'G4': 116,
  'F4': 116,
  'E4': 127,
  'D4': 116,
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
  'F2': 0,
  'E2': -10,
  'D2': -17,
  'C2': -28,
  'B1': -37,
  'A1': -46,
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

//Achievement screen
const double cardWidth = 270;
const double cardHeight = 270;

const double circularIndicatorRadius = 74;

const double indicatorLineWidth = 16;
const Color indicatorBackground = Colors.red;
const Color indicatorGoodProgress = Colors.green;
const Color indicatorBadProgress = Colors.orange;

const Icon playLessonIcon = Icon(
  Icons.circle_outlined,
  size: 30.0,
);

const TextStyle achievementTextStyle = TextStyle(fontSize: 20);
const int animationDuration = 1200;
final Decoration achievementCardDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  gradient: const LinearGradient(
    colors: [Color(0xff5f0a87), Color(0xffa4508b)],
  ),
);

//achievement making
const int numOfLessons = 6;
const int numOfquizzes = 10;

//pause menu
const double menuLength = 80.0;
const double menuWidth = 30.0;

const TextStyle pauseMenuTextStyle = TextStyle(
  fontSize: 40.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

ButtonStyle pauseMenuButtonStyle = ElevatedButton.styleFrom(
  primary: const Color(0xffa4508b),
  onPrimary: Colors.grey.shade300,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  fixedSize: const Size(180.0, 30.0),
  elevation: 5.0,
);

const Icon pauseMenuHomeIcon = Icon(
  Icons.home,
  size: 20.0,
);

const Icon pauseMenuPlayIcon = Icon(
  Icons.play_arrow,
  size: 20.0,
);

const Icon pauseMenuSelectionIcon = Icon(
  Icons.auto_stories_outlined,
  size: 20.0,
);

BoxDecoration cardBackground = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  gradient: LinearGradient(
    colors: [
      const Color(0xff5f0a87).withOpacity(0.8),
      const Color(0xffa4508b).withOpacity(0.5),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);

const Map<String, String> sharpFlatEquivalence = <String, String>{
  'Db': 'C#',
  'Eb': 'D#',
  'Gb': 'F#',
  'Ab': 'G#',
  'Bb': 'A#',
};

/// Notes that can be played in endless mode
const List<String> endlessBeginnerNotes = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
const List<String> endlessIntermediateNotes = [
  'C',
  'Db',
  'D',
  'D#',
  'E',
  'F',
  'F#',
  'G',
  'A',
  'Bb',
  'B'
];
const List<String> endlessExpertNotes = [
  'C',
  'C#',
  'Db',
  'D',
  'D#',
  'Eb',
  'E',
  'F',
  'F#',
  'Gb',
  'G',
  'G#',
  'Ab',
  'A',
  'A#',
  'Bb',
  'B'
];

/// How fast the notes move across the screen in endless mode for each difficulty
const int endlessBeginnerBpm = 80;
const int endlessIntermediateBpm = 110;
const int endlessExpertBpm = 140;

/// maximum and minimum gaps between notes in endless mode
const int endlessBeginnerMinTime = 4;
const int endlessBeginnerMaxTime = 7;
const int endlessIntermediateMinTime = 3;
const int endlessIntermediateMaxTime = 5;
const int endlessExpertMinTime = 1;
const int endlessExpertMaxTime = 4;

/// How fast the notes move across the screen in play along for each difficulty
const int playAlongBeginnerBpm = 50;
const int playAlongIntermediateBpm = 70;
const int playAlongExpertBpm = 90;

/// How far apart the notes are in play along for each difficulty
const int playAlongBeginnerNoteSpacing = 200;
const int playAlongIntermediateNoteSpacing = 150;
const int playAlongExpertNoteSpacing = 130;

/// How far each note should move per iteration
const double noteMovement = 1;

const Icon helperButton = Icon(
  Icons.help,
);

const Icon helpPlayButtonStyle = Icon(
  Icons.play_arrow,
  size: 35.0,
);

ButtonStyle helperMenuButonStyle = ElevatedButton.styleFrom(
  primary: const Color(0xffa4508b).withOpacity(0.3),
  onPrimary: Colors.grey.shade300,
  fixedSize: const Size(180.0, 60.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);

const TextStyle helperMenuTextStyle = TextStyle(
  fontSize: 40.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

/// Clef symbols
const String trebleClef = '𝄞';
const String bassClef = '𝄢';

/// Android clef fonts
const double androidTrebleClefFontSize = 70;
const double androidBassClefFontSize = 83;

/// Android clef offset positions
const double androidTrebleClefOffset = 80;
const double androidBassClefOffset = 93;

/// IOS clef fonts
/// Change these to change the clef size
const double iosTrebleClefFontSize = 190;
const double iosBassClefFontSize = 100;

/// IOS clef offsets
/// Change these to change the clef position on screen
const double iosTrebleClefOffset = 118;
const double iosBassClefOffset = 85;

/// black note symbols
const String sharp = '♯';
const String flat = '♭';

/// Android symbol fonts
const double androidSharpFontSize = 30;
const double androidFlatFontSize = 45;

/// Android symbol offset positions
const double androidSharpOffset = 20;
const double androidFlatOffset = 35;

/// IOS symbol fonts
/// Change these to change the symbol size
const double iosSharpFontSize = 10;
const double iosFlatFontSize = 15;

/// IOS symbol offsets
/// Change these to change the symbol position on screen
const double iosSharpOffset = 50;
const double iosFlatOffset = 65;

/// QuestionAnswerData
const int timeThreshold = 500;
const int correctAnswerIncrease = 5;
const int maxTimeReduction = 5;
const int incorrectAnswerReduction = 10;
