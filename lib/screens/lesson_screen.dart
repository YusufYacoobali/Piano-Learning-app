import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/question_skeleton.dart';


class _LessonScreenState extends State<LessonScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lessons'),
      ),
      body: SafeArea(
        child: Expanded(
          child: Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              lessonButton('Lesson 1'), // GestureDetector
              lessonButton('Lesson 2'), // GestureDetector
              lessonButton('Lesson 3'), // GestureDetector
              lessonButton('Lesson 4'), // GestureDetector
              lessonButton('Lesson 5')  // GestureDetector
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector lessonButton(lessonText){
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, QuestionSkeleton.id);
      },
      child: Container(
        child: Center(
          child: Text(
            '$lessonText',
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: buttonBoxColour,
        ),
        padding: const EdgeInsets.all(23),
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
