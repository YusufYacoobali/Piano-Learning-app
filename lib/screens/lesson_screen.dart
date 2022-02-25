import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import '../components/question_skeleton.dart';
import 'package:sight_reading_app/question_brain.dart';
import '../lessons_and_quizzes/lesson_one.dart';

const Color buttonColour = Colors.orange;

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
      appBar: AppBar(
        title: const Text('Read That Sheet'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            screenWidget,
            //choices buttons
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildChoiceButton('C'),
                  buildChoiceButton('D'),
                  buildChoiceButton('E'),
                  buildChoiceButton('F'),
                  buildChoiceButton('G'),
                  buildChoiceButton('A'),
                  buildChoiceButton('B'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
    bool result = questionBrain.checkAnswer(choice);
    if (result) {
      alertTitle = 'Correct!';
      alertDesc = 'You got the correct answer!';
    } else {
      alertTitle = 'Incorrect!';
      alertDesc = 'Wrong answer, the correct answer is ' +
          questionBrain.getCorrectAnswer();
    }

    showDialog<String>(
        context: context,
        builder: (context) {
          return createResultAlert(alertTitle, alertDesc);
        });
  }

  AlertDialog createResultAlert(String alertTitle, String alertDesc) {
    return AlertDialog(
      title: Text(alertTitle),
      content: Text(alertDesc),
      actions: <Widget>[
        //go to next question
        TextButton(
          child: const Text("NEXT"),
          onPressed: () {
            Navigator.pop(context, 'OK');
            //go next if it is not the last question
            if (!questionBrain.isLastQuestion()) {
              setState(() {
                questionBrain.goToNextQuestion();
                setScreenWidget();
              });
            } else {
              //make the text "end" when it comes up to the last quiz
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      // score number
                      const ResultsScreen(score: 5, title: 'Congratulations!'),
                ),
              );
            }
          },
        ),
      ],
    );
  }

// build button for choice
//add value of answer in button
  Widget buildChoiceButton(String choice) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        child: TextButton(
          onPressed: () {
            showResultAlert(choice);
          },
          style: TextButton.styleFrom(
            backgroundColor: buttonColour,
          ),
          child: Text(
            choice,
            style: const TextStyle(fontSize: 20, color: Colors.black),
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

// Old template code
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// const Text(
// 'LESSON PAGE',
// ),
// ElevatedButton(onPressed: () {}, child: const Text('BACK TO HOME')),
// ],
// )
