import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:sight_reading_app/questions.dart';
import 'package:sight_reading_app/screens/results_screen.dart';

Questions questions = Questions();

class QuestionSkeleton extends StatefulWidget {
  static String id = 'question_skeleton';

  const QuestionSkeleton({Key? key}) : super(key: key);

  @override
  _QuestionSkeletonState createState() => _QuestionSkeletonState();
}

class _QuestionSkeletonState extends State<QuestionSkeleton> {
//delete this
  //int questionIndex = 0;

  //static const List<String> questions = [
  //'What is the letter that represents Do?',
  //'What is the letter of the note that follows Sol?'
  //];

  //List<String> answers = ['C', 'A'];
//to this
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final MaterialColor mainColor = Colors.orange;
  //make button visible
  bool isVisible = true;

// show result and take to next question
  AlertDialog createResultAlert(bool result) {
    String alertTitle = '';
    String alertDesc = '';
    //show result
    if (result) {
      alertTitle = 'Correct!';
      alertDesc = 'You got the correct answer!';
    } else {
      alertTitle = 'Incorrect!';
      alertDesc =
          'Wrong answer, the correct answer is ' + questions.getCorrectAnswer();
    }

    String buttonText = 'NEXT';

    return AlertDialog(
        title: Text(alertTitle),
        content: Text(alertDesc),
        actions: <Widget>[
          //go to next question
          TextButton(
            child: Text(buttonText),
            onPressed: () {
              Navigator.pop(context, 'OK');
              //go next if it is not the last question
              if (questions.getCurrentQuestionNum() <
                  questions.getTotalQuestionLength() - 1) {
                setState(() {
                  questions.goToNextQuestion();
                });
              } else {
                //make the text "end" when it comes up to the last quiz
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        // score number
                        const ResultsScreen(
                            score: 5, title: 'Congratulations!'),
                  ),
                );
                // Navigator.pushNamed(context, ResultsScreen.id);
              }
            },
            //text is not const anymore
          ),

          //End button testing
          /* TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          // score number
                          const ResultsScreen(score: 5, title: 'result')));
            },
            child: const Text('END'),
          ), */
        ]);
  }

  // build button for choice
  //add value of answer in button
  Expanded buildChoiceButton(String choice, MaterialColor color) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        child: TextButton(
          onPressed: () {
            showDialog<String>(
                context: context,
                builder: (context) {
                  return createResultAlert(checkAnswer(choice));
                });
          },
          style: TextButton.styleFrom(
            backgroundColor: color,
          ),
          child: Text(
            choice,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }

  //check answers
  //edit this
  bool checkAnswer(String userAnswer) {
    return userAnswer == questions.getCorrectAnswer();
  }

//question doesn't change
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
          title: const Text('Example Quiz'),
        ),*/
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //question number
              Expanded(
                key: const Key('question number'),
                child: Text(
                  //change this a bit
                  'Question ' +
                      (questions.getCurrentQuestionNum() + 1).toString() +
                      ' of ' +
                      questions.getTotalQuestionLength().toString(),
                  style: const TextStyle(fontSize: 25),
                ),
              ),

              //picture and question text
              Row(
                children: <Widget>[
                  Expanded(
                    key: const Key('question image'),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      //show image here
                      child: Image(
                        height: 150,
                        width: 150,
                        image: AssetImage(questions.getImagePath()),
                      ),
                    ),
                  ),
                  //Add text size
                  Expanded(
                    key: const Key('question text'),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        //show question text
                        questions.getQuestionsText(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),

              //choices buttons
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildChoiceButton('C', mainColor),
                    buildChoiceButton('D', mainColor),
                    buildChoiceButton('E', mainColor),
                    buildChoiceButton('F', mainColor),
                    buildChoiceButton('G', mainColor),
                    buildChoiceButton('A', mainColor),
                    buildChoiceButton('B', mainColor),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
