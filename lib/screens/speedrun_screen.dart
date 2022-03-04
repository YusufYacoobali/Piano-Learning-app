import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import '../components/option_button.dart';
import '../components/question_skeleton.dart';
import '../lessons_and_quizzes/lesson_one.dart';
import '../question_brain.dart';

// TODO: Need to have enough questions so that we don't run out before the timer finishes
class SpeedrunScreen extends StatefulWidget {
  final int timerDuration;

  const SpeedrunScreen({
    Key? key,
    required this.timerDuration,
  }) : super(key: key);

  static const String id = 'speedrun_screen';

  @override
  State<SpeedrunScreen> createState() => _SpeedrunScreenState();
}

class _SpeedrunScreenState extends State<SpeedrunScreen> {
  late QuestionBrain questionBrain;
  late Widget screenWidget;

  @override
  void initState() {
    super.initState();
    questionBrain = QuestionBrain(questionList: lessonOneQuestions);
    setScreenWidget();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setScreenWidget() {
    AssetImage image = questionBrain.getImage();
    String questionText = questionBrain.getQuestionText();
    int questionNum = questionBrain.getQuestionNum();
    int totalNumOfQuestions = questionBrain.getTotalNumberOfQuestions();

    screenWidget = QuestionSkeleton(
      image: image,
      questionText: questionText,
      questionNum: questionNum,
      totalNumOfQuestions: totalNumOfQuestions,
    );
  }

  List<Widget> getOptionButtons() {
    List<Widget> optionButtons = [];
    List<String> notes = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
    for (int i = 0; i < notes.length; ++i) {
      optionButtons.add(
        OptionButton(
          buttonText: notes[i],
          onPressed: () {
            questionBrain.setAnswer(notes[i]);
            setState(() {
              questionBrain.goToNextQuestion();
              setScreenWidget();
            });
          },
        ),
      );
    }
    return optionButtons;
  }

  Widget getResultsScreen() {
    String title = '';
    double percentage =
        questionBrain.getScore() / questionBrain.getQuestionNum();

    title =
        "${questionBrain.getScore()} correct in ${widget.timerDuration} seconds";

    return ResultsScreen(
      score: percentage,
      title: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                screenWidget,
                //choices buttons
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: getOptionButtons(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: Align(
                alignment: Alignment.topRight,
                child: CircularCountDownTimer(
                  width: 60,
                  height: 60,
                  duration: widget.timerDuration,
                  isReverse: true,
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
                        builder: (context) {
                          return getResultsScreen();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Old Yusuf's Code
// Stack(
// children: [
// const LessonScreen(),
// Padding(
// padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
// child: Align(
// alignment: Alignment.topRight,
// child: CircularCountDownTimer(
// width: 60,
// height: 60,
// duration: widget.timerDuration,
// backgroundColor: Colors.purple[500],
// fillColor: Colors.red,
// ringColor: Colors.grey,
// strokeWidth: 20.0,
// strokeCap: StrokeCap.round,
// textStyle: const TextStyle(
// fontSize: 33.0,
// color: Colors.white,
// fontWeight: FontWeight.bold),
// isTimerTextShown: true,
// autoStart: true,
// onStart: () {
// //print('Countdown Started');
// },
// onComplete: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => const ResultsScreen(
// score: 5, title: 'Congratulations!'),
// ),
// );
// },
// ),
// ),
// ),
// ],
// ),
