import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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

  const AchievementCard(
      {Key? key,
      required this.text,
      required this.target,
      required this.complete})
      : super(key: key);

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
            percent: complete / target,
            center: Text(
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
