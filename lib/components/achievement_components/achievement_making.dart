import 'package:sight_reading_app/components/achievement_components/achievement_card.dart';

import '../../constants.dart';

/// This file reads the values from storage and makes the achievement cards which is used for both tabs

class AchievementMaker {
  List<AchievementCard> makeAchievements(achieveValues) {
    //print('these are values recieved $achieveValues');

    //2nd value passed in is how many have been completed
    List<AchievementCard> achievements = [
      AchievementCard('Complete the 1st lesson', 1, achieveValues[0]),
      AchievementCard('Complete 5 lessons', 5, achieveValues[0]),
      AchievementCard('Complete all lessons', numOfLessons, achieveValues[0]),
      AchievementCard('Complete your 1st quiz', 1, achieveValues[1]),
      AchievementCard('Complete 5 quizzes', 5, achieveValues[1]),
      AchievementCard('Complete all quizzes', numOfquizzes, achieveValues[1]),
    ];
    //print(achievements);
    return achievements;
  }
}
