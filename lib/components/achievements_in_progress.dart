import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

//final Color cardColor = Colors.indigo.shade400;

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
            InProgressCard(
              text: item[0],
              complete: item[1],
              target: item[2],
            )
        ],
      ),
    );
  }
}

class InProgressCard extends StatelessWidget {
  final String text;
  final int complete;
  final int target;

  const InProgressCard(
      {Key? key,
      required this.text,
      required this.target,
      required this.complete})
      : super(key: key);

  static const double cardWidth = 230;
  static const cardColour = Colors.indigo;

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
            const Icon(
              Icons.play_lesson,
              size: 30,
            ),
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
            radius: 140,
            lineWidth: 16,
            animation: true,
            percent: complete / target,
            center: Text(
              '$complete/$target',
              style: const TextStyle(fontSize: 20),
            ),
            animationDuration: 1200,
            circularStrokeCap: CircularStrokeCap.square,
            backgroundColor: Colors.red,
            progressColor:
                ((complete / target) > 0.5) ? Colors.green : Colors.orange,
          ),
        ),
      ]),
    );
  }
}
