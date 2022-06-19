import 'package:flutter/material.dart';
import '../components/notifications/notification_service.dart';
import '../constants.dart';
import 'achievements_screen.dart';
import 'note_helper_menu_screen.dart';
import 'lesson_menu_screen.dart';
import 'practice_screen.dart';
import 'settings_screen.dart';
import 'package:sight_reading_app/components/app_name_box.dart';
import 'package:sight_reading_app/components/menu_button.dart';
import 'package:sight_reading_app/components/menu_button_text.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const navigateToPracticeMainMenuButtonKey = Key('navigateToPracticeMainMenu');

/// The main menu of the application.
///
/// The menu shows the title, as well as various buttons to access the features of the app:
/// "Lessons" - takes you to the lesson menu screen.
/// "Practice" - access various practice modes.
/// "Achievements" - see the various achievements you have obtained and have yet to obtained.
/// "Settings" - Adjust various settings, or reset your progress
/// "Helper" - See a guide to explain various notes.
class MenuScreen extends StatefulWidget {
  static const String id = 'menu_screen';

  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

/// Main menu screen state
class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    myBanner.load();
    NotificationAPI.init(initScheduled: true);
    NotificationAPI.showScheduledNotification(
      title: 'Read That Sheet',
      body: 'Hey! Why don\'t you learn some more notes today?',
      payload: 'extra info',
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  final myBanner = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: const BannerAdListener(),
      request: const AdRequest());

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
                    // 'Lessons' button
                    child: MenuButton(
                      buttonChild: const MenuButtonText(buttonText: 'Lessons'),
                      onPress: () {
                        Navigator.pushNamed(context, LessonMenuScreen.id);
                      },
                    ),
                  ),
                  Expanded(
                    // 'Practice' button
                    child: MenuButton(
                      buttonChild: const MenuButtonText(buttonText: 'Practice'),
                      onPress: () {
                        Navigator.pushNamed(context, PracticeScreen.id);
                      },
                      key: navigateToPracticeMainMenuButtonKey,
                    ),
                  ),
                  Expanded(
                    // 'Achievements' button
                    child: MenuButton(
                      buttonChild:
                          const MenuButtonText(buttonText: 'Achievements'),
                      onPress: () {
                        Navigator.pushNamed(context, AchievementsScreen.id);
                      },
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        //helper button
                        Expanded(
                          flex: 2,
                          child: MenuButton(
                            buttonChild: const Align(
                              alignment: Alignment.center,
                              child: helperButton,
                            ),
                            onPress: () {
                              Navigator.pushNamed(
                                  context, NoteHelperMenuScreen.id);
                            },
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: MenuButton(
                            buttonChild: const Align(
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
