import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/page_keyboard.dart';
import 'package:sight_reading_app/components/in_app_notification_pop_up.dart';
import 'package:sight_reading_app/components/pop_up_components/pop_up_controller.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/screens/lesson_menu_screen.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import 'package:sight_reading_app/storage_reader_writer.dart';
import '../components/pop_ups/pause_menu.dart';
import '../components/question_skeleton.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_brain.dart';
import '../components/sheet_music_components/note.dart';

import '../lessons_and_quizzes/question_finder.dart';

/// Creates screen for a lesson.
/// The lesson screen consists of the option buttons and components in question_skeleton

class LessonScreen extends StatefulWidget {
  static const String id = 'lesson_screen';
  final int lessonNum;
  const LessonScreen({Key? key, this.lessonNum = 1}) : super(key: key);

  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late QuestionBrain questionBrain;
  late Widget screenWidget;
  Stopwatch stopwatch = Stopwatch();
  late final PopUpController _pauseMenu;
  StorageReaderWriter storage = StorageReaderWriter();

  ///List of all lessons available

  // List<QuestionList> questionLists = [
  //   lessonOneQuestions,
  //   lessonTwoQuestions,
  //   lessonThreeQuestions,
  //   lessonFourQuestions,
  //   lessonFiveQuestions,
  //   lessonSixQuestions,
  //   lessonSevenQuestions,
  // ];
  @override
  void initState() {
    super.initState();
    int lessonNum = widget.lessonNum;
    questionBrain = QuestionBrain(
        questions: QuestionFinder().getQuestionsForLesson(lessonNum));
    setScreenWidget();
    stopwatch.start();

    PauseMenu pauseMenuBuilder = PauseMenu(
        context: context,
        name: 'Lessons',
        id: LessonMenuScreen.id,
        continueOnPressed: () => stopwatch.start());
    _pauseMenu =
        PopUpController(context: context, menuBuilder: pauseMenuBuilder);
  }

  @override
  void dispose() {
    super.dispose();
    _pauseMenu.delete();
    stopwatch.stop();
    stopwatch.reset();
  }

  /// Creates text for next button
  String getNextButtonText() {
    return questionBrain.isLastQuestion() ? "Finish" : "Next";
  }

  /// Creates a next button
  ///
  /// Either takes user to the next question or the result screen
  /// if the current question is the last question.
  Widget getNextButton() {
    return TextButton(
      child: Text(getNextButtonText()),
      onPressed: () {
        Navigator.pop(context, 'OK');

        ///go next if it is not the last question
        if (!questionBrain.isLastQuestion()) {
          setState(() {
            questionBrain.goToNextQuestion();
            setScreenWidget();
            stopwatch.start();
          });
        } else {
          getResults();
        }
      },
    );
  }

  /// Creates the template for alert with title, description and next button
  AlertDialog createResultAlert(String alertTitle, String alertDesc) {
    return AlertDialog(
      title: Text(alertTitle),
      content: Text(alertDesc),
      actions: <Widget>[
        ///go to next question
        getNextButton(),
      ],
    );
  }

  Widget getPauseButton() {
    return IconButton(
      key: const Key('Pause Icon'),
      icon: const Icon(
        Icons.pause,
        color: Colors.white,
        size: 35.0,
      ),
      onPressed: () {
        stopwatch.stop();
        _pauseMenu.show();
      },
    );
  }

  /// Gets the key pressed on the keyboard
  void answer(String text) {
    stopwatch.stop();
    questionBrain.setAnswer(
        userAnswer: text, timeTaken: stopwatch.elapsedMilliseconds);
    stopwatch.reset();
    showResultAlert(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Align(alignment: Alignment.topRight, child: getPauseButton()),
          Column(
            children: [
              screenWidget,
              Expanded(
                child: PageKeyboard(answer),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  getResultsScreen(title, percentage, lessonNum, questionBrain) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResultsScreen(
                score: percentage,
                title: title,
                lessonNum: lessonNum,
                questionBrain: questionBrain,
              )),
    );
  }

  /// Creates the answer option buttons.
  ///
  /// Each button has text displayed and check with question brain
  /// to see if the user has tapped the button with the correct answer.

  /// Set details of the Screen Widget in lesson.
  ///
  /// Set components from QuestionBrain including question image, text and number
  /// and send to QuestionSkeleton to display components.

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

  /// Set information for an alert message.
  ///
  /// The alert is displayed each time the user answers a question.
  /// Shows if the answer is correct and provides a  button to go to the next question.
  ///
  /// Displays the alert with result.
  void displayDialog(String alertTitle, String alertDesc) {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return createResultAlert(alertTitle, alertDesc);
      },
    );
  }

  /// Converts the correct answer if both the user answer and correct answer are the same note but different octaves
  String convertAnswer() {
    String correct = questionBrain.getCorrectAnswerWithoutOctave();
    String user = questionBrain.getUserAnswerWithoutOctave();
    if (correct == user && questionBrain.getCorrectAnswer() != questionBrain.getUserAnswer()) {
      return questionBrain.getCorrectAnswer();
    }
    return correct;
  }

  void showResultAlert(String choice) {
    String alertTitle = '';
    String alertDesc = '';

    ///show result
    if (questionBrain.checkAnswer(choice)) {
      alertTitle = 'Correct!';
      alertDesc = 'You got the correct answer!';
    } else {
      alertTitle = 'Incorrect!';
      alertDesc = 'Wrong answer, the correct answer is ' +
          convertAnswer();
    }

    displayDialog(alertTitle, alertDesc);
  }

  /// Create result screen which displays after the user finishes all questions
  getResults() async {
    String title = '';
    double percentage =
        questionBrain.getScore() / questionBrain.getTotalNumberOfQuestions();
    if (percentage < passThreshold) {
      title = "Aww, better luck next time!";
      getResultsScreen(title, percentage, widget.lessonNum, questionBrain);
    } else {
      title = "Congratulations!";
      storage.saveCompletedLesson(widget.lessonNum - 1);
      List displayNotification = await storage.displayLessonNotification();
      getResultsScreen(title, percentage, widget.lessonNum, questionBrain);
      //only displays notification if achievement is completed
      if (displayNotification[0]) {
        inAppNotification(context, displayNotification[1]);
      }
    }
  }
}
