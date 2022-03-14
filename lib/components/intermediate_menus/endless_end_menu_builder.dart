import 'package:flutter/material.dart';

import '../../components/endless_mode_components/endless_score_counter.dart';
import '../../components/intermediate_menus/intermediate_menu_builder.dart';
import '../../constants.dart';
import '../../screens/endless_mode_screen.dart';
import '../../screens/menu_screen.dart';

class EndlessEndMenuBuilder extends IntermediateMenuBuilder {

  /// The counter to get the high score and players score
  final EndlessScoreCounter counter;

  final BuildContext context;

  EndlessEndMenuBuilder({required this.context, required this.counter});

  /// Sets up the end menu
  @override
  void buildMenu() {
    text = Column(
        children: [
          const Text('Aww, better luck next time', style: pauseMenuTextStyle),
          const SizedBox(height: 10.0),
          Text('Your score: ${counter.score.toString()}'),
          const SizedBox(height: 10.0),
          Text('High Score: ${counter.highScore.toString()}'),
          const SizedBox(height: 50.0),
        ]
    );

    options = [
      ElevatedButton(
        child: const Text('Try Again'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          removeMenu();
          Navigator.pop(context);
          Navigator.pushNamed(context, EndlessModeScreen.id);
        },
      ),
      ElevatedButton(
        child: const Text('Exit'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          removeMenu();
          Navigator.popUntil(context, ModalRoute.withName(MenuScreen.id));
        },
      ),
    ];
  }
}