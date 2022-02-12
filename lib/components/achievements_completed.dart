import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/achievement_card.dart';

class AchievementsCompleted extends StatelessWidget {
  const AchievementsCompleted({Key? key}) : super(key: key);

  static const List<List> inProgressText = [
    ['Open the app once', 1, 1],
    ['Go to achievements screen 5 times', 5, 5],
    ['realllllllyyy lllooooooooooonggg     achievement dweidjeudh32udh', 1, 1],
    ['Complete 5 quizzes', 5, 5],
    ['blah blaj', 5, 5],
    ['blahhhh', 5, 5],
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var item in inProgressText)
            AchievementCard(
              text: item[0],
              complete: item[1],
              target: item[2],
            )
        ],
      ),
    );
  }
}
