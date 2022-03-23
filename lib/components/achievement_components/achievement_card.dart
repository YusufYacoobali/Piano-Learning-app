import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../constants.dart';

///The design for an achievement card

class AchievementCard extends StatelessWidget {
  final String text;
  final int complete;
  final int target;
  late final bool achieved;

  AchievementCard(this.text, this.target, this.complete, {Key? key})
      : super(key: key) {
    achieved = (complete / target >= 1) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.fromLTRB(20, 15, 15, 10),
      width: cardWidth,
      decoration: achievementCardDecoration,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // playLessonIcon,
            // const SizedBox(
            //   width: 10,
            // ),
            Flexible(
              child: Text(
                text,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        //Using an external library to make it look more appealing
        Expanded(
          child: CircularPercentIndicator(
            radius: circularIndicatorRadius,
            lineWidth: indicatorLineWidth,
            animation: true,
            percent: (achieved == true) ? 1 : complete / target,
            center: (achieved == true)
                ? (Text(
                    '$target/$target',
                    style: achievementTextStyle,
                  ))
                : Text(
                    '$complete/$target',
                    style: achievementTextStyle,
                  ),
            animationDuration: animationDuration,
            circularStrokeCap: CircularStrokeCap.square,
            backgroundColor: indicatorBackground,
            //Colour of progress bar changes depending of how much is completed
            progressColor: ((complete / target) > 0.5)
                ? indicatorGoodProgress
                : indicatorBadProgress,
          ),
        ),
      ]),
    );
  }
}
