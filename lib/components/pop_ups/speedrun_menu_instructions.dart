import 'package:flutter/material.dart';
import '../../components/pop_up_components/pop_up_content_builder.dart';
import '../../constants.dart';

/// A set of instructions to be run before starting the speedrun mode.
///
/// This is a pop-up that tells the user what to do.
/// This is shown in the speedrun mode selection menu, as a (?) icon in the AppBar.
class SpeedrunMenuInstructions extends PopUpContentBuilder {
  final BuildContext context;

  SpeedrunMenuInstructions({required this.context});

  /// Sets up the instructions
  @override
  void buildMenu() {
    text = Column(children: const [
      Text('Speedrun Mode', style: pauseMenuTextStyle),
      SizedBox(height: 20.0),
      Text('Get as many questions correct as you can in the chosen duration!'),
      SizedBox(height: 20.0),
      Text('Good luck!'),
      SizedBox(height: 30.0),
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
