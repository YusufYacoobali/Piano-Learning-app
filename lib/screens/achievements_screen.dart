import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/achievements_completed.dart';
import 'package:sight_reading_app/components/achievements_in_progress.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({Key? key}) : super(key: key);

  static const String id = 'achievements_screen';

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
        body: const TabBarView(
            children: [AchievementsInProgress(), AchievementsCompleted()]),
      ),
    );
  }
}
