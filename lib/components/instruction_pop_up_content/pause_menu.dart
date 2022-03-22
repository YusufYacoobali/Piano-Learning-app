import 'package:flutter/material.dart';

import '../../components/pop_up_components/pop_up_content_builder.dart';
import '../../constants.dart';
import '../../screens/lesson_menu_screen.dart';
import '../../screens/menu_screen.dart';

class PauseMenu extends PopUpContentBuilder {
  final BuildContext context;
  final VoidCallback continueOnPressed;

  PauseMenu({required this.context, required this.continueOnPressed});

  /// Sets up the start menu
  @override
  void buildMenu() {
    text = Column(children: const [
      Text('Paused', style: pauseMenuTextStyle),
      SizedBox(height: 50.0),
    ]);

    options = [
      ElevatedButton(
        child: const Text('Main Menu'),
        key: const Key('home button'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName(MenuScreen.id));
        },
      ),
      ElevatedButton(
        child: const Text('Continue'),
        key: const Key('play button'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          removeMenu();
          continueOnPressed();
        },
      ),
      ElevatedButton(
        child: const Text('Back To Lessons'),
        key: const Key('lesson selection button'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName(LessonMenuScreen.id));
        },
      ),
    ];
  }
}
