import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/lesson_screen.dart';
import '../constants.dart';

class _LessonMenuScreenState extends State<LessonMenuScreen> {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            lessonButton('Lesson 1', 1), // GestureDetector
            lessonButton('Lesson 2', 2), // GestureDetector
            lessonButton('Lesson 3', 3), // GestureDetector
            lessonButton('Lesson 4', 4), // GestureDetector
            lessonButton('Lesson 5', 5) // GestureDetector
          ],
        ),
      ),
    );
  }

//should make it also connect to other screen not just lesson 1
  //what happens if lesson screen has a parameter
  Widget lessonButton(lessonText, lessonNum) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          //Navigator.push(context, LessonScreen.id, arguments: <int>{lessonNum});
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return LessonScreen(lessonNum: lessonNum);
            }),
          );
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
          decoration: lessonButtonDeco,
          padding: const EdgeInsets.all(23),
        ),
      ),
    );
  }
}

class LessonMenuScreen extends StatefulWidget {
  static const String id = 'lesson_menu_screen';

  const LessonMenuScreen({Key? key}) : super(key: key);

  @override
  _LessonMenuScreenState createState() => _LessonMenuScreenState();
}
