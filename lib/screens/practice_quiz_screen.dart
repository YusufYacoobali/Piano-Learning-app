import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/components/page_keyboard.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/screens/quiz_selection_screen.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import 'package:sight_reading_app/storage_reader_writer.dart';
import '../components/in_app_notification_pop_up.dart';
import '../components/pop_ups/pause_menu.dart';
import '../components/pop_up_components/pop_up_controller.dart';
import '../components/question_skeleton.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_brain.dart';
import '../components/sheet_music_components/note.dart';

import '../helper.dart';
import '../lessons_and_quizzes/question_finder.dart';

/// Creates screen for the practice quiz.
///
/// This screen consists of the option buttons and components in question_skeleton
class _PracticeQuizScreenState extends State<PracticeQuizScreen> {
  late QuestionBrain questionBrain;
  late Widget screenWidget;
  late final PopUpController _pauseMenu;
  StorageReaderWriter storage = StorageReaderWriter();
  Stopwatch stopwatch = Stopwatch();

  @override
  void initState() {
    super.initState();
    questionBrain = QuestionBrain(
        questions: QuestionFinder()
            .getPracticeQuestionsForLesson(widget.lessonID, 10));
    //print(questionBrain.questions); //This is empty in testing
    setScreenWidget();
    stopwatch.start();
    PauseMenu pauseMenuBuilder = PauseMenu(
        context: context,
        name: 'Quizzes',
        id: QuizSelectionScreen.id,
        continueOnPressed: () => stopwatch.start());
// =======
//     PauseMenu pauseMenuBuilder =
//         PauseMenu(context: context, continueOnPressed: () => stopwatch.start());
// >>>>>>> main
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

    //shows result
    if (questionBrain.checkAnswer(choice)) {
      alertTitle = 'Correct!';
      alertDesc = 'You got the correct answer!';
    } else {
      alertTitle = 'Incorrect!';
      alertDesc = 'Wrong answer, the correct answer is ' +
          questionBrain.getCorrectAnswerWithoutOctave();
    }

    displayDialog(alertTitle, alertDesc);
  }

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

  ///Checks if the user's final score is a new record for the selected quiz, and updates shared preferences if it is.
  Future<void> _updateRecords() async {
    int score = questionBrain.getScore();
    final prefs = await SharedPreferences.getInstance();
    final List<String> quizRecords = await getRecordsForMode('quiz');
    late int currentRecord;
    if (quizRecords[widget.lessonID - 1] == 'N/A') {
      currentRecord = 0;
    } else {
      currentRecord = int.parse(quizRecords[widget.lessonID - 1]);
    }
    //If it is the user's first time, the currentRecord will be N/A.
    //We want to change N/A to 0 to show an attempt was made (even if they got nothing right).
    if (score > currentRecord || currentRecord == 0) {
      await prefs.setInt(
          '${await getRecordKeysForMode('quiz')[widget.lessonID - 1]}', score);
    }
  }

  /// Create result screen which displays after the user finishes all questions
  getResultsScreen() async {
    String title = '';
    double percentage =
        questionBrain.getScore() / questionBrain.getTotalNumberOfQuestions();
    if (percentage < passThreshold) {
      title = "Aww, better luck next time!";
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultsScreen(
                  score: percentage,
                  title: title,
                  questionBrain: questionBrain,
                )),
      );
    } else {
      title = "Congratulations!";
      storage.saveCompletedQuiz();
      bool displayNotification = await storage.displayQuizNotification();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultsScreen(
                  score: percentage,
                  title: title,
                  questionBrain: questionBrain,
                )),
      );
      //only displays notification if achievement is completed
      if (displayNotification) {
        inAppNotification(context);
      }
    }
// <<<<<<< check-results-screen
//     return ResultsScreen(
//       score: percentage,
//       title: title,
//       questionBrain: questionBrain,
//     );
// =======
// >>>>>>> main
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

        //Goes to the next question if it is not the last question.
        if (!questionBrain.isLastQuestion()) {
          setState(() {
            questionBrain.goToNextQuestion();
            setScreenWidget();
            stopwatch.start();
          });
        }
        // Shows results screen and updates records if the last question was answered.
        else {
          _updateRecords();
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

  // Creates text for next button
  String getNextButtonText() {
    return questionBrain.isLastQuestion() ? "Finish" : "Next";
  }
}

class PracticeQuizScreen extends StatefulWidget {
  /// The id used to identify the screen
  static const String id = 'practice_quiz_screen';

  /// The lesson the quiz is getting questions from.
  final int lessonID;

  const PracticeQuizScreen({Key? key, required this.lessonID})
      : super(key: key);

  @override
  _PracticeQuizScreenState createState() => _PracticeQuizScreenState();
}
