import 'package:flutter/material.dart';

import 'menu_screen.dart';
import 'lesson_screen.dart';
import 'package:sight_reading_app/components/app_bar_with_settings_icon.dart';


/// A screen containing various practice modes for the user to select.
///
/// The modes are: Play along, Speedrun, Quiz, Endless.
/// The user selects a mode by clicking the relevant button.
/// TODO: Add endless button functionality
/// There is also an AppBar containing the screen title, a back arrow and a setting icon, which when clicked takes you to the settings screen.
class PracticeScreen extends StatelessWidget {
  const PracticeScreen({Key? key}) : super(key: key);
  /// The id used to identify the screen
  static const String id = 'practice_screen';

  static const navigateToSpeedrunMenuButtonKey = Key('navigateToSpeedrunMenu');
  static const navigateToPlayAlongMenuButtonKey = Key('navigateToPlayAlongMenu');
  static const navigateToQuizSelectionButtonKey = Key('navigateToQuizSelection');
  static const navigateToEndlessModeButtonKey = Key('navigateToEndlessMode');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithSettingsIcon(Text('Practice your skills!')),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            MenuButton(
              buttonChild:
                const Center(child: ButtonText(buttonText: 'Play along')),
              onPress: () {
                Navigator.pushNamed(
                    context, LessonScreen.id); //TODO: Replace with play along screen route
              },
            )
          ],
        )
      ),
    );
  }
  }
