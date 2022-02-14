import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/components/achievement_components/achievement_card.dart';
import 'package:sight_reading_app/model/achievement.dart';

/// This file reads the values from storage and makes the achievement cards which is used for both tabs

class AchievementMaker {
  //DUMMY DATA
  void setAchievementValues() async {
    print('Start');
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('completed_lessons', 3);
    prefs.setInt('completed_quizzes', 1);
  }

  Future<List<int>> getAchievementValues() async {
    final prefs = await SharedPreferences.getInstance();
    int completedLessons = (prefs.getInt('completed_lessons') ?? 0);
    int completedQuizzes = (prefs.getInt('completed_quizzes') ?? 0);
    print(completedLessons);
    print(completedQuizzes);
    return [completedLessons, completedQuizzes];
  }

  getValues() async {
    setAchievementValues();
    Future<List<int>> values = getAchievementValues();
    var list = values.then((value) {
      print('$value are values recieved');
      return value;
    });
    return makeAchievements(list);
  }

  List<Achievement> makeAchievements(values) {
    print('these are values recieved $values');

    List<Achievement> achievements = [
      Achievement('Complete the 1st lesson', values[0], 1)

      //just make it directly into cards
    ];
    print(achievements);
    return achievements;
  }
}
