import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/pop_up_components/pop_up_controller.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import '../components/page_keyboard.dart';
import '../components/pop_ups/pause_menu.dart';
import '../components/question_skeleton.dart';
import '../components/sheet_music_components/note.dart';
import 'question_brain.dart';

/// A quiz a user can take.
///
/// Each quiz contains a set of questions, after which the results are tallied and shown to the user through the results screen.
/// The quiz tracks how long it takes for a user to answer the question in addition to whether the answer was correct or not.
/// Although this is called 'quiz' the same functionality is also used for lessons and the speedrun mode.
class Quiz extends StatefulWidget {
  /// A unique id for the quiz.
  final String id;

  /// The name of the quiz.
  final String name;

  /// The set of questions the quiz contains.
  final QuestionBrain questionBrain;

  /// A function to be called once the quiz is completed.
  final Function getResults;

  /// A flag for whether or not this quiz is actually a lesson, in which case more detailed explanation text is shown.
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

/// The state class for the quiz.
class _QuizState extends State<Quiz> {
  final Stopwatch _stopwatch = Stopwatch();
  late Widget _screenWidget;
  late final PopUpController _pauseMenu;

  /// Gets the key pressed on the keyboard
  void _answer(String text) {
    _stopwatch.stop();
    widget.questionBrain.setAnswer(
      userAnswer: text,
      timeTaken: _stopwatch.elapsedMilliseconds,
    );
    _stopwatch.reset();
    _showResultAlert(text);
  }

  /// Sets the widget showing the question displayed on screen
  void _setScreenWidget() {
    Note note = widget.questionBrain.getNote();
    Clef clef = widget.questionBrain.getClef();
    // Question text is not displayed in speedrun/random quiz/practice quiz
    String questionText = widget.useQuestionText
        ? widget.questionBrain.getQuestionText()
        : 'What note is this?';
    int questionNum = widget.questionBrain.getQuestionNum();
    int totalNumOfQuestions = widget.questionBrain.getTotalNumberOfQuestions();

    _screenWidget = QuestionSkeleton(
      note: note,
      clef: clef,
      questionText: questionText,
      questionNum: questionNum,
      totalNumOfQuestions: totalNumOfQuestions,
    );
  }

  /// The pause button displayed in the top right.
  Widget _getPauseButton() {
    return IconButton(
      key: const Key('Pause Icon'),
      icon: const Icon(
        Icons.pause,
        color: Colors.white,
        size: 35.0,
      ),
      onPressed: () {
        _stopwatch.stop();
        _pauseMenu.show();
      },
    );
  }

  /// Text for the 'next' button on the pop-up displaying if the answer was correct or not.
  String _getNextButtonText() {
    return widget.questionBrain.isLastQuestion() ? "Finish" : "Next";
  }

  /// A 'next' button for the pop-up displaying if the answer the user selected was correct or not.
  ///
  /// Either takes user to the next question or the result screen if the current question is the last question.
  Widget _getNextButton() {
    return TextButton(
      child: Text(_getNextButtonText()),
      onPressed: () {
        Navigator.pop(context, 'OK');

        // Go to the next question if it is not the last question
        if (!widget.questionBrain.isLastQuestion()) {
          // Update the screen
          setState(() {
            widget.questionBrain.goToNextQuestion();
            _setScreenWidget();
            _stopwatch.start();
          });
        } else {
          widget.getResults();
        }
      },
    );
  }

  /// Creates the template for alert with title, description and next button
  AlertDialog _createResultAlert(String alertTitle, String alertDesc) {
    return AlertDialog(
      title: Text(alertTitle),
      content: Text(alertDesc),
      actions: <Widget>[
        _getNextButton(),
      ],
    );
  }

  /// Converts the correct answer if both the user answer and correct answer are the same note but different octaves
  String _convertAnswer() {
    String correct = widget.questionBrain.getCorrectAnswerWithoutOctave();
    String user = widget.questionBrain.getUserAnswerWithoutOctave();
    if (correct == user &&
        widget.questionBrain.getCorrectAnswer() !=
            widget.questionBrain.getUserAnswer()) {
      return widget.questionBrain.getCorrectAnswer();
    }
    return correct;
  }

  /// Shows the pop-up when an option is selected
  void _showResultAlert(String choice) {
    String alertTitle = '';
    String alertDesc = '';

    if (widget.questionBrain.checkAnswer(choice)) {
      alertTitle = 'Correct!';
      alertDesc = 'You got the correct answer!';
    } else {
      alertTitle = 'Incorrect!';
      alertDesc = 'Wrong answer, the correct answer is ' + _convertAnswer();
    }

    _displayDialog(alertTitle, alertDesc);
  }

  /// Set information for an alert message.
  ///
  /// The alert is displayed each time the user answers a question.
  /// Shows if the answer is correct and provides a button to go to the next question.
  void _displayDialog(String alertTitle, String alertDesc) {
    showDialog<String>(
      context: context,
      // Stops the user from tapping outside of the pop-up
      barrierDismissible: false,
      builder: (context) {
        return _createResultAlert(alertTitle, alertDesc);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _setScreenWidget();
    PauseMenu pauseMenuBuilder = PauseMenu(
        context: context,
        name: widget.name,
        backToID: widget.id,
        continueOnPressed: () => _stopwatch.start());
    _pauseMenu =
        PopUpController(context: context, menuBuilder: pauseMenuBuilder);
    _stopwatch.start();
  }

  @override
  void dispose() {
    super.dispose();
    _pauseMenu.delete();
    _stopwatch.stop();
    _stopwatch.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Align(
            alignment: Alignment.topRight,
            child: _getPauseButton(),
          ),
          Column(
            children: [
              _screenWidget,
              Expanded(
                child: PageKeyboard(_answer),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
