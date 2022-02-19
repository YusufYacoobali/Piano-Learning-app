import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class QuestionSkeleton extends StatefulWidget {
  static String id = 'question_skeleton';

  const QuestionSkeleton({Key? key}) : super(key: key);

  @override
  _QuestionSkeletonState createState() => _QuestionSkeletonState();
}

class _QuestionSkeletonState extends State<QuestionSkeleton> {
  int questionIndex = 0;

  static const List<String> questions = [
    'What is the letter that represents Do?',
    'What is the letter of the note that follows Sol?'
  ];

  List<String> answers = ['C', 'A'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final MaterialColor mainColor = Colors.orange;

  AlertDialog createResultAlert(bool result) {
    String alertTitle = '';
    String alertDesc = '';
    if (result) {
      alertTitle = 'Correct!';
      alertDesc = 'You got the correct answer!';
    } else {
      alertTitle = 'Incorrect!';
      alertDesc =
          'Wrong answer, the correct answer is ' + answers[questionIndex];
    }
    return AlertDialog(
        title: Text(alertTitle),
        content: Text(alertDesc),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
              if (questionIndex < questions.length - 1) {
                setState(() {
                  questionIndex++;
                });
              }
            },
            child: const Text('NEXT QUESTION'),
          ),
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
  bool checkAnswer(String userAnswer) {
    return userAnswer == answers[questionIndex];
  }

  //main part of the screen
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
                  'Question ' +
                      (questionIndex + 1).toString() +
                      ' of ' +
                      questions.length.toString(),
                  style: const TextStyle(fontSize: 25),
                ),
              ),

              //picture and question text
              Row(
                children: <Widget>[
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Picture'),
                    ),
                  ),
                  //Add text size
                  Expanded(
                    key: const Key('question text'),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        questions[questionIndex],
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
