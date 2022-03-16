import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../components/pop_up_components/pop_up_content_builder.dart';

class EndlessDifficultyInstructions extends PopUpContentBuilder {

  final BuildContext context;

  /// The function that gets called when the selection is made
  final Function(String) onSelection;

  EndlessDifficultyInstructions({required this.context, required this.onSelection});

  /// Sets up the start menu
  @override
  void buildMenu() {
    text = Column(
      children: const [
        Text('Difficulty Selector', style: pauseMenuTextStyle),
        SizedBox(height: 50.0),
      ],);

    options = [
      ElevatedButton(
        child: const Text('Easy'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          removeMenu();
          onSelection('easy');
        },
      ),
      ElevatedButton(
        child: const Text('Medium'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          removeMenu();
          onSelection('medium');
        },
      ),
      ElevatedButton(
        child: const Text('Hard'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          removeMenu();
          onSelection('hard');
        },
      ),
    ];
  }
}