import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/lesson_screen.dart';
import '../constants.dart';

/// This file creates the screen where the user can select the lesson
/// they want to learn from those available.

class _LessonMenuScreenState extends State<LessonMenuScreen> {
  final ScrollController _firstController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Builds the screen with the appBar and the row of lessons
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lessons'),
      ),
      body: SafeArea(
        child: Scrollbar(
          controller: _firstController,
          isAlwaysShown: true,
          child: SingleChildScrollView( /// makes the row scrollable
            scrollDirection: Axis.horizontal,
            controller: _firstController,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                lessonButton('Lesson 1'), // GestureDetector
                lessonButton('Lesson 2'), // GestureDetector
                lessonButton('Lesson 3'), // GestureDetector
                lessonButton('Lesson 4'), // GestureDetector
                lessonButton('Lesson 5'), // GestureDetector
                lessonButton('Lesson 6') // GestureDetector
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// creates the individual lesson buttons for each lesson
  ///
  /// @param lessonText : Text to be shown in the lesson button
  /// @return Widget
  Widget lessonButton(String lessonText) {
    return GestureDetector( /// detects the clicks
      onTap: () {
        Navigator.pushNamed(context, LessonScreen.id);
      },
      child: Container(
        child: Center(
          child: FittedBox(
            child: Text(
              lessonText,
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration( /// Makes the container circle shaped
          shape: BoxShape.circle,
          color: buttonBoxColour,
        ),
        padding: const EdgeInsets.all(23),
        margin: const EdgeInsetsDirectional.all(7),
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
