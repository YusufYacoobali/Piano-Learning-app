import 'package:sight_reading_app/components/achievement_components/achievement_card.dart';
import '../../constants.dart';

/// This file reads the values from storage and makes the achievement cards which is used for both tabs

class AchievementMaker {
  final List<AchievementCard> _achieved = [];
  final List<AchievementCard> _inProgress = [];

  void makeLists(allValues) {
    List<AchievementCard> achieveObjects = _makeAchievements(allValues);

    //deciding where each card will go
    if (achieveObjects.isNotEmpty) {
      for (AchievementCard card in achieveObjects) {
        if (card.complete >= card.target) {
          _achieved.add(card);
        } else {
          _inProgress.add(card);
        }
      }
    }
  }

  List<AchievementCard> getAchieved() {
    return _achieved;
  }

  List<AchievementCard> getInProgress() {
    return _inProgress;
  }

  List<AchievementCard> _makeAchievements(achieveValues) {
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
      AchievementCard('Complete all quizzes', numOfQuizzes,
          achieveValues['completedQuizzes']),

      //endless achievements
      AchievementCard(
          'Score 10 or higher on endless (treble in beginner difficulty)',
          10,
          achieveValues['endless-treble-beginner-high-score']),
      AchievementCard(
          'Score 20 or higher on endless (treble in intermediate difficulty)',
          20,
          achieveValues['endless-treble-intermediate-high-score']),
      AchievementCard(
          'Score 30 or higher on endless (treble in expert difficulty)',
          30,
          achieveValues['endless-treble-expert-high-score']),

      AchievementCard(
          'Score 10 or higher on endless (bass in beginner difficulty)',
          10,
          achieveValues['endless-bass-beginner-high-score']),

      AchievementCard(
          'Score 20 or higher on endless (bass in intermediate difficulty)',
          20,
          achieveValues['endless-bass-intermediate-high-score']),

      AchievementCard(
          'Score 30 or higher on endless (bass in expert difficulty)',
          30,
          achieveValues['endless-bass-expert-high-score']),

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
          achieveValues['ode to joy-beginner-high-score']),
      AchievementCard('Complete Ode to Joy play along in intermediate', 100,
          achieveValues['ode to joy-intermediate-high-score']),
      AchievementCard('Complete Ode to Joy play along in expert', 100,
          achieveValues['ode to joy-expert-high-score']),

      AchievementCard('Complete Simple bass melody play along in beginner', 100,
          achieveValues['a simple bass melody-beginner-high-score']),
      AchievementCard('Complete Simple bass melody play along in intermediate',
          100, achieveValues['a simple bass melody-intermediate-high-score']),
      AchievementCard('Complete Simple bass melody play along in expert', 100,
          achieveValues['a simple bass melody-expert-high-score']),

      AchievementCard('Complete Old Macdonald play along in beginner', 100,
          achieveValues['old macdonald-beginner-high-score']),
      AchievementCard('Complete Old Macdonald play along in intermediate', 100,
          achieveValues['old macdonald-intermediate-high-score']),
      AchievementCard('Complete Old Macdonald play along in expert', 100,
          achieveValues['old macdonald-expert-high-score']),

      AchievementCard('Complete Faded - Alan Walker play along in beginner',
          100, achieveValues['faded - alan walker-beginner-high-score']),
      AchievementCard('Complete Faded - Alan Walker play along in intermediate',
          100, achieveValues['faded - alan walker-intermediate-high-score']),
      AchievementCard('Complete Faded - Alan Walker play along in expert', 100,
          achieveValues['faded - alan walker-expert-high-score']),

      AchievementCard('Complete Swaying Melody play along in beginner', 100,
          achieveValues['swaying melody-beginner-high-score']),
      AchievementCard('Complete Swaying Melody play along in intermediate', 100,
          achieveValues['swaying melody-intermediate-high-score']),
      AchievementCard('Complete Swaying Melody play along in expert', 100,
          achieveValues['swaying melody-expert-high-score']),
    ];
    return achievements;
  }
}
