import 'package:flutter/material.dart';

class AchievementsInProgress extends StatelessWidget {
  static const List<List<String>> inProgressText = [
    ['Complete the 1st lesson', '0/1'],
    ['Complete 5 lessons', '0/5'],
    ['Complete the 1st quiz', '0/1'],
    ['Complete 5 quizzes', '0/5'],
    ['blah blaj', '0/1'],
    ['blahhhh', '0/5'],
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
              target: item[1],
            )
        ],
      ),
    );
  }
}

class InProgressCard extends StatelessWidget {
  final String text;
  final String target;
  const InProgressCard({Key? key, required this.text, required this.target})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      width: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade800,
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
          height: 50,
        ),
        Text(
          target,
          style: const TextStyle(fontSize: 30),
        )
      ]),
    );
  }
}
