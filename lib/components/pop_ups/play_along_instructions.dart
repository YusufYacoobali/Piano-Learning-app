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
    text = Column(children: const [
      Text('Play Along Mode', style: pauseMenuTextStyle),
      SizedBox(height: 15.0),
      Text(
          'Choose the melody you would like to learn, and follow along with it by playing the note when it is in the green section.'),
      SizedBox(height: 15.0),
      Text('Have fun!'),
      SizedBox(height: 15.0),
    ]);

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
