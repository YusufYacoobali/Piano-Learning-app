import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/achievement_components/achievement_card.dart';

import '../../constants.dart';

/// Achievements in progress is the default tab which is shown
/// (plan is to recieve the correct achievement cards in a list and simply display them)
/// currently it makes the cards and displays them

class AchievementsInProgress extends StatelessWidget {
  final List<AchievementCard> cards;

  const AchievementsInProgress({Key? key, required this.cards})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (cards.isEmpty)
        ? const Center(
            child: Text(
              "All achievements have been completed, Nice!",
              textAlign: TextAlign.center,
              style: achievementTextStyle,
            ),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [for (AchievementCard card in cards) card],
            ),
          );
  }
}
