import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/question_skeleton.dart';
import '../components/notification_service.dart';
import 'package:sight_reading_app/screens/keyboard_screen.dart';
import '../constants.dart';
import 'achievements_screen.dart';
import 'keyboard_sheet_screen.dart';
import 'practice_screen.dart';
import 'settings_screen.dart';
import 'lesson_screen.dart';

const navigateToPracticeMainMenuButtonKey = Key('navigateToPracticeMainMenu');

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();

    NotificationAPI.init(initScheduled: true);
    //ListenNotifications();
    NotificationAPI.showScheduledNotification(
      title: 'Piano',
      body: 'do more',
      payload: 'extra info',
      //scheduledDate: DateTime.now().add(const Duration(seconds: 10)),
    );
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
                      key: navigateToPracticeMainMenuButtonKey,
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
                          // TODO: Remove GestureDetector widget when ResultsScreen properly linked up
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, KeyboardScreen.id);
                            },
                            child: Container(
                              // TODO: Remove colour and child properties when ResultsScreen properly linked up
                              color: Colors.red,
                              child: const Text(
                                  'TEMPORARY Click to go to Keyboard Screen'),
                            ),
                          ),
                        ),
                              Expanded(
                                flex: 4,
                                // TODO: Remove GestureDetector widget when SheetMusicScreen properly linked up
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, KeyboardSheetScreen.id);
                                  },
                                  child: Container(
                                    // TODO: Remove colour and child properties when SheetMusicScreen properly linked up
                                    color: Colors.red,
                                    child: const Text(
                                        'TEMPORARY Go to Sheet Music Screen'),
                                  ),
                                ),
                              ),
                        Expanded(
                          flex: 2,
                          child: MenuButton(
                            buttonChild: Align(
                              alignment: Alignment.center,
                              child: settingsIcon,
                            ),
                            onPress: () {
                              //Navigator.pushNamed(context, SettingsScreen.id);
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
    // TODO: Remove GestureDetector widget when QuestionSkeleton properly linked up
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, QuestionSkeleton.id);
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        margin: boxMargin,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(boxRadii),
          color: appNameBoxColour,
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          alignment: Alignment.center,
          child: Text(
            formattedAppName,
            style: appNameTextStyle,
          ),
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
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        margin: boxMargin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(boxRadii),
          color: buttonBoxColour,
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          alignment: Alignment.center,
          child: buttonChild,
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
    // TODO: Make all buttons have same font size
    return Text(
      buttonText,
      textAlign: TextAlign.center,
      style: buttonTextStyle,
    );
  }
}

// Old App name box stuff
//
// Column(
// children: [
// Expanded(
// child: Center(
// child: Text(
// formattedAppName,
// style: appNameTextStyle,
// ),
// ),
// ),
// ),
// ],

// Old Button boxes' stuff
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Expanded(
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: buttonChild,
// ),
// )
// ],
// ),
