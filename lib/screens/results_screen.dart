import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';

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
          padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
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
    if (widget.score < passThreshold) {
      return Icons.cancel;
    } else {
      return Icons.check_circle;
    }
  }

  Widget getNavigationButtons() {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName(MenuScreen.id));
            },
            child: const Text('Exit'),
          ),
          ElevatedButton(
            // TODO: Implement review answers functionality
            onPressed: () {},
            child: const Text('Review Answers'),
          ),
        ],
      ),
    );
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
              getNavigationButtons(),
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
