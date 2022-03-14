import 'package:flutter/material.dart';

import '../../screens/play_along_menu_screen.dart';
import '../../components/pop_up_components/pop_up_content_builder.dart';
import '../../constants.dart';
import '../../screens/menu_screen.dart';

class PlayAlongEndingInstructions extends PopUpContentBuilder {

  final BuildContext context;

  PlayAlongEndingInstructions({required this.context});

  /// Sets up the end menu
  @override
  void buildMenu() {
    text = Column(
        children: const [
          Text('Song Finished', style: pauseMenuTextStyle),
          SizedBox(height: 10.0),
          Text('Choose an option: '),
          SizedBox(height: 30.0),
        ]
    );

    options = [
      ElevatedButton(
        child: const Text('Play Again'),
        style: pauseMenuButtonStyle,
        onPressed: () {
        },
      ),
      ElevatedButton(
        child: const Text('Review answers'),
        style: pauseMenuButtonStyle,
        onPressed: () {
        },
      ),
      ///TODO: Fix error in exiting menu
      ElevatedButton(
        child: const Text('Go to Play Along menu'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName(PlayAlongMenuScreen.id));
        },
      ),
      ElevatedButton(
        child: const Text('Exit'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName(MenuScreen.id));
        },
      ),
    ];
  }
}