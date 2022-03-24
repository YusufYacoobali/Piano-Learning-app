import 'package:flutter/material.dart';

import '../../components/pop_up_components/pop_up_content_builder.dart';
import '../../constants.dart';
import '../../screens/menu_screen.dart';

class PauseMenu extends PopUpContentBuilder {
  final BuildContext context;
  final VoidCallback continueOnPressed;

  final String name;

  final String id;

  PauseMenu({required this.context, required this.name, required this.id, required this.continueOnPressed});
// =======
//   PauseMenu({required this.context, required this.continueOnPressed});
// >>>>>>> main

  /// Sets up the start menu
  @override
  void buildMenu() {
    text = Column(children: const [
      Text('Paused', style: pauseMenuTextStyle, key: Key('Menu title')),
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
        child: Text('Back To $name'),
        key: const Key('lesson selection button'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName(id));
        },
      ),
    ];
  }
}
