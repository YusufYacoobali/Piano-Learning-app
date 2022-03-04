import 'package:flutter/material.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import '../components/question_skeleton.dart';
import 'package:sight_reading_app/question_brain.dart';
import '../lessons_and_quizzes/lesson_one.dart';

class _LessonScreenState extends State<LessonScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
