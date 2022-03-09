import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:sight_reading_app/constants.dart';
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
    questionBrain = QuestionBrain(questions: lessonOneQuestions);
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
    List<String> notes = whiteKeyNames;
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
    double percentage =
        questionBrain.getScore() / questionBrain.getQuestionNum();
    String title =
        "${questionBrain.getScore()} correct in ${widget.timerDuration} seconds";

    return ResultsScreen(
      score: percentage,
      title: title,
    );
  }

  Widget getCountdownTimer() {
    return CircularCountDownTimer(
      width: 60,
      height: 60,
      duration: widget.timerDuration,
      isReverse: true,
      backgroundColor: countdownTimerBackgroundColour,
      fillColor: countdownTimerFillColour,
      ringColor: countdownTimerRingColour,
      strokeWidth: 20.0,
      strokeCap: StrokeCap.round,
      textStyle: countdownTimerTextStyle,
      isTimerTextShown: true,
      autoStart: true,
      onStart: () {},
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
                child: getCountdownTimer(),
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
