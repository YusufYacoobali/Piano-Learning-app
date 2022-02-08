import 'package:flutter/material.dart';

//fix later
//watch a video on how to make an app have many pages
//Do I have to add other pages such as
// be careful about const
class QuestionSkeleton extends StatefulWidget {
  static String id = 'question_skeleton';

  const QuestionSkeleton({Key? key}) : super(key: key);

  @override
  _QuestionSkeletonState createState() => _QuestionSkeletonState();
}

class _QuestionSkeletonState extends State<QuestionSkeleton> {
  //Not sure if I should keep it
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final Color mainColor = Colors.orange;

  Expanded buildChoiceButton(String choice, MaterialColor color) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: mainColor,
          ),
          child: Text(choice),
        ),
      ),
    );
  }

  //create a method for button
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Quiz'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //question number
              const Expanded(
                child: Text('Question 1/1'),
              ),

              //picture and question text
              Row(
                children: const <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Picture'),
                    ),
                  ),
                  //Add text size
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                          'Question 1: What is the letter that is used to represent "Do"?'),
                    ),
                  ),
                ],
              ),

              //choices buttons
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildChoiceButton('C', Colors.orange),
                    buildChoiceButton('D', Colors.orange),
                    buildChoiceButton('E', Colors.orange),
                    buildChoiceButton('F', Colors.orange),
                    buildChoiceButton('G', Colors.orange),
                    buildChoiceButton('A', Colors.orange),
                    buildChoiceButton('B', Colors.orange),
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
