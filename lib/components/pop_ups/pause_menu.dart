import 'package:flutter/material.dart';

import '../../components/pop_up_components/pop_up_content_builder.dart';
import '../../constants.dart';
import '../../screens/menu_screen.dart';

class PauseMenu extends PopUpContentBuilder {
  final BuildContext context;
  final VoidCallback continueOnPressed;

  final String name;

  final String id;

  PauseMenu(
      {required this.context,
      required this.name,
      required this.id,
      required this.continueOnPressed});
// =======
//   PauseMenu({required this.context, required this.continueOnPressed});
// >>>>>>> main

  /// Sets up the start menu
  @override
  void buildMenu() {
    text = Column(children: const [
      Text('Paused', style: pauseMenuTextStyle, key: Key('Menu title')),
      SizedBox(height: 10.0),
    ]);

    options = [
      ElevatedButton.icon(
        icon: pauseMenuHomeIcon,
        label: const Text('Main Menu'),
        key: const Key('home button'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName(MenuScreen.id));
        },
      ),
      ElevatedButton.icon(
        icon: pauseMenuPlayIcon,
        label: const Text('Continue'),
        key: const Key('play button'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          removeMenu();
          continueOnPressed();
        },
      ),
      ElevatedButton.icon(
        icon: pauseMenuSelectionIcon,
        label: Text('Back To $name'),
        key: const Key('selection button'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName(id));
        },
      ),
    ];
  }
}
