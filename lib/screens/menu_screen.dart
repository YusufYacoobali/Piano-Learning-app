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
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.indigo.shade300,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        'Read\n That\n Sheet',
                        style: TextStyle(
                            fontSize: 100.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade300,
                            shadows: [
                              Shadow(
                                color: Colors.blueGrey.shade800,
                                offset: const Offset(5.0, 5.0),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LessonScreen.id);
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 2.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.indigo.shade400,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Lessons',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.orange.shade500,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, PracticeScreen.id);
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(5.0, 2.5, 5.0, 2.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.indigo.shade400,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Practice',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.orange.shade500,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AchievementsScreen.id);
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(5.0, 2.5, 5.0, 2.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.indigo.shade400,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Achievements',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.orange.shade500,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(),
                          flex: 4,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, SettingsScreen.id);
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.fromLTRB(0.0, 2.5, 5.0, 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.indigo.shade400,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.settings,
                                    size: 75.0,
                                    color: Colors.orange.shade300,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          flex: 2,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuScreen extends StatefulWidget {
  static const String id = 'menu_screen';

  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}
