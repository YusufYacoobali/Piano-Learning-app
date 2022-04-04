import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/achievement_components/achievement_card.dart';
import '../../constants.dart';

/// Achievements completed is the second tab which is shown
/// Simply displays the cards which were given to it

class AchievementsCompleted extends StatelessWidget {
  final List<AchievementCard> cards;
  const AchievementsCompleted({Key? key, required this.cards})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (cards.isEmpty)
        ? const Center(
            child: Text(
              "No achievements have been completed yet",
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
