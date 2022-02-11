import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
            CompletedCard(
              text: item[0],
              complete: item[1],
              target: item[2],
            )
        ],
      ),
    );
  }
}

class CompletedCard extends StatelessWidget {
  final String text;
  final int complete;
  final int target;

  const CompletedCard(
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
        Expanded(
          child: CircularPercentIndicator(
            radius: 140,
            lineWidth: 16,
            animation: true,
            percent: 1,
            center:
                Text('$complete/$target', style: const TextStyle(fontSize: 20)),
            animationDuration: 1200,
            circularStrokeCap: CircularStrokeCap.square,
            backgroundColor: Colors.red,
            progressColor: Colors.green,
          ),
        ),
      ]),
    );
  }
}
