import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/achievement_components/achievement_card.dart';
import 'package:sight_reading_app/components/achievement_components/achievement_making.dart';
import 'package:sight_reading_app/components/achievement_components/achievements_completed.dart';
import 'package:sight_reading_app/components/achievement_components/achievements_in_progress.dart';
import 'package:sight_reading_app/storage_reader_writer.dart';

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
  StorageReaderWriter storage = StorageReaderWriter();
  //map to
  final Map _map = {};

  // when screen is initiated it gets values from storage

  @override
  void initState() {
    super.initState();
    _setPage();
    //setPage();
  }

  //Loading values from storage on start
  void _setPage() async {
    List<int> values = await storage.loadValues();

    //state changes when values are fetched
    setState(() {
      _map.addAll(
          {'completedLessons': values[0], 'completedQuizzes': values[1]});
    });

    maker.makeLists(_map);
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
          AchievementsInProgress(cards: maker.getInProgress()),
          AchievementsCompleted(cards: maker.getAchieved())
        ]),
      ),
    );
  }
}
