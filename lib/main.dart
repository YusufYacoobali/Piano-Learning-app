import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sight_reading_app/components/question_skeleton.dart';
import 'package:sight_reading_app/screens/achievements_screen.dart';
import 'package:sight_reading_app/screens/lesson_screen.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';
import 'package:sight_reading_app/screens/practice_screen.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import 'package:sight_reading_app/screens/settings_screen.dart';

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
    return MaterialApp(
      title: 'SightReadingApp',
      theme: ThemeData.dark(),
      initialRoute: MenuScreen.id,
      routes: {
        MenuScreen.id: (context) => const MenuScreen(),
        LessonScreen.id: (context) => const LessonScreen(),
        PracticeScreen.id: (context) => const PracticeScreen(),
        AchievementsScreen.id: (context) => const AchievementsScreen(),
        SettingsScreen.id: (context) => const SettingsScreen(),
        // Temporary route to QuestionSkeleton
        QuestionSkeleton.id: (context) => const QuestionSkeleton(),
        // Temporary route to ResultsScreen
        ResultsScreen.id: (context) => const ResultsScreen(
              title: 'Congratulations!',
              score: 5,
            ),
      },
    );
  }
}
