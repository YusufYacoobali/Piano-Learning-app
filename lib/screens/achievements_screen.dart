import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/components/achievement_components/achievement_card.dart';
import 'package:sight_reading_app/components/achievement_components/achievement_making.dart';
import 'package:sight_reading_app/components/achievement_components/achievements_completed.dart';
import 'package:sight_reading_app/components/achievement_components/achievements_in_progress.dart';
import 'package:sight_reading_app/model/achievement.dart';

///  This screen is the main achievement screen which displays the different tabs

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({Key? key}) : super(key: key);

  static const String id = 'achievements_screen';

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  AchievementMaker maker = AchievementMaker();
  List achieveValues = [];
  List<AchievementCard> achieved = [];
  List<AchievementCard> inProgress = [];

  // @override
  // void initState() {
  //   super.initState();
  //   maker.initialise();
  // }

  @override
  void initState() {
    super.initState();
    _loadValues();
  }

  //Loading counter value on start
  void _loadValues() async {
    final prefs = await SharedPreferences.getInstance();
    int completedLessons = (prefs.getInt('completed_lessons') ?? 0);
    int completedQuizzes = (prefs.getInt('completed_quizzes') ?? 0);
    print(completedLessons);
    print(completedQuizzes);

    setState(() {
      achieveValues.addAll([completedLessons, completedQuizzes]);
    });

    print(achieveValues);
    List<AchievementCard>? achieveObjects =
        maker.makeAchievements(achieveValues);
    print(achieveObjects);

    if (achieveObjects != null) {
      for (AchievementCard card in achieveObjects) {
        if (card.complete >= card.target) {
          achieved.add(card);
        } else {
          inProgress.add(card);
        }
      }
    }

    print(achieved);
    print(inProgress);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Achivements"),
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
        // Tab bar which displays these two widgets
        body: TabBarView(children: [
          AchievementsInProgress(cards: inProgress),
          AchievementsCompleted(cards: achieved)
        ]),
      ),
    );
  }
}
