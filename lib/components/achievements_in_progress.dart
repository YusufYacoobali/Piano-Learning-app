import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/achievement_card.dart';

const double cardWidth = 230;
final Color cardColour = Colors.indigo.shade400;

class AchievementsInProgress extends StatelessWidget {
  static const List<List> inProgressText = [
    ['Complete the 1st lesson', 0, 1],
    ['Complete 5 lessons', 2, 5],
    ['Complete the 1st quiz', 0, 1],
    ['Complete 5 quizzes', 3, 5],
    ['blah blaj', 0, 1],
    ['blahhhh', 0, 5],
  ];

  const AchievementsInProgress({Key? key}) : super(key: key);

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
