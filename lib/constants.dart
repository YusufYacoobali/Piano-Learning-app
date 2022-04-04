import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Settings Screen
/// List of the different difficulties
const List<Object> difficultyList = ['Beginner', 'Intermediate', 'Expert'];

/// Default values of individual settings
const String defaultDifficultyLevel = 'Beginner';
const String defaultTheme = 'Dark';

/// Colours for themes
const Color _whiteColour = Colors.white;
const Color _darkBackgroundColour = Color(0xff1F1D36);
const Color _darkAppBarColour = Color(0xff655989);
const Color _darkScrollBarColour = Color(0xffF0E3FF);
const Color _darkAlertDialogColour = Color(0xff2C2E43);
const Color _darkSettingColour = Color(0xff700B97);
const Color _darkSettingColour2 = Color(0xff8566AA);
const Color _darkTabBarColour = Color(0xffDCD6F7);

const Color _lightAppBarColour = Color(0xff553C8B);
const Color _lightBackgroundColour = Color(0xffCCC1FF);
const Color _lightScrollBarColour = Color(0xff3D2C8D);
const Color _lightSettingColour = Color(0xff664E88);
//const Color _lightSettingColour2 = Color(0xff602080);
const Color _lightTabBarColour = Color(0xffF7E8F6);

const Color _pinkAppBarColour = Color(0xffE7759A);
const Color _pinkBackgroundColour = Color(0xffEFBBCF);
const Color _pinkScrollBarColour = Color(0xffB762C1);
const Color _pinkAlertDialogColour = Color(0xffFFC0D3);
const Color _pinkSettingColour = Color(0xffFF96AD);
const Color _pinkSettingColour2 = Color(0xffEB596E);
const Color _pinkTabBarColour = Color(0xffF1C6E7);

/// The themes and the theme data associated with it.
final Map<String, ThemeData> themeColors = <String, ThemeData>{
  'Dark': ThemeData.dark().copyWith(
    scaffoldBackgroundColor: _darkBackgroundColour,
    appBarTheme: darkAppBarTheme,
    tabBarTheme: darkTabBarTheme,
    scrollbarTheme: darkScrollBarTheme,
    elevatedButtonTheme: darkElevatedButtonTheme,
    dialogTheme: darkDialogTextStyleTheme,
    textButtonTheme: darkTextButtonButtonTheme,
  ),
  'Light': ThemeData.light().copyWith(
    scaffoldBackgroundColor: _lightBackgroundColour,
    appBarTheme: lightAppBarTheme,
    tabBarTheme: lightTabBarTheme,
    iconTheme: iconColourTheme,
    scrollbarTheme: lightScrollBarTheme,
    elevatedButtonTheme: lightElevatedButtonTheme,
    textButtonTheme: lightTextButtonButtonTheme,
  ),
  'Pink': ThemeData.light().copyWith(
    backgroundColor: _whiteColour,
    appBarTheme: pinkAppBarTheme,
    tabBarTheme: pinkTabBarTheme,
    scaffoldBackgroundColor: _pinkBackgroundColour,
    iconTheme: iconColourTheme,
    scrollbarTheme: pinkScrollBarTheme,
    dialogTheme: pinkDialogTextStyleTheme,
    elevatedButtonTheme: pinkElevatedButtonTheme,
    textButtonTheme: pinkTextButtonButtonTheme,
  ),
};

/// Theme data.
///
/// Different theme of App bars.
const darkAppBarTheme = AppBarTheme(
  color: _darkAppBarColour,
);
const lightAppBarTheme = AppBarTheme(
  color: _lightAppBarColour,
);
const pinkAppBarTheme = AppBarTheme(
  color: _pinkAppBarColour,
);

/// Different theme of Tab bars.
final darkTabBarTheme = TabBarTheme(
  labelColor: _whiteColour,
  unselectedLabelColor: _darkTabBarColour,
  indicator: tabBarUnderlineColour,
);
final lightTabBarTheme = TabBarTheme(
  labelColor: _whiteColour,
  unselectedLabelColor: _lightTabBarColour,
  indicator: tabBarUnderlineColour,
);
final pinkTabBarTheme = TabBarTheme(
  labelColor: _whiteColour,
  unselectedLabelColor: _pinkTabBarColour,
  indicator: tabBarUnderlineColour,
);
UnderlineTabIndicator tabBarUnderlineColour = const UnderlineTabIndicator(
  borderSide: BorderSide(width: 2, color: _whiteColour),
);

/// Colour for icons.
final iconColourTheme = const IconThemeData().copyWith(color: _whiteColour);

/// Different theme of scroll bars.
final darkScrollBarTheme = const ScrollbarThemeData().copyWith(
  thumbColor: MaterialStateProperty.all(_darkScrollBarColour),
);
final lightScrollBarTheme = const ScrollbarThemeData().copyWith(
  thumbColor: MaterialStateProperty.all(_lightScrollBarColour),
);
final pinkScrollBarTheme = const ScrollbarThemeData().copyWith(
  thumbColor: MaterialStateProperty.all(_pinkScrollBarColour),
);

/// Text styles for dialog boxes.
const alertDialogTextStyle = TextStyle(
  color: _whiteColour,
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
);
const contentDialogTextStyle = TextStyle(
  color: _whiteColour,
  fontSize: 16.0,
);

/// Different theme of alert dialogs.
const darkDialogTextStyleTheme = DialogTheme(
  backgroundColor: _darkAlertDialogColour,
  titleTextStyle: alertDialogTextStyle,
  contentTextStyle: contentDialogTextStyle,
);
const pinkDialogTextStyleTheme = DialogTheme(
  backgroundColor: _pinkAlertDialogColour,
  titleTextStyle: alertDialogTextStyle,
  contentTextStyle: contentDialogTextStyle,
);

/// Different theme of elevated buttons.
final darkElevatedButtonTheme =
    ElevatedButtonThemeData(style: darkElevatedButtonStyle);

final lightElevatedButtonTheme =
    ElevatedButtonThemeData(style: lightElevatedButtonStyle);

final pinkElevatedButtonTheme =
    ElevatedButtonThemeData(style: pinkElevatedButtonStyle);

/// Different colour of elevated buttons.
ButtonStyle darkElevatedButtonStyle = ElevatedButton.styleFrom(
  primary: _darkSettingColour,
);

ButtonStyle lightElevatedButtonStyle = ElevatedButton.styleFrom(
  primary: _lightSettingColour,
);

ButtonStyle pinkElevatedButtonStyle = ElevatedButton.styleFrom(
  primary: _pinkSettingColour,
);

/// Different theme of text buttons.
final darkTextButtonButtonTheme =
    TextButtonThemeData(style: darkTextButtonStyle);
final lightTextButtonButtonTheme =
    TextButtonThemeData(style: lightTextButtonStyle);
final pinkTextButtonButtonTheme =
    TextButtonThemeData(style: pinkTextButtonStyle);

/// Different colour of text buttons.
ButtonStyle darkTextButtonStyle = TextButton.styleFrom(
  primary: _darkSettingColour2,
);
ButtonStyle lightTextButtonStyle = TextButton.styleFrom(
  primary: _lightSettingColour,
);

ButtonStyle pinkTextButtonStyle = TextButton.styleFrom(
  primary: _pinkSettingColour2,
);

/// Results Screen text styles.
const titleWidgetTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 50.0,
);
const scoreWidgetTextStyle = TextStyle(
  fontWeight: FontWeight.w200,
  fontSize: 35.0,
);

/// Results screen button styles.
ButtonStyle navButtonDeco = ElevatedButton.styleFrom(
  primary: Colors.orange.shade700,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  ),
  elevation: 15.0,
);

/// Menu Screen style information.
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
);
BoxDecoration menuButtonDeco = BoxDecoration(
  borderRadius: BorderRadius.circular(boxRadii),
  gradient: const LinearGradient(
    colors: [Color(0xff5f0a87), Color(0xffa4508b)],
  ),
);

/// Keyboard Screen styling.
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

/// Lesson Menu Screen styling.
BoxDecoration lessonButtonDeco = BoxDecoration(
  shape: BoxShape.circle,
  color: buttonBoxColour,
  gradient: const LinearGradient(
    colors: [Color(0xff5f0a87), Color(0xffa4508b)],
  ),
);
BoxDecoration completeLessonButtonDeco = BoxDecoration(
  shape: BoxShape.circle,
  color: buttonBoxColour,
  gradient: const LinearGradient(
    colors: [Color(0xff00b712), Color(0xff5aff15)],
  ),
);

/// Stave Colours
/// The colour of the stave background
const Color staveBackgroundColour = Colors.white;

/// The colour of stave lines
const Color staveStaveColour = Colors.black;

/// The colour of the stave notes
const Color staveNoteColour = Colors.black;

/// The colour of the stave play area
const Color stavePlayAreaColour = Color.fromARGB(100, 0, 255, 0);

/// Lesson Screen styling.
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
const double heightAndWidthOfStopWatch = 60;

/// List of Names of Keys
const List<String> whiteKeyNames = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
const List<String> blackKeyNames = ['Db', 'Eb', 'Gb', 'Ab', 'Bb'];

///Achievement screen constants.
const double cardWidth = 270;
const double cardHeight = 270;
const double circularIndicatorRadius = 58;
const double indicatorLineWidth = 16;
const Color indicatorBackground = Colors.red;
const Color indicatorGoodProgress = Colors.green;
const Color indicatorBadProgress = Colors.orange;
const Icon playLessonIcon = Icon(
  Icons.circle_outlined,
  size: 30.0,
);
const TextStyle achievementTitleTextStyle =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 15);
const TextStyle achievementTextStyle =
    TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
const int animationDuration = 1200;
final Decoration achievementCardDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  gradient: const LinearGradient(
    colors: [Color(0xff5f0a87), Color(0xffa4508b)],
  ),
);

/// Constants used for achievement making
const int numOfLessons = 10;
const int numOfQuizzes = 10;

/// Pause menu styling.
const double menuLength = 80.0;
const double menuWidth = 30.0;
const TextStyle pauseMenuTextStyle = TextStyle(
  fontSize: 40.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
ButtonStyle pauseMenuButtonStyle = ElevatedButton.styleFrom(
  primary: const Color.fromARGB(255, 192, 94, 163),
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

/// Styling for the 'cards'.
BoxDecoration cardBackground = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  gradient: LinearGradient(colors: [
    const Color(0xff5f0a87).withOpacity(1.0),
    const Color(0xffa4508b).withOpacity(1.0),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
);

/// Which sharps are the same as which flats.
const Map<String, String> sharpFlatEquivalence = <String, String>{
  'Db': 'C#',
  'Eb': 'D#',
  'Gb': 'F#',
  'Ab': 'G#',
  'Bb': 'A#',
};

/// The nodes that can be played in beginner mode for the treble clef in endless mode.
const List<String> endlessBeginnerTrebleNotes = [
  'C4',
  'D4',
  'E4',
  'F4',
  'G4',
  'A4',
  'B4',
  'C5'
];

/// The nodes that can be played in beginner mode for the bass clef in endless mode.
const List<String> endlessBeginnerBassNotes = [
  'C4',
  'B3',
  'A3',
  'G3',
  'F3',
  'E3',
  'D3',
  'C3'
];

/// The nodes that can be played in intermediate mode for the treble clef in endless mode.
const List<String> endlessIntermediateTrebleNotes = [
  'B3',
  'C4',
  'Db4',
  'D4',
  'D#4',
  'E4',
  'F4',
  'F#4',
  'G4',
  'A4',
  'Bb4',
  'B4',
  'C5',
  'D5',
  'Db5',
  'E5',
];

/// The nodes that can be played in intermediate mode for the bass clef in endless mode.
const List<String> endlessIntermediateBassNotes = [
  'C3',
  'Db3',
  'D3',
  'D#3',
  'E3',
  'F3',
  'F#3',
  'G3',
  'A3',
  'Bb3',
  'B3',
  'C4',
  'Db4',
  'D4',
];

/// The nodes that can be played in expert mode for the treble clef in endless mode.
const List<String> endlessExpertTrebleNotes = [
  'Bb3',
  'B3',
  'C4',
  'C#4',
  'Db4',
  'D4',
  'D#4',
  'Eb4',
  'E4',
  'F4',
  'F#4',
  'Gb4',
  'G4',
  'G#4',
  'Ab4',
  'A4',
  'A#4',
  'Bb4',
  'B4',
  'C5',
  'C#5',
  'Db5',
  'D5',
  'D#5',
  'Eb5',
  'E5',
  'F5',
];

/// The nodes that can be played in expert mode for the bass clef in endless mode.
const List<String> endlessExpertBassNotes = [
  'C3',
  'C#3',
  'Db3',
  'D3',
  'D#3',
  'Eb3',
  'E3',
  'F3',
  'F#3',
  'Gb3',
  'G3',
  'G#3',
  'Ab3',
  'A3',
  'A#3',
  'Bb3',
  'B3',
  'C4',
];

/// How far a note has to go to count for one time unit in endless mode.
const endlessIterationsPerTimeUnit = 120;

/// How fast the notes move across the screen in endless mode for each difficulty.
const int endlessBeginnerBpm = 80;
const int endlessIntermediateBpm = 110;
const int endlessExpertBpm = 108;

/// Maximum and minimum gaps between notes in endless mode.
const int endlessBeginnerMinTime = 4;
const int endlessBeginnerMaxTime = 7;
const int endlessIntermediateMinTime = 3;
const int endlessIntermediateMaxTime = 5;
const int endlessExpertMinTime = 2;
const int endlessExpertMaxTime = 4;

/// How fast the notes move across the screen in play along for each difficulty.
const int playAlongBeginnerBpm = 52;
const int playAlongIntermediateBpm = 72;
const int playAlongExpertBpm = 88;

/// How far apart the notes are in play along for each difficulty.
const int playAlongBeginnerNoteSpacing = 200;
const int playAlongIntermediateNoteSpacing = 150;
const int playAlongExpertNoteSpacing = 130;

/// How far each note should move per iteration.
const double noteMovement = 1;

/// Styling for the helper screens.
const Icon helperButton = Icon(
  Icons.help,
);
const Icon helpPlayButtonStyle = Icon(
  Icons.play_arrow,
  size: 40.0,
);
const TextStyle helperTextStyle = TextStyle(
  fontSize: 40.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
ButtonStyle helperButtonStyle = ElevatedButton.styleFrom(
  primary: const Color.fromARGB(255, 192, 94, 163),
  onPrimary: Colors.grey.shade300,
  textStyle: const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  fixedSize: const Size(190.0, 50.0),
  elevation: 5.0,
);

const TextStyle helperDescriptionTextStyle = TextStyle(
  fontSize: 20.0,
);

/// Clef symbols.
const String trebleClef = '𝄞';
const String bassClef = '𝄢';

/// Android clef fonts.
const double androidTrebleClefFontSize = 70;
const double androidBassClefFontSize = 83;

/// Android clef offset positions.
const double androidTrebleClefOffset = 80;
const double androidBassClefOffset = 93;

/// IOS clef fonts.
///
/// Change these to change the clef size.
const double iosTrebleClefFontSize = 190;
const double iosBassClefFontSize = 100;

/// IOS clef offsets.
///
/// Change these to change the clef position on screen.
const double iosTrebleClefOffset = 118;
const double iosBassClefOffset = 85;

/// black note symbols.
const String sharp = '♯';
const String flat = '♭';

/// Android symbol fonts.
const double androidSharpFontSize = 30;
const double androidFlatFontSize = 45;

/// Android symbol offset positions.
const double androidSharpOffset = 20;
const double androidFlatOffset = 35;

/// IOS symbol fonts.
///
/// Change these to change the symbol size.
const double iosSharpFontSize = 40;
const double iosFlatFontSize = 60;

/// IOS symbol offsets.
///
/// Change these to change the symbol position on screen.
const double iosSharpOffset = 20;
const double iosFlatOffset = 30;

/// QuestionAnswerData.
const int timeThreshold = 500;
const int correctAnswerIncrease = 5;
const int maxTimeReduction = 5;
const int incorrectAnswerReduction = 10;

/// In app notification.
const TextStyle title = TextStyle(fontSize: 30);
const TextStyle achievedText = TextStyle(fontSize: 22);

/// Random Quiz Screen information.
const int numOfQuestionsInRandomQuiz = 10;

/// Practice Quiz Screen information.
const int numOfQuestionsInPracticeQuiz = 10;

/// Review Answers Screen information.
const double reviewAnswerCardHeight = 300;
const double reviewAnswerCardWidth = 720;
const Icon correctIcon = Icon(
  Icons.check_circle,
  size: 45.0,
);
const Icon incorrectIcon = Icon(
  Icons.cancel,
  size: 45.0,
);

/// Notification Time (UTC)
const Time notificationTime = Time(12, 00, 00);

/// Endless achievement scores
const int beginnerScore = 10;
const int intermediateScore = 20;
const int expertScore = 30;

/// Play along achievement score
const String playAlongScore = '100';

/// The ordering and weighting of all the notes
const Map<String, int> noteValues = <String, int>{
  'C': 0,
  'C#': 1,
  'Db': 1,
  'D': 2,
  'D#': 3,
  'Eb': 3,
  'E': 4,
  'F': 5,
  'F#': 6,
  'Gb': 6,
  'G': 7,
  'G#': 8,
  'Ab': 8,
  'A': 9,
  'A#': 10,
  'Bb': 10,
  'B': 11,
};
