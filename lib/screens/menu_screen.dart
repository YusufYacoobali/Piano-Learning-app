import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/achievements_screen.dart';
import 'package:sight_reading_app/screens/practice_screen.dart';
import 'package:sight_reading_app/screens/settings_screen.dart';

import 'lesson_screen.dart';

class _MenuScreenState extends State<MenuScreen> {
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
              'HOME PAGE',
            ),
            ElevatedButton(
              key: Key('LessonButton'),
              onPressed: () {
                Navigator.pushNamed(context, LessonScreen.id);
              },
              child: Text('Lessons'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PracticeScreen.id);
              },
              child: Text('Practice'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AchievementsScreen.id);
              },
              child: Text('Achievements'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SettingsScreen.id);
              },
              child: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuScreen extends StatefulWidget {
  static const String id = 'menu_screen';

  @override
  _MenuScreenState createState() => _MenuScreenState();
}
