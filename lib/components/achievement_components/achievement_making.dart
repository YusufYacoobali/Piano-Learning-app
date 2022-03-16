import 'package:sight_reading_app/components/achievement_components/achievement_card.dart';
import 'package:sight_reading_app/storage_reader_writer.dart';

import '../../constants.dart';

/// This file reads the values from storage and makes the achievement cards which is used for both tabs

class AchievementMaker {
  StorageReaderWriter storage = StorageReaderWriter();
  final Map _map = {};

  List<AchievementCard> achieved = [];
  List<AchievementCard> inProgress = [];

  void makeLists() async {
    print('waiiting for values');
    List achieveValues = await storage.loadValues();
    print('got values');
    //print(achieveValues);
    List<AchievementCard> achieveObjects = makeAchievements(achieveValues);
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
      print('seperated achievements');
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
          'Complete the 1st lesson', 1, achieveValues['completedLessons']),
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
    ];
    //print(achievements);
    return achievements;
  }
}
