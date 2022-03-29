import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/pop_up_components/pop_up_controller.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import '../components/page_keyboard.dart';
import '../components/pop_ups/pause_menu.dart';
import '../components/question_skeleton.dart';
import '../components/sheet_music_components/note.dart';
import 'question_brain.dart';

/// Quiz format questions
class Quiz extends StatefulWidget {
  final String id;
  final String name;
  final QuestionBrain questionBrain;
  final Function getResults;
  final bool useQuestionText;

  /// Constructor for Quiz
  const Quiz({
    Key? key,
    required this.id,
    required this.name,
    required this.questionBrain,
    required this.getResults,
    required this.useQuestionText,
  }) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Stopwatch stopwatch = Stopwatch();
  late Widget screenWidget;
  late final PopUpController _pauseMenu;

  /// Gets the key pressed on the keyboard
  void answer(String text) {
    stopwatch.stop();
    widget.questionBrain.setAnswer(
      userAnswer: text,
      timeTaken: stopwatch.elapsedMilliseconds,
    );
    stopwatch.reset();
    showResultAlert(text);
  }

  /// Sets the widget showing the question displayed on screen
  void setScreenWidget() {
    Note note = widget.questionBrain.getNote();
    Clef clef = widget.questionBrain.getClef();
    // Question text is not displayed in speedrun/random quiz/practice quiz
    String questionText = widget.useQuestionText
        ? widget.questionBrain.getQuestionText()
        : 'What note is this?';
    int questionNum = widget.questionBrain.getQuestionNum();
    int totalNumOfQuestions = widget.questionBrain.getTotalNumberOfQuestions();

    screenWidget = QuestionSkeleton(
      note: note,
      clef: clef,
      questionText: questionText,
      questionNum: questionNum,
      totalNumOfQuestions: totalNumOfQuestions,
    );
  }

  /// Gets the pause button displayed in the top right
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

  /// Creates text for next button
  String getNextButtonText() {
    return widget.questionBrain.isLastQuestion() ? "Finish" : "Next";
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

        // Go to the next question if it is not the last question
        if (!widget.questionBrain.isLastQuestion()) {
          // Update the screen
          setState(() {
            widget.questionBrain.goToNextQuestion();
            setScreenWidget();
            stopwatch.start();
          });
        } else {
          widget.getResults();
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
        getNextButton(),
      ],
    );
  }

  /// Gets the results screen
  void getResultsScreen(title, percentage, questionBrain) {
    // Stops the user from swiping back to the quiz
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(
          score: percentage,
          title: title,
          questionBrain: questionBrain,
        ),
      ),
    );
  }

  /// Converts the correct answer if both the user answer and correct answer are the same note but different octaves
  String convertAnswer() {
    String correct = widget.questionBrain.getCorrectAnswerWithoutOctave();
    String user = widget.questionBrain.getUserAnswerWithoutOctave();
    if (correct == user && widget.questionBrain.getCorrectAnswer() != widget.questionBrain.getUserAnswer()) {
      return widget.questionBrain.getCorrectAnswer();
    }
    return correct;
  }

  /// Shows the pop-up when an option is selected
  void showResultAlert(String choice) {
    String alertTitle = '';
    String alertDesc = '';

    if (widget.questionBrain.checkAnswer(choice)) {
      alertTitle = 'Correct!';
      alertDesc = 'You got the correct answer!';
    } else {
      alertTitle = 'Incorrect!';
      alertDesc = 'Wrong answer, the correct answer is ' +
          convertAnswer();
    }

    displayDialog(alertTitle, alertDesc);
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
      // Stops the user from tapping outside of the pop-up
      barrierDismissible: false,
      builder: (context) {
        return createResultAlert(alertTitle, alertDesc);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setScreenWidget();
    PauseMenu pauseMenuBuilder = PauseMenu(
        context: context,
        name: widget.name,
        backToID: widget.id,
        continueOnPressed: () => stopwatch.start());
    _pauseMenu =
        PopUpController(context: context, menuBuilder: pauseMenuBuilder);
    stopwatch.start();
  }

  @override
  void dispose() {
    super.dispose();
    _pauseMenu.delete();
    stopwatch.stop();
    stopwatch.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Align(
            alignment: Alignment.topRight,
            child: getPauseButton(),
          ),
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
}
