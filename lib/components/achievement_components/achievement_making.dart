import 'package:sight_reading_app/components/achievement_components/achievement_card.dart';
//import 'package:sight_reading_app/storage_reader_writer.dart';

import '../../constants.dart';

/// This file reads the values from storage and makes the achievement cards which is used for both tabs

class AchievementMaker {
  //StorageReaderWriter storage = StorageReaderWriter();

  List<AchievementCard> achieved = [];
  List<AchievementCard> inProgress = [];

  void makeLists(allValues) {
    //print(achieveValues);
    List<AchievementCard> achieveObjects = makeAchievements(allValues);
    //print(achieveObjects);

    //deciding where each card will go
    if (achieveObjects.isNotEmpty) {
      for (AchievementCard card in achieveObjects) {
        if (card.complete >= card.target) {
          achieved.add(card);
        } else {
          inProgress.add(card);
        }
      }
    }
  }

  List<AchievementCard> getAchieved() {
    return achieved;
  }

  List<AchievementCard> getInProgress() {
    return inProgress;
  }

  List<AchievementCard> makeAchievements(achieveValues) {
    //print('these are values recieved $achieveValues');

    //2nd value passed in is how many have been completed
    List<AchievementCard> achievements = [
      AchievementCard(
          'Complete 1 lesson', 1, achieveValues['completedLessons']),
      AchievementCard(
          'Complete 5 lessons', 5, achieveValues['completedLessons']),
      AchievementCard('Complete all lessons', numOfLessons,
          achieveValues['completedLessons']),
      AchievementCard(
          'Complete your 1st quiz', 1, achieveValues['completedQuizzes']),
      AchievementCard(
          'Complete 5 quizzes', 5, achieveValues['completedQuizzes']),
      AchievementCard('Complete all quizzes', numOfquizzes,
          achieveValues['completedQuizzes']),
      AchievementCard('Get a score 0f 10 on endless mode with treble', 10,
          achieveValues['endless-treble-high-score']),
      AchievementCard('Get a score 0f 30 on endless mode with treble', 30,
          achieveValues['endless-treble-high-score']),
      AchievementCard('Get a score 0f 50 on endless mode with treble', 50,
          achieveValues['endless-treble-high-score']),
      AchievementCard('Get a score 0f 10 on endless mode with bass', 10,
          achieveValues['endless-bass-high-score']),
      AchievementCard('Get a score 0f 30 on endless mode with bass', 30,
          achieveValues['endless-bass-high-score']),
      AchievementCard('Get a score 0f 50 on endless mode with bass', 50,
          achieveValues['endless-bass-high-score']),
      //AchievementCard('Complete Ode to Joy play along', 100, complete),
      //AchievementCard('Complete the simple bass melody play along', 100, complete),
      //AchievementCard('Pass the 10 second speed run', 10, complete),
      //AchievementCard('Pass the 20 second speed run', 10, complete),
      //AchievementCard('Pass the 30 second speed run', 10, complete),
      //AchievementCard('Pass the 40 second speed run', 10, complete),
      //AchievementCard('Pass the 50 second speed run', 10, complete),
      //AchievementCard('Pass the 60 second speed run', 10, complete),
    ];
    //print(achievements);
    return achievements;
  }
}
