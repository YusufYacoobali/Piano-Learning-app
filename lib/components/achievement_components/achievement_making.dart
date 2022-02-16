import 'package:sight_reading_app/components/achievement_components/achievement_card.dart';

/// This file reads the values from storage and makes the achievement cards which is used for both tabs

class AchievementMaker {
  int numOfLessons = 10;
  int numOfquizzes = 10;

  //List<int> achieveValues = [];

  //DUMMY DATA
  // void setAchievementValues() async {
  //   print('Start');
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setInt('completed_lessons', 3);
  //   prefs.setInt('completed_quizzes', 1);
  // }

  // void getAchievementValues() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   int completedLessons = (prefs.getInt('completed_lessons') ?? 0);
  //   int completedQuizzes = (prefs.getInt('completed_quizzes') ?? 0);
  //   print(completedLessons);
  //   print(completedQuizzes);
  //   achieveValues.addAll([completedLessons, completedQuizzes]);
  // }

  // getValues() async {
  //   setAchievementValues();
  //   getAchievementValues();
  //   //Future<List<int>> values = getAchievementValues();
  //   var list = values.then((value) {
  //     print('$value are values recieved');
  //     return value;
  //   });
  //   return makeAchievements();
  // }

  // Widget makeAchievements() {
  //   return FutureBuilder(
  //     future: getValues(),
  //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
  //       print(snapshot.data[0]);
  //       return Text(snapshot.data[0]);
  //       // return AchievementCard(
  //       //     text: snapshot.data,
  //       //     target: snapshot.data,
  //       //     complete: snapshot.data);
  //     },
  //   );
  // }
  // void initialise() {
  //   //setAchievementValues();
  //   getAchievementValues();
  // }

  List<AchievementCard> makeAchievements(achieveValues) {
    //print('these are values recieved $achieveValues');

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
