import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/lesson_screen.dart';
import 'package:sight_reading_app/screens/results_screen.dart';

class SpeedrunScreen extends StatefulWidget {
  final int timerDuration;

  const SpeedrunScreen({Key? key, required this.timerDuration})
      : super(key: key);

  static const String id = 'speedrun_screen';

  @override
  State<SpeedrunScreen> createState() => _SpeedrunScreenState();
}

class _SpeedrunScreenState extends State<SpeedrunScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          const LessonScreen(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
            child: Align(
              alignment: Alignment.topRight,
              child: CircularCountDownTimer(
                width: 60,
                height: 60,
                duration: widget.timerDuration,
                backgroundColor: Colors.purple[500],
                fillColor: Colors.red,
                ringColor: Colors.grey,
                strokeWidth: 20.0,
                strokeCap: StrokeCap.round,
                textStyle: const TextStyle(
                    fontSize: 33.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                isTimerTextShown: true,
                autoStart: true,
                onStart: () {
                  //print('Countdown Started');
                },
                onComplete: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultsScreen(
                          score: 5, title: 'Congratulations!'),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
