import 'package:flutter/material.dart';
import '../../components/pop_up_components/pop_up_content_builder.dart';
import '../../constants.dart';

/// A set of instructions the user can view to figure out what to do.
///
/// This is shown in the practice main menu screen as a (?) icon in the AppBar.
class PracticeMenuInstructions extends PopUpContentBuilder {
  final BuildContext context;

  PracticeMenuInstructions({required this.context});

  /// Sets up the instructions
  @override
  void buildMenu() {
    text = Column(children: const [
      Text('Practice Your Skills!', style: pauseMenuTextStyle),
      SizedBox(height: 20.0),
      Text(
          'Choose one of the four game modes to practice what you have learnt.'),
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
