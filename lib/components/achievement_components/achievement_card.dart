import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

/// This makes the card which is shown in both tab screens
/// plan is that the card class receieves a achievement object and use the attributes to make the cards

const double cardWidth = 230;
final Color cardColour = Colors.indigo.shade400;

const double circularIndicatorRadius = 140;
const double indicatorLineWidth = 16;
const Color indicatorBackground = Colors.red;
const Color indicatorGoodProgress = Colors.green;
const Color indicatorBadProgress = Colors.orange;

const Icon playLessonIcon = Icon(
  Icons.play_lesson,
  size: 30.0,
);

class AchievementCard extends StatelessWidget {
  final String text;
  final int complete;
  final int target;
  late final bool achieved;

  //  AchievementCard(
  //     {Key? key,
  //     required this.text,
  //     required this.target,
  //     required this.complete, required this.achieved})
  //     : super(key: key);

  AchievementCard(
    this.text,
    this.target,
    this.complete,
  ) {
    achieved = (complete / target >= 1) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      width: cardWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: cardColour,
      ),
      child: Column(children: [
        Row(
          children: [
            playLessonIcon,
            const SizedBox(
              width: 20,
            ),
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
        Expanded(
          child: CircularPercentIndicator(
            radius: circularIndicatorRadius,
            lineWidth: indicatorLineWidth,
            animation: true,
            percent: (achieved == true) ? 1 : complete / target,
            center: (achieved == true)
                ? (Text('$target/$target'))
                : Text(
                    '$complete/$target',
                    style: const TextStyle(fontSize: 20),
                  ),
            animationDuration: 1200,
            circularStrokeCap: CircularStrokeCap.square,
            backgroundColor: indicatorBackground,
            progressColor: ((complete / target) > 0.5)
                ? indicatorGoodProgress
                : indicatorBadProgress,
          ),
        ),
      ]),
    );
  }
}
