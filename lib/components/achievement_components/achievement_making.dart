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

      AchievementCard('Complete 1 quiz', 1, achieveValues['completedQuizzes']),
      AchievementCard(
          'Complete 5 quizzes', 5, achieveValues['completedQuizzes']),
      AchievementCard('Complete all quizzes', numOfquizzes,
          achieveValues['completedQuizzes']),

      AchievementCard(
          'Score 5 or higher on endless (treble in beginner difficulty)',
          5,
          achieveValues['endlessTrebleBegHS']),
      AchievementCard(
          'Score 10 or higher on endless (treble in beginner difficulty)',
          10,
          achieveValues['endlessTrebleBegHS']),
      AchievementCard(
          'Score 10 or higher on endless (treble in intermediate difficulty)',
          10,
          achieveValues['endlessTrebleInterHS']),
      AchievementCard(
          'Score 15 or higher on endless (treble in intermediate difficulty)',
          15,
          achieveValues['endlessTrebleInterHS']),
      AchievementCard(
          'Score 20 or higher on endless (treble in expert difficulty)',
          20,
          achieveValues['endlessTrebleExpHS']),

      AchievementCard(
          'Score 5 or higher on endless (bass in beginner difficulty)',
          5,
          achieveValues['endlessBassBegHS']),
      AchievementCard(
          'Score 10 or higher on endless (bass in beginner difficulty)',
          10,
          achieveValues['endlessBassBegHS']),

      AchievementCard(
          'Score 10 or higher on endless (bass in intermediate difficulty)',
          10,
          achieveValues['endlessBassInterHS']),
      AchievementCard(
          'Score 15 or higher on endless (bass in intermediate difficulty)',
          15,
          achieveValues['endlessBassInterHS']),

      AchievementCard(
          'Score 20 or higher on endless (bass in expert difficulty)',
          20,
          achieveValues['endlessBassExpHS']),

      //AchievementCard('Complete Ode to Joy play along', 100, complete),
      //AchievementCard('Complete the simple bass melody play along', 100, complete),
      AchievementCard('Score 5 or higher on the 10 second speed run', 5,
          achieveValues['speedrun10HS']),
      AchievementCard('Score 10 or higher on the 20 second speed run', 10,
          achieveValues['speedrun20HS']),
      AchievementCard('Score 15 or higher on the 30 second speed run', 15,
          achieveValues['speedrun30HS']),
      AchievementCard('Score 20 or higher on the 40 second speed run', 20,
          achieveValues['speedrun40HS']),
      AchievementCard('Score 25 or higher on the 50 second speed run', 25,
          achieveValues['speedrun50HS']),
      AchievementCard('Score 30 or higher on the 60 second speed run', 30,
          achieveValues['speedrun60HS']),
    ];
    //print(achievements);
    return achievements;
  }
}
