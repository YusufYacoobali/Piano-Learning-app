import 'package:flutter/material.dart';

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
        title: const Text('Read That Sheet'),
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ACHIEVEMENTS PAGE',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LessonScreen.id);
              },
              child: const Text('EMPTY'),
            ),
          ],
        ),
      ),
    );
  }
}

class AchievementsScreen extends StatefulWidget {
  static const String id = 'achievements_screen';

  const AchievementsScreen({Key? key}) : super(key: key);

  @override
  _AchievementsScreenState createState() => _AchievementsScreenState();
}
