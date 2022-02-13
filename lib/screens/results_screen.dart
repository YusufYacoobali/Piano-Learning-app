import 'package:flutter/material.dart';

import 'keyboard_screen.dart';

class _ResultsScreenState extends State<ResultsScreen> {
  late String title;
  late int score;

  @override
  void initState() {
    super.initState();
    title = widget.title;
    score = widget.score;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget getTitleWidget() {
    return FittedBox(
      fit: BoxFit.contain,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50.0,
        ),
      ),
    );
  }

  Widget getScoreWidget() {
    return FittedBox(
      fit: BoxFit.contain,
      child: Text(
        'You got $score questions correct.',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w200,
          fontSize: 40.0,
        ),
      ),
    );
  }

  Widget getEmptyExpanded() {
    return Expanded(
      flex: 1,
      child: Container(),
    );
  }

  Widget getIconWidget() {
    // TODO: Make icon scale with screen size
    return Icon(
      getIcon(),
      color: Colors.yellow,
      size: 150.0,
    );
  }

  IconData getIcon() {
    if (score == 0) {
      return Icons.cancel;
    } else {
      return Icons.check_circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.lightGreen.shade500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getTitleWidget(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    getEmptyExpanded(),
                    Expanded(
                      flex: 1,
                      child: getIconWidget(),
                    ),
                    getEmptyExpanded(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    getEmptyExpanded(),
                    Expanded(
                      flex: 2,
                      child: getScoreWidget(),
                    ),
                    getEmptyExpanded(),
                  ],
                ),
              ),
              // TODO: Remove ElevatedButton once KeyboardScreen properly linked up
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, KeyboardScreen.id);
                },
                child: const Text('TEMPORARY: Go to keyboard screen'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ResultsScreen extends StatefulWidget {
  static const String id = 'results_screen';
  final String title;
  final int score;

  const ResultsScreen({Key? key, required this.title, required this.score})
      : super(key: key);

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}
