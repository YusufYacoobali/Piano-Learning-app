import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/sheet_music_components/play_along_hit_counter.dart';

import '../../screens/play_along_menu_screen.dart';
import '../../components/pop_up_components/pop_up_content_builder.dart';
import '../../constants.dart';
import '../../screens/menu_screen.dart';

class PlayAlongEndingInstructions extends PopUpContentBuilder {

  final BuildContext context;

  /// Plays the song again
  final VoidCallback restart;

  final PlayAlongHitCounter hitCounter;

  PlayAlongEndingInstructions({required this.context, required this.restart, required this.hitCounter});

  /// Sets up the end menu
  @override
  void buildMenu() {
    String percentage = ((hitCounter.score/hitCounter.numNotes) * 100).toStringAsFixed(1);
    text = Column(
        children: [
          const Text('Song Finished', style: pauseMenuTextStyle),
          const SizedBox(height: 10.0),
          Text('You got: $percentage%'),
          const SizedBox(height: 10.0),
          Text('High score: ${hitCounter.highScore}%'),
          const SizedBox(height: 20.0),
          const Text('Choose an option: ', style: pauseMenuTextStyle),
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