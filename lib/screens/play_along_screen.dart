import 'package:flutter/material.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import '../components/question_skeleton.dart';
import 'package:sight_reading_app/question_brain.dart';

/// The screen that runs the "play along" practice mode with a given track.
///
/// The track is selected by the user, then passed in to this screen.
class _PlayAlongScreenState extends State<PlayAlongScreen> {
  /// The template used to show questions on the screen
  late QuestionBrain questionBrain;
  /// The main widget of the screen
  late Widget screenWidget;

  @override
  void initState() {
    super.initState();
    //questionBrain = QuestionBrain(questionList: lessonOneQuestions);
    //setScreenWidget();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

class PlayAlongScreen extends StatefulWidget {
  static const String id = 'play_along_screen';

  const PlayAlongScreen({Key? key}) : super(key: key);

  @override
  _PlayAlongScreenState createState() => _PlayAlongScreenState();
}