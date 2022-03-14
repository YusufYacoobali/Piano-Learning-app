import 'package:flutter/material.dart';

import '../../constants.dart';
import '../sheet_music_components/note.dart';
import '../../components/pop_up_components/pop_up_content_builder.dart';

class EndlessStartingInstructions extends PopUpContentBuilder {

  final BuildContext context;

  /// The function that gets called when the start menu is done
  final Function onStart;

  EndlessStartingInstructions({required this.context, required this.onStart});

  /// Sets up the start menu
  @override
  void buildMenu() {
    text = Column(
      children: const [
        Text('Endless Mode', style: pauseMenuTextStyle),
        SizedBox(height: 10.0),
        Text('Get as many questions correct as you can before your lives run out!'),
        SizedBox(height: 50.0),
        Text('Select The Clef', style: pauseMenuTextStyle),
      ],);

    options = [
      ElevatedButton(
        child: const Text('Treble'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          removeStartMenu(Clef.treble);
        },
      ),
      ElevatedButton(
        child: const Text('Bass'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          removeStartMenu(Clef.bass);
        },
      ),
    ];
  }

  /// Removes the start menu
  void removeStartMenu(Clef clef) {
    onStart(clef);
    removeMenu();
  }
}