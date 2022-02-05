import 'package:flutter/material.dart';

import 'lesson_screen.dart';

class _PracticeScreenState extends State<PracticeScreen> {
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
        title: Text('Read That Sheet'),
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PRACTICE PAGE',
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, LessonScreen.id);
                },
                child: Text('EMPTY')),
          ],
        ),
      ),
    );
  }
}

class PracticeScreen extends StatefulWidget {
  static const String id = 'practice_screen';

  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}
