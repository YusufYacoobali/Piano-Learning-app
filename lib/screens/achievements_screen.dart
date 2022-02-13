import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/achievement_components/achievements_completed.dart';
import 'package:sight_reading_app/components/achievement_components/achievements_in_progress.dart';

///  This screen is the main achievement screen which displays the different tabs

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({Key? key}) : super(key: key);

  static const String id = 'achievements_screen';

  // //DUMMY DATA
  // void _setAchievementValues() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setInt('completed_lessons', 3);
  //   prefs.setInt('completed_quizzes', 1);
  // }

  // Future<List> getAchievementValues() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   int completedLessons = (prefs.getInt('completed_lessons') ?? 0);
  //   int completedQuizzes = (prefs.getInt('completed_quizzes') ?? 0);
  //   print(completedLessons);
  //   print(completedQuizzes);
  //   return [completedLessons, completedQuizzes];
  // }

  @override
  Widget build(BuildContext context) {
    // _setAchievementValues();
    //Future<List<dynamic>> cards = getAchievementValues();

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Achivements"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'To do',
              ),
              Tab(
                text: 'Completed',
              ),
            ],
          ),
        ),
        // Tab bar which displays these two widgets
        body: const TabBarView(
            children: [AchievementsInProgress(), AchievementsCompleted()]),
      ),
    );
  }
}
