import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/achievement_components/achievement_card.dart';

/// Achievements completed is the second tab which is shown
/// (plan is to recieve the correct achievement cards in a list and simply display them)
/// currently it makes the cards and displays them

class AchievementsCompleted extends StatelessWidget {
  final List<AchievementCard> cards;
  const AchievementsCompleted({Key? key, required this.cards})
      : super(key: key);

  // static const List<List> inProgressText = [
  //   ['Open the app once', 1, 1],
  //   ['Go to achievements screen 5 times', 5, 5],
  //   ['realllllllyyy lllooooooooooonggg     achievement dweidjeudh32udh', 1, 1],
  //   ['Complete 5 quizzes', 5, 5],
  //   ['blah blaj', 5, 5],
  //   ['blahhhh', 5, 5],
  // ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // for (var item in inProgressText)
          //   AchievementCard(
          //     text: item[0],
          //     complete: item[1],
          //     target: item[2],
          //   )
          for (AchievementCard card in cards) card
        ],
      ),
    );
  }
}
