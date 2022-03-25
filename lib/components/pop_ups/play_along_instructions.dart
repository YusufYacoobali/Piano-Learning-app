import 'package:flutter/material.dart';

import '../../components/pop_up_components/pop_up_content_builder.dart';
import '../../constants.dart';

class PlayAlongInstructions extends PopUpContentBuilder {

  final BuildContext context;

  PlayAlongInstructions({required this.context});

  /// Sets up the start menu
  @override
  void buildMenu() {
    text = Column(
        children: const [
          Text('Play Along Mode', style: pauseMenuTextStyle),
          SizedBox(height: 20.0),
          Text('Play the melody along with your chosen backing track.'),
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