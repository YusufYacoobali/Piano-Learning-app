import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/model/achievement.dart';

/// This file reads the values from storage and makes the achievement cards which is used for both tabs

class AchievementMaker {
  //DUMMY DATA
  void _setAchievementValues() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('completed_lessons', 3);
    prefs.setInt('completed_quizzes', 1);
  }

  Future<List> getAchievementValues() async {
    final prefs = await SharedPreferences.getInstance();
    int completedLessons = (prefs.getInt('completed_lessons') ?? 0);
    int completedQuizzes = (prefs.getInt('completed_quizzes') ?? 0);
    print(completedLessons);
    print(completedQuizzes);
    return [completedLessons, completedQuizzes];
  }

  //not sure how to do this stuff
  var values = getAchievementValues();

  List<Achievement> achievements = [
    Achievement('Complete the 1st lesson', values[0], 1)
  ];
}
