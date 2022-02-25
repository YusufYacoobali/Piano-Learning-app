import 'package:flutter/material.dart';

class QuestionSkeleton extends StatefulWidget {
  static String id = 'question_skeleton';
  final AssetImage image;
  final String questionText;
  final int questionNum;
  final int totalNumOfQuestions;

  const QuestionSkeleton({
    Key? key,
    required this.image,
    required this.questionText,
    required this.questionNum,
    required this.totalNumOfQuestions,
  }) : super(key: key);

  @override
  _QuestionSkeletonState createState() => _QuestionSkeletonState();
}

class _QuestionSkeletonState extends State<QuestionSkeleton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
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
                'Question ${widget.questionNum} of ${widget.totalNumOfQuestions}',
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
                      image: widget.image,
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
                      widget.questionText,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
