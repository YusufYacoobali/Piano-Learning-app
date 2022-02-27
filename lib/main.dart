import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sight_reading_app/screens/achievements_screen.dart';
import 'package:sight_reading_app/screens/keyboard_screen.dart';
import 'package:sight_reading_app/screens/lesson_screen.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';
import 'package:sight_reading_app/screens/practice_screen.dart';
import 'package:sight_reading_app/screens/settings_screen.dart';
import 'package:sight_reading_app/theme_listener.dart';
import 'package:provider/provider.dart';
import 'package:sight_reading_app/screens/play_along_menu_screen.dart';
import 'package:sight_reading_app/screens/speedrun_menu_screen.dart';
import 'package:sight_reading_app/screens/quiz_selection_screen.dart';

void main() {
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
              LessonScreen.id: (context) => const LessonScreen(),
              PracticeScreen.id: (context) => const PracticeScreen(),
              PlayAlongMenuScreen.id: (context) => const PlayAlongMenuScreen(),
              SpeedrunMenuScreen.id: (context) => const SpeedrunMenuScreen(),
              QuizSelectionScreen.id: (context) => const QuizSelectionScreen(),
              AchievementsScreen.id: (context) => const AchievementsScreen(),
              SettingsScreen.id: (context) => const SettingsScreen(),
              KeyboardScreen.id: (context) => const KeyboardScreen(),
            },
          );
        },
      ),
    );
  }
}
