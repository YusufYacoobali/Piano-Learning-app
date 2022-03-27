import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/lesson_screen.dart';
import 'package:sight_reading_app/storage_reader_writer.dart';
import '../constants.dart';

/// This file creates the screen where the user can select the lesson
/// they want to learn from those available.

class _LessonMenuScreenState extends State<LessonMenuScreen> {
  final ScrollController _firstController = ScrollController();
  StorageReaderWriter storage = StorageReaderWriter();

  final Map _map = {
    '1': false,
    '2': false,
    '3': false,
    '4': false,
    '5': false,
    '6': false,
    '7': false,
    '8': false,
  };

  @override
  void initState() {
    super.initState();
    _setPage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _setPage() async {
    List<bool> values = await storage.loadLessonValues();
    //state changes when values are fetched
    setState(() {
      _map.addAll({
        '1': values[0],
        '2': values[1],
        '3': values[2],
        '4': values[3],
        '5': values[4],
        '6': values[5],
        '7': values[6],
        '8': values[7],
        '9': values[8],
      });
    });
  }

  /// Builds the screen with the appBar and the row of lessons
  @override
  Widget build(BuildContext context) {
    _setPage();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lessons'),
      ),
      body: SafeArea(
        child: Scrollbar(
          controller: _firstController,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            /// makes the row scrollable
            scrollDirection: Axis.horizontal,
            controller: _firstController,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: makeLessonButtons(),
            ),
          ),
        ),
      ),
    );
  }

  /// creates the individual lesson buttons for each lesson
  Widget lessonButton(lessonText, lessonNum) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return LessonScreen(lessonNum: lessonNum);
          }),
        );
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
        decoration: _map[lessonNum.toString()]
            ? completeLessonButtonDeco
            : lessonButtonDeco,
        padding: const EdgeInsets.all(23),
        margin: const EdgeInsetsDirectional.all(7),
      ),
    );
  }

  List<Widget> makeLessonButtons() {
    return [
      lessonButton('Lesson 1', 1), // GestureDetector
      lessonButton('Lesson 2', 2), // GestureDetector
      lessonButton('Lesson 3', 3), // GestureDetector
      lessonButton('Lesson 4', 4), // GestureDetector
      lessonButton('Lesson 5', 5), // GestureDetector
      lessonButton('Lesson 6', 6),
      lessonButton('Lesson 7', 7),
      lessonButton('Lesson 8', 8),
      lessonButton('Lesson 9', 9)
    ]; // Gesture Detector
  }
}

class LessonMenuScreen extends StatefulWidget {
  static const String id = 'lesson_menu_screen';

  const LessonMenuScreen({Key? key}) : super(key: key);

  @override
  _LessonMenuScreenState createState() => _LessonMenuScreenState();
}
