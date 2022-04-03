import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/review_answers_screen.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';
import '../constants.dart';
import '../lessons_and_quizzes/question_brain.dart';

/// Screen displaying the user's results
class ResultsScreen extends StatefulWidget {
  static const String id = 'results_screen';
  final String title;
  final double score;
  final QuestionBrain questionBrain;

  const ResultsScreen(
      {Key? key,
      required this.title,
      required this.score,
      required this.questionBrain})
      : super(key: key);

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Gets the widget displaying the title
  Widget _getTitleWidget() {
    return Expanded(
      flex: 1,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: titleWidgetTextStyle,
          ),
        ),
      ),
    );
  }

  /// Gets the widget displaying the user's score
  Widget _getScoreWidget() {
    return Expanded(
      flex: 1,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: Text(
            'You got ${_getPercentage()}',
            textAlign: TextAlign.center,
            style: scoreWidgetTextStyle,
          ),
        ),
      ),
    );
  }

  /// Formats and returns the percentage
  String _getPercentage() {
    double unroundedPercentage = widget.score * 100;
    return '${unroundedPercentage.toStringAsFixed(0)}%';
  }

  /// Gets the widget displaying the icon in the centre of the screen
  Widget _getIconWidget() {
    return Expanded(
      flex: 2,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Icon(
          _getIcon(),
          size: 150.0,
        ),
      ),
    );
  }

  /// Gets the correct icon depending on the user's score
  IconData _getIcon() {
    if (widget.score < passThreshold) {
      return Icons.cancel;
    } else {
      return Icons.check_circle;
    }
  }

  /// Gets the "Exit" button displayed at the bottom of the screen
  Widget _getExitButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.popUntil(context, ModalRoute.withName(MenuScreen.id));
      },
      style: navButtonDeco,
      child: const Text('Exit'),
    );
  }

  /// Gets the "Review Answers" button displayed at the bottom of the screen
  Widget _getReviewAnswersButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ReviewAnswersScreen(questionBrain: widget.questionBrain);
          }),
        );
      },
      child: const Text('Review Answers'),
      style: navButtonDeco,
    );
  }

  /// Gets the buttons at the bottom of the screen
  Widget _getNavigationButtons() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _getExitButton(),
            _getReviewAnswersButton(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff5f0a87), Color(0xffa4508b)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _getTitleWidget(),
            _getIconWidget(),
            _getScoreWidget(),
            _getNavigationButtons(),
          ],
        ),
      ),
    );
  }
}
