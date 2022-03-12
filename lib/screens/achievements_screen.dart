import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/components/achievement_components/achievement_card.dart';
import 'package:sight_reading_app/components/achievement_components/achievement_making.dart';
import 'package:sight_reading_app/components/achievement_components/achievements_completed.dart';
import 'package:sight_reading_app/components/achievement_components/achievements_in_progress.dart';

///  This screen is the main achievement screen which displays the different tabs

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({Key? key}) : super(key: key);

  static const String id = 'achievements_screen';

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  //maker which will make all achievement cards
  AchievementMaker maker = AchievementMaker();
  //lists to seperate which cards go to which tabs
  List achieveValues = [];
  List<AchievementCard> achieved = [];
  List<AchievementCard> inProgress = [];

  // when screen is initiated it gets values from storage
  @override
  void initState() {
    super.initState();
    _loadValues();
  }

  //Loading values from storage on start
  void _loadValues() async {
    final prefs = await SharedPreferences.getInstance();
    int completedLessons = (prefs.getInt('completed_lessons') ?? 0);
    int completedQuizzes = (prefs.getInt('completed_quizzes') ?? 0);
    //print(completedLessons);
    //print(completedQuizzes);

    //state changes when values are fetched
    setState(() {
      achieveValues.addAll([completedLessons, completedQuizzes]);
    });

    makeLists(achieveValues);
  }

  //lists of achievement cards are made for each tab
  void makeLists(allValues) {
    //print(achieveValues);
    List<AchievementCard> achieveObjects =
        maker.makeAchievements(achieveValues);
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Achievements"),
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
        // Tab bar which displays these two widgets, each tab bar recieves its corresponding achievements
        body: TabBarView(children: [
          AchievementsInProgress(cards: inProgress),
          AchievementsCompleted(cards: achieved)
        ]),
      ),
    );
  }
}
