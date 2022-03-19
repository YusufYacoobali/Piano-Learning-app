import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sight_reading_app/screens/achievements_screen.dart';
import 'package:sight_reading_app/screens/endless_mode_screen.dart';
import 'package:sight_reading_app/screens/helper_menu_screen.dart';
import 'package:sight_reading_app/screens/helper_screen.dart';
import 'package:sight_reading_app/screens/key_detection_screen.dart';
import 'package:sight_reading_app/screens/keyboard_screen.dart';
import 'package:sight_reading_app/screens/lesson_menu_screen.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';
import 'package:sight_reading_app/screens/practice_quiz_screen.dart';
import 'package:sight_reading_app/screens/practice_screen.dart';
import 'package:sight_reading_app/screens/random_quiz_screen.dart';
import 'package:sight_reading_app/screens/settings_screen.dart';
import 'package:sight_reading_app/storage_reader_writer.dart';
import 'package:sight_reading_app/theme_listener.dart';
import 'package:provider/provider.dart';
import 'package:sight_reading_app/screens/play_along_menu_screen.dart';
import 'package:sight_reading_app/screens/speedrun_menu_screen.dart';
import 'package:sight_reading_app/screens/quiz_selection_screen.dart';
import 'package:sight_reading_app/screens/keyboard_sheet_screen.dart';
import 'package:sight_reading_app/screens/note_selector_sheet_screen.dart';

void main() {
  StorageReaderWriter().loadDataFromStorage();
  // Starting the app in landscape orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft])
      .then((value) => runApp(const SightReadingApp()));
}

class SightReadingApp extends StatelessWidget {
  const SightReadingApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Changes the theme
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier themeNotifier, child) {
          return MaterialApp(
            title: 'SightReadingApp',
            theme: themeNotifier.convertThemeToThemeData(),
            debugShowCheckedModeBanner: false,
            initialRoute: MenuScreen.id,
            routes: {
              MenuScreen.id: (context) => const MenuScreen(),
              LessonMenuScreen.id: (context) => const LessonMenuScreen(),
              PracticeScreen.id: (context) => const PracticeScreen(),
              PlayAlongMenuScreen.id: (context) => const PlayAlongMenuScreen(),
              SpeedrunMenuScreen.id: (context) => const SpeedrunMenuScreen(),
              QuizSelectionScreen.id: (context) => const QuizSelectionScreen(),
              AchievementsScreen.id: (context) => const AchievementsScreen(),
              SettingsScreen.id: (context) => const SettingsScreen(),
              KeyboardScreen.id: (context) => const KeyboardScreen(),
              // instruction screens
              PlayAlongInstructions.id: (context) =>
                  const PlayAlongInstructions(),
              EndlessInstructions.id: (context) => const EndlessInstructions(),
              QuizInstruction.id: (context) => const QuizInstruction(),
              SpeedrunInstructions.id: (context) =>
                  const SpeedrunInstructions(),
              PracticeInstructions.id: (context) =>
                  const PracticeInstructions(),
              EndlessModeScreen.id: (context) => const EndlessModeScreen(),
              // Temporary routes to demo screens
              KeyboardSheetScreen.id: (context) => const KeyboardSheetScreen(),
              NoteSelectorSheetScreen.id: (context) =>
                  const NoteSelectorSheetScreen(),
              KeyDetectionScreen.id: (context) => const KeyDetectionScreen(),
              RandomQuizScreen.id: (context) => const RandomQuizScreen(),
              PracticeQuizScreen.id: (context) => const PracticeQuizScreen(),

              //helper route
              HelperMenuScreen.id: (context) => const HelperMenuScreen(),
              HelperScreen.id: (context) => const HelperScreen(),
            },
          );
        },
      ),
    );
  }
}
