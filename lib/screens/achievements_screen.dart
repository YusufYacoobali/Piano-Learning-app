import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/achievement_components/achievement_making.dart';
import 'package:sight_reading_app/components/achievement_components/achievements_completed.dart';
import 'package:sight_reading_app/components/achievement_components/achievements_in_progress.dart';

///  This screen is the main achievement screen which displays the different tabs

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({Key? key}) : super(key: key);

  static const String id = 'achievements_screen';

  @override
  Widget build(BuildContext context) {
    AchievementMaker maker = AchievementMaker();
    var values = maker.getValues();

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
        body: const TabBarView(
            children: [AchievementsInProgress(), AchievementsCompleted()]),
      ),
    );
  }
}
