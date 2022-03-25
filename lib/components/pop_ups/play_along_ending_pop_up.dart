import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/play_along_components/play_along_hit_counter.dart';

import '../../screens/play_along_menu_screen.dart';
import '../../components/pop_up_components/pop_up_content_builder.dart';
import '../../constants.dart';
import '../../screens/menu_screen.dart';

class PlayAlongEndingInstructions extends PopUpContentBuilder {

  final BuildContext context;

  /// Plays the song again
  final VoidCallback restart;

  /// Counts whether the notes where hit or missed
  final PlayAlongHitCounter hitCounter;

  final VoidCallback onBack;

  PlayAlongEndingInstructions({
    required this.context,
    required this.hitCounter,
    required this.restart,
    required this.onBack});

  /// Sets up the end menu
  @override
  void buildMenu() {
    String percentage = hitCounter.getScoreAsPercentage();
    if (percentage[percentage.length-1] == '0') {
      percentage = double.parse(percentage).round().toString();
    }
    text = Column(
        children: [
          const Text('Song Finished', style: pauseMenuTextStyle),
          const SizedBox(height: 10.0),
          Text('You got: $percentage%', style: pauseMenuTextStyle),
          const SizedBox(height: 20.0),
        ]
    );

    options = [
      ElevatedButton(
        child: const Text('Play Again'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          removeMenu();
          restart();
        },
      ),
      ElevatedButton(
        child: const Text('Play Another Song'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          onBack();
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