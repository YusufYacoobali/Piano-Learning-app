import 'package:flutter/material.dart';
import '../../components/pop_up_components/pop_up_content_builder.dart';
import '../../constants.dart';
import '../../screens/menu_screen.dart';

/// A pause menu
///
/// The user can pause the play of certain modes, and is presented a menu with a few options:
/// - A button to go back to the main menu (a quit button)
/// - A button to resume play
/// - A button to go back to the previous menu (a quit button that doesn't take you back to the main app menu)
class PauseMenu extends PopUpContentBuilder {
  /// Context data to pass into the class.
  final BuildContext context;

  /// A callback to resume play once the resume button is pressed.
  final VoidCallback continueOnPressed;

  /// The name of the 'previous menu' screen.
  final String name;

  /// The ID of the 'previous menu' screen.
  final String backToID;

  /// Constructor
  PauseMenu(
      {required this.context,
      required this.name,
      required this.backToID,
      required this.continueOnPressed});

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
          Navigator.popUntil(context, ModalRoute.withName(backToID));
        },
      ),
    ];
  }
}
