import 'package:flutter/material.dart';
import '../endless_mode_components/endless_score_counter.dart';
import '../../components/pop_up_components/pop_up_content_builder.dart';
import '../../constants.dart';
import '../../screens/endless_mode_screen.dart';
import '../../screens/menu_screen.dart';

/// A set of instructions to be run once an endless mode instance is finished.
///
/// An instance is 'finished' once the user makes a mistake.
/// This is an endless mode specific results screen that also shows the current high score.
class EndlessEndingInstructions extends PopUpContentBuilder {
  /// The counter to get the players score
  final EndlessScoreCounter counter;

  /// Gets context data from the endless mode instance.
  final BuildContext context;

  EndlessEndingInstructions({required this.context, required this.counter});

  /// Sets up the end menu
  @override
  void buildMenu() {
    String title = 'Aww, better luck next time';
    if (counter.score > counter.highScore) title = 'Well Done!';

    text = Column(children: [
      Text(title, style: pauseMenuTextStyle),
      const SizedBox(height: 10.0),
      Text('Your score: ${counter.score.toString()}'),
      const SizedBox(height: 10.0),
      Text('High Score: ${counter.highScore.toString()}'),
      const SizedBox(height: 50.0),
    ]);

    options = [
      ElevatedButton(
        child: const Text('Play Again'),
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
