import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/pause_menu.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import '../components/question_skeleton.dart';
import 'package:sight_reading_app/question_brain.dart';
import '../components/sheet_music_components/note.dart';
import 'package:sight_reading_app/components/option_button.dart';

import '../lessons_and_quizzes/question_finder.dart';
import 'lesson_screen.dart';

/// Creates screen for the practice quiz.
/// This screen consists of the option buttons and components in question_skeleton

class _PracticeQuizScreenState extends State<PracticeQuizScreen> {
  late QuestionBrain questionBrain;
  late Widget screenWidget;
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();
    questionBrain =
        QuestionBrain(questions: QuestionFinder().getPracticeQuestions(10));
    setScreenWidget();
  }

  @override
  void dispose() {
    super.dispose();
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
        showMenu();
      },
    );
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

              ///choices buttons
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: getOptionButtons(),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  void showMenu() {
    final overlay = Overlay.of(context)!;

    entry = OverlayEntry(
      builder: (context) => PauseMenu(
        removeMenu: removeMenu,
        continueOnPressed: () {
          Navigator.popUntil(
            context,
            ModalRoute.withName(LessonScreen.id),
          );
        },
      ),
    );
    overlay.insert(entry!);
  }

  void removeMenu() {
    entry?.remove();
    entry = null;
  }

  /// Creates the answer option buttons.
  ///
  /// Each button has text displayed and check with question brain
  /// to see if the user has tapped the button with the correct answer.
  List<Widget> getOptionButtons() {
    ///TODO: Beginners see less options and experts see all options
    List<Widget> optionButtons = [];
    List<String> notes = whiteKeyNames;
    for (int i = 0; i < notes.length; ++i) {
      optionButtons.add(
        OptionButton(
          buttonText: notes[i],
          onPressed: () {
            questionBrain.setAnswer(notes[i]);
            showResultAlert(notes[i]);
          },
        ),
      );
    }
    return optionButtons;
  }

  /// Set details of the Screen Widget in lesson.
  ///
  /// Set components from QuestionBrain including question image, text and number
  /// and send to QuestionSkeleton to display components.

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

  /// Set information for an alert message.
  ///
  /// The alert is displayed each time the user answers a question.
  /// Shows if the answer is correct and provides a  button to go to the next question.

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
          questionBrain.getCorrectAnswer();
    }

    displayDialog(alertTitle, alertDesc);
  }

  /// Displays the alert with result.
  void displayDialog(String alertTitle, String alertDesc) {
    showDialog<String>(
      context: context,
      builder: (context) {
        return createResultAlert(alertTitle, alertDesc);
      },
    );
  }

  /// Create result screen which displays after the user finishes all questions
  Widget getResultsScreen() {
    String title = '';
    double percentage =
        questionBrain.getScore() / questionBrain.getTotalNumberOfQuestions();
    if (percentage < passThreshold) {
      title = "Aww, better luck next time!";
    } else {
      title = "Congratulations!";
    }
    return ResultsScreen(
      score: percentage,
      title: title,
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
          });
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return getResultsScreen();
            }),
          );
        }
      },
    );
  }

  /// Creates text for next button
  String getNextButtonText() {
    return questionBrain.isLastQuestion() ? "Finish" : "Next";
  }
}

class PracticeQuizScreen extends StatefulWidget {
  static const String id = 'practice_quiz_screen';

  const PracticeQuizScreen({Key? key}) : super(key: key);

  @override
  _PracticeQuizScreenState createState() => _PracticeQuizScreenState();
}
