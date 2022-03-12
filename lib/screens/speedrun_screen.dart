import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import '../components/option_button.dart';
import '../components/question_skeleton.dart';
import '../components/sheet_music_components/note.dart';
import '../lessons_and_quizzes/lesson_one.dart';
import '../question_brain.dart';

// TODO: Need to have enough questions so that we don't run out before the timer finishes

/// Screen for speedrun mode
class SpeedrunScreen extends StatefulWidget {
  /// The duration of the speedrun
  final int timerDuration;

  /// Constructor
  const SpeedrunScreen({
    Key? key,
    required this.timerDuration,
  }) : super(key: key);

  /// ID of the screen
  static const String id = 'speedrun_screen';

  @override
  State<SpeedrunScreen> createState() => _SpeedrunScreenState();
}

class _SpeedrunScreenState extends State<SpeedrunScreen> {
  /// Manages the questions
  late QuestionBrain questionBrain;

  /// Displays the questions
  late Widget screenWidget;

  @override
  void initState() {
    super.initState();

    /// Loads the correct question file
    questionBrain = QuestionBrain(questions: lessonOneQuestions);
    setScreenWidget();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Creates the screen widget
  void setScreenWidget() {
    Note note = questionBrain.getNote();
    Clef clef = questionBrain.getClef();
    String questionText = questionBrain.getQuestionText();
    int questionNum = questionBrain.getQuestionNum();
    int totalNumOfQuestions = questionBrain.getTotalNumberOfQuestions();

    screenWidget = QuestionSkeleton(
      note: note,
      clef: clef,
      questionText: questionText,
      questionNum: questionNum,
      totalNumOfQuestions: totalNumOfQuestions,
    );
  }

  /// Gets a list of the user-selectable option buttons
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
              // Re-render the screen with new question
              setScreenWidget();
            });
          },
        ),
      );
    }
    return optionButtons;
  }

  /// Gets the results screen
  Widget getResultsScreen() {
    // Calculates the percentage achieved by the user
    double percentage =
        questionBrain.getScore() / questionBrain.getQuestionNum();
    String title =
        "${questionBrain.getScore()} correct in ${widget.timerDuration} seconds";

    return ResultsScreen(
      score: percentage,
      title: title,
    );
  }

  /// Gets the countdown timer displayed in the top-right
  Widget getCountdownTimer() {
    return CircularCountDownTimer(
      width: 60,
      height: 60,
      duration: widget.timerDuration,
      // Makes the timer count backwards
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
        // When timer finishes, go to results screen
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
        // Timer is stacked on top of the question
        child: Stack(
          children: [
            Column(
              children: [
                // Question
                screenWidget,
                // User-selectable option buttons
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
