import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/practice_screen.dart';

import 'lesson_screen.dart';

class _AchievementsScreenState extends State<AchievementsScreen> {
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
              'ACHIEVEMENTS PAGE',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LessonScreen.id);
              },
              child: Text('EMPTY'),
            ),
          ],
        ),
      ),
    );
  }
}

class AchievementsScreen extends StatefulWidget {
  static const String id = 'achievements_screen';

  @override
  _AchievementsScreenState createState() => _AchievementsScreenState();
}
