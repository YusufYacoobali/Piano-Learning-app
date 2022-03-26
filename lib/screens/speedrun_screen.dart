import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/in_app_notification_pop_up.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import 'package:sight_reading_app/storage_reader_writer.dart';
import '../components/page_keyboard.dart';
import '../components/question_skeleton.dart';
import '../components/sheet_music_components/note.dart';
import '../lessons_and_quizzes/question_finder.dart';
import '../lessons_and_quizzes/question_brain.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Screen for speedrun mode

/// Screen that displays and runs the speedrun mode.
///
/// The user's selection on the speedrun menu screen determines the time duration.
/// Once time is up a results screen is shown with the user's score.
class SpeedrunScreen extends StatefulWidget {
  /// The duration of the speedrun
  final int timerDuration;

  /// Constructor

  /// ID of the screen
  static const String id = 'speedrun_screen';

  const SpeedrunScreen({Key? key, required this.timerDuration})
      : super(key: key);

  @override
  State<SpeedrunScreen> createState() => _SpeedrunScreenState();
}

/// The state for the speedrun screen.
class _SpeedrunScreenState extends State<SpeedrunScreen> {
  /// Manages the questions
  late QuestionBrain questionBrain;

  /// Displays the questions
  late Widget screenWidget;

  StorageReaderWriter storage = StorageReaderWriter();

  @override
  void initState() {
    super.initState();

    /// Gets all of the questions in a random order
    questionBrain =
        QuestionBrain(questions: QuestionFinder().getRandomListOfQuestions());
    setScreenWidget();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// The widget to appear on screen.
  void setScreenWidget() {
    Note note = questionBrain.getNote();
    Clef clef = questionBrain.getClef();
    String questionText = 'What note is this?';
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

  /// The results screen
  Future<void> getResults() async {
    // Calculates the percentage achieved by the user
    double percentage =
        questionBrain.getScore() / questionBrain.getQuestionNum();
    String title =
        "${questionBrain.getScore()} correct in ${widget.timerDuration} seconds";
    int score = questionBrain.getScore();

    List displayNotification =
        await storage.displaySpeedrunNotification(widget.timerDuration, score);

    getResultsScreen(title, percentage);

    if (displayNotification[0]) {
      inAppNotification(context, displayNotification[1]);
    }

    // return ResultsScreen(
    //   score: percentage,
    //   title: title,
    //   questionBrain: questionBrain,
    // );
  }

  getResultsScreen(title, percentage) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResultsScreen(
                score: percentage,
                title: title,
                questionBrain: questionBrain,
              )),
    );
  }

  //TODO: Move into helper file
  ///Checks if the user's score is a new record for the selected mode, and updates shared preferences if it is.
  Future<void> _updateRecords() async {
    int score = questionBrain.getScore();
    final prefs = await SharedPreferences.getInstance();
    final int currentRecord =
        prefs.getInt('${widget.timerDuration}_second_speedrun_record') ?? 0;
    //If it is the user's first time, the currentRecord will be N/A.
    //We want to change N/A to 0 to show an attempt was made (even if they got nothing right).
    if (score > currentRecord || currentRecord == 0) {
      await prefs.setInt(
          '${widget.timerDuration}_second_speedrun_record', score);
    }
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
        // When timer finishes, go to results screen and update records if needed
        _updateRecords();
        getResults();
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return getResultsScreen();
        //     },
        //   ),
        // );
      },
    );
  }

  /// Gets the key pressed on the keyboard
  void answer(String text) {
    questionBrain.setAnswer(userAnswer: text);
    setState(() {
      questionBrain.goToNextQuestion();
      // Re-render the screen with new question
      setScreenWidget();
    });
  }

  /// Creates the screen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Timer is stacked on top of the question.
        child: Stack(
          children: [
            Column(
              children: [
                // Question
                screenWidget,
                Expanded(
                  child: PageKeyboard(answer),
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
