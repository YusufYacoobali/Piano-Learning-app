import 'package:flutter/material.dart';

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
        title: const Text('Read That Sheet'),
      ),
      body: SafeArea(
        child: QuestionSkeleton(),
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
