import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/question_skeleton.dart';
import 'achievements_screen.dart';
import 'practice_screen.dart';
import 'settings_screen.dart';
import 'lesson_screen.dart';

const String formattedAppName = 'Read\n That\n Sheet';
final Color appNameBoxColour = Colors.indigo.shade300;
final Color buttonBoxColour = Colors.indigo.shade400;
const EdgeInsets boxMargin = EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 2.5);
const double boxRadii = 10.0;
final TextStyle appNameTextStyle = TextStyle(
    fontSize: 100.0,
    fontWeight: FontWeight.bold,
    color: Colors.grey.shade300,
    shadows: [
      Shadow(
        color: Colors.blueGrey.shade800,
        offset: const Offset(5.0, 5.0),
      ),
    ]);
final TextStyle buttonTextStyle = TextStyle(
  fontSize: 40.0,
  color: Colors.orange.shade500,
  fontWeight: FontWeight.bold,
);
final Icon settingsIcon = Icon(
  Icons.settings,
  size: 75.0,
  color: Colors.orange.shade300,
);

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
            const Expanded(
              child: AppNameBox(),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: MenuButton(
                      buttonChild: const ButtonText(buttonText: 'Lessons'),
                      onPress: () {
                        Navigator.pushNamed(context, LessonScreen.id);
                      },
                    ),
                  ),
                  Expanded(
                    child: MenuButton(
                      buttonChild: const ButtonText(buttonText: 'Practice'),
                      onPress: () {
                        Navigator.pushNamed(context, PracticeScreen.id);
                      },
                    ),
                  ),
                  Expanded(
                    child: MenuButton(
                      buttonChild: const ButtonText(buttonText: 'Achievements'),
                      onPress: () {
                        Navigator.pushNamed(context, AchievementsScreen.id);
                      },
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 2,
                          child: MenuButton(
                            buttonChild: Align(
                              alignment: Alignment.center,
                              child: settingsIcon,
                            ),
                            onPress: () {
                              Navigator.pushNamed(context, SettingsScreen.id);
                            },
                          ),
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

class AppNameBox extends StatelessWidget {
  const AppNameBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Temporary GestureDetector to go to QuestionSkeleton screen
    // TODO: Remove GestureDetector widget
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, QuestionSkeleton.id);
      },
      child: Container(
        margin: boxMargin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(boxRadii),
          color: appNameBoxColour,
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  formattedAppName,
                  style: appNameTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final Widget buttonChild;
  final VoidCallback onPress;

  const MenuButton({
    Key? key,
    required this.buttonChild,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: boxMargin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(boxRadii),
          color: buttonBoxColour,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: buttonChild,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  final String buttonText;

  const ButtonText({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonText,
      textAlign: TextAlign.center,
      style: buttonTextStyle,
    );
  }
}
