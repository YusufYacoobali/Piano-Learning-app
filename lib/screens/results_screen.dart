import 'package:flutter/material.dart';

import '../constants.dart';

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget getTitleWidget() {
    return Expanded(
      flex: 1,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: titleWidgetTextStyle,
          ),
        ),
      ),
    );
  }

  Widget getScoreWidget() {
    return Expanded(
      flex: 1,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'You got ${getPercentage()}%',
            textAlign: TextAlign.center,
            style: scoreWidgetTextStyle,
          ),
        ),
      ),
    );
  }

  String getPercentage() {
    double unroundedPercentage = widget.score * 100;
    return unroundedPercentage.toStringAsFixed(1);
  }

  Widget getIconWidget() {
    return Expanded(
      flex: 2,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Icon(
          getIcon(),
          color: Colors.yellow,
          size: 150.0,
        ),
      ),
    );
  }

  IconData getIcon() {
    if (widget.score < failThreshold) {
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
              getIconWidget(),
              getScoreWidget(),
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
  final double score;

  const ResultsScreen({Key? key, required this.title, required this.score})
      : super(key: key);

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}
