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
    //lesson achievements
    List<AchievementCard> achievements = [
      AchievementCard(
          'Complete 1 lesson', 1, achieveValues['completedLessons']),
      AchievementCard(
          'Complete 5 lessons', 5, achieveValues['completedLessons']),
      AchievementCard('Complete all lessons', numOfLessons,
          achieveValues['completedLessons']),

      //quiz achievements
      AchievementCard('Complete 1 quiz', 1, achieveValues['completedQuizzes']),
      AchievementCard(
          'Complete 5 quizzes', 5, achieveValues['completedQuizzes']),
      AchievementCard('Complete all quizzes', numOfquizzes,
          achieveValues['completedQuizzes']),

      //endless achievements
      AchievementCard(
          'Score 10 or higher on endless (treble in beginner difficulty)',
          10,
          achieveValues['endlessTrebleBegHS']),
      AchievementCard(
          'Score 20 or higher on endless (treble in intermediate difficulty)',
          20,
          achieveValues['endlessTrebleInterHS']),
      AchievementCard(
          'Score 30 or higher on endless (treble in expert difficulty)',
          30,
          achieveValues['endlessTrebleExpHS']),

      AchievementCard(
          'Score 10 or higher on endless (bass in beginner difficulty)',
          10,
          achieveValues['endlessBassBegHS']),

      AchievementCard(
          'Score 20 or higher on endless (bass in intermediate difficulty)',
          20,
          achieveValues['endlessBassInterHS']),

      AchievementCard(
          'Score 30 or higher on endless (bass in expert difficulty)',
          30,
          achieveValues['endlessBassExpHS']),

      //speedrun achievements
      AchievementCard('Score 5 or higher on the 10 second speedrun', 5,
          achieveValues['speedrun10HS']),
      AchievementCard('Score 10 or higher on the 20 second speedrun', 10,
          achieveValues['speedrun20HS']),
      AchievementCard('Score 15 or higher on the 30 second speedrun', 15,
          achieveValues['speedrun30HS']),
      AchievementCard('Score 20 or higher on the 40 second speedrun', 20,
          achieveValues['speedrun40HS']),
      AchievementCard('Score 25 or higher on the 50 second speedrun', 25,
          achieveValues['speedrun50HS']),
      AchievementCard('Score 30 or higher on the 60 second speedrun', 30,
          achieveValues['speedrun60HS']),

      //play along achievements
      AchievementCard('Complete Ode to Joy play along in beginner', 100,
          achieveValues['playAlongOdeBeg']),
      AchievementCard('Complete Ode to Joy play along in intermediate', 100,
          achieveValues['playAlongOdeInter']),
      AchievementCard('Complete Ode to Joy play along in expert', 100,
          achieveValues['playAlongOdeExp']),
      AchievementCard('Complete Simple bass melody play along in beginner', 100,
          achieveValues['playAlongSimpBeg']),
      AchievementCard('Complete Simple bass melody play along in intermediate',
          100, achieveValues['playAlongSimpInter']),
      AchievementCard('Complete Simple bass melody play along in expert', 100,
          achieveValues['playAlongSimpExp']),
      AchievementCard('Complete Old Macdonald play along in beginner', 100,
          achieveValues['playAlongMcBeg']),
      AchievementCard('Complete Old Macdonald play along in intermediate', 100,
          achieveValues['playAlongMcInter']),
      AchievementCard('Complete Old Macdonald play along in expert', 100,
          achieveValues['playAlongMcExp']),
      AchievementCard('Complete Fade - Alan Walker play along in beginner', 100,
          achieveValues['playAlongFadeBeg']),
      AchievementCard('Complete Fade - Alan Walker play along in intermediate',
          100, achieveValues['playAlongFadeInter']),
      AchievementCard('Complete Fade - Alan Walker play along in expert', 100,
          achieveValues['playAlongFadeExp']),
      AchievementCard('Complete Swaying Melody play along in beginner', 100,
          achieveValues['playAlongSwayBeg']),
      AchievementCard('Complete Swaying Melody play along in intermediate', 100,
          achieveValues['playAlongSwayInter']),
      AchievementCard('Complete Swaying Melody play along in expert', 100,
          achieveValues['playAlongSwayExp']),
    ];
    return achievements;
  }
}
