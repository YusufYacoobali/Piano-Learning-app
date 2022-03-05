import 'package:flutter/material.dart';
import 'package:sight_reading_app/constants.dart';
//import 'package:sight_reading_app/screens/menu_screen.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import '../components/question_skeleton.dart';
import 'package:sight_reading_app/question_brain.dart';
import '../lessons_and_quizzes/lesson_one.dart';
//import '../components/pause_menu.dart';

class _LessonScreenState extends State<LessonScreen> {
  late QuestionBrain questionBrain;
  late Widget screenWidget;
  //late PauseMenu pauseMenu;
  //OverlayEntry? entry;

  @override
  void initState() {
    super.initState();
    questionBrain = QuestionBrain(questionList: lessonOneQuestions);
    setScreenWidget();
    //pauseMenu = PauseMenuState() as PauseMenu;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read That Sheet'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.pause,
              color: Colors.white,
            ),
            onPressed: () {
              //showMenu();
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
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
      ),
    );
  }

/*
  void showMenu()  {
    final overlay = Overlay.of(context)!;

    entry = OverlayEntry(
      builder: (context) => buildMenu(),
    );
    overlay.insert(entry!);
  }


  Widget buildMenu() => Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Card(
            color: Colors.black.withOpacity(0.8),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 80.0, vertical: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  getMenuText(),
                  const SizedBox(height: 10.0),
                  getHomeButton(),
                  const SizedBox(height: 10.0),
                  getPlayButton(),
                ],
              ),
            ),
          ),
        ],
      );

  void removeMenu() {
    entry?.remove();
    entry = null;
  }

  Widget getMenuText() {
    return const Text(
      'Paused',
      style: TextStyle(fontSize: 40.0, color: Colors.white),
    );
  }

  Widget getHomeButton() {
    return ElevatedButton.icon(
      label: const Text('Main menu'),
      icon: const Icon(
        Icons.home,
        size: 20.0,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo.shade400,
        onPrimary: Colors.grey.shade300,
        fixedSize: const Size(150.0, 50.0),
      ),
      onPressed: () {
        Navigator.popUntil(context, ModalRoute.withName(MenuScreen.id));
        removeMenu();
      },
    );
  }

  Widget getPlayButton() {
    return ElevatedButton.icon(
      label: const Text('Continue'),
      icon: const Icon(
        Icons.play_arrow,
        size: 20.0,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo.shade400,
        onPrimary: Colors.grey.shade300,
        fixedSize: const Size(150.0, 50.0),
      ),
      onPressed: () {
        Navigator.popUntil(context, ModalRoute.withName(LessonScreen.id));
        removeMenu();
      },
    );
  }
*/

  List<Widget> getOptionButtons() {
    // TODO: Beginners see less options and experts see all options
    List<Widget> optionButtons = [];
    List<String> notes = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
    for (int i = 0; i < notes.length; ++i) {
      optionButtons.add(buildOptionButton(notes[i]));
    }
    return optionButtons;
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

// show result and take to next question
  void showResultAlert(String choice) {
    String alertTitle = '';
    String alertDesc = '';
    //show result
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

  void displayDialog(String alertTitle, String alertDesc) {
    showDialog<String>(
      context: context,
      builder: (context) {
        return createResultAlert(alertTitle, alertDesc);
      },
    );
  }

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

  AlertDialog createResultAlert(String alertTitle, String alertDesc) {
    return AlertDialog(
      title: Text(alertTitle),
      content: Text(alertDesc),
      actions: <Widget>[
        //go to next question
        getNextButton(),
      ],
    );
  }

  Widget getNextButton() {
    return TextButton(
      child: Text(getNextButtonText()),
      onPressed: () {
        Navigator.pop(context, 'OK');
        //go next if it is not the last question
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

  String getNextButtonText() {
    return questionBrain.isLastQuestion() ? "Finish" : "Next";
  }

// build button for choice
//add value of answer in button
  Widget buildOptionButton(String buttonText) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        child: TextButton(
          onPressed: () {
            questionBrain.setAnswer(buttonText);
            showResultAlert(buttonText);
          },
          style: TextButton.styleFrom(
            backgroundColor: optionButtonColour,
          ),
          child: Text(
            buttonText,
            style: optionButtonTextStyle,
          ),
        ),
      ),
    );
  }
}

class LessonScreen extends StatefulWidget {
  static const String id = 'lesson_screen';

  const LessonScreen({Key? key}) : super(key: key);

  @override
  _LessonScreenState createState() => _LessonScreenState();
}
