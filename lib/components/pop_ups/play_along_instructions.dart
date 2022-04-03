import 'package:flutter/material.dart';

import '../../components/pop_up_components/pop_up_content_builder.dart';
import '../../constants.dart';

/// A set of instructions to be run before starting the play along mode.
///
/// This is a pop-up that tells the user what to do.
class PlayAlongInstructions extends PopUpContentBuilder {

  /// Context data to pass into the class.
  final BuildContext context;

  PlayAlongInstructions({required this.context});

  /// Sets up the start menu
  @override
  void buildMenu() {
    text = Column(
        children: const [
          Text('Play Along Mode', style: pauseMenuTextStyle),
          SizedBox(height: 20.0),
          Text('Play along with a selection of songs'),
          SizedBox(height: 10.0),
          Text('Have fun!'),
          SizedBox(height: 30.0),
        ]
    );

    options = [
      ElevatedButton(
        child: const Text('Exit'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          removeMenu();
        },
      ),
    ];
  }
}