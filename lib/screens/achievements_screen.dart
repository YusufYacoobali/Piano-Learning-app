import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/components/achievements_completed.dart';
import 'package:sight_reading_app/components/achievements_in_progress.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({Key? key}) : super(key: key);

  static const String id = 'achievements_screen';

  //DUMMY DATA
  void _setAchievementValues() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('completed_lessons', 3);
    prefs.setInt('completed_quizzes', 1);
  }

  Future<List> _getAchievementValues() async {
    final prefs = await SharedPreferences.getInstance();
    int completedLessons = (prefs.getInt('completed_lessons') ?? 0);
    int completedQuizzes = (prefs.getInt('completed_quizzes') ?? 0);
    print(completedLessons);
    print(completedQuizzes);
    return [completedLessons, completedQuizzes];
  }

  //Future<List> achievements = _getAchievementValues();

  @override
  Widget build(BuildContext context) {
    _setAchievementValues();
    _getAchievementValues();

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
        body: const TabBarView(
            children: [AchievementsInProgress(), AchievementsCompleted()]),
      ),
    );
  }
}
