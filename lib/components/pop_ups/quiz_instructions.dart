import 'package:flutter/material.dart';

import '../../components/pop_up_components/pop_up_content_builder.dart';
import '../../constants.dart';

class QuizInstructions extends PopUpContentBuilder {

  final BuildContext context;

  QuizInstructions({required this.context});

  /// Sets up the start menu
  @override
  void buildMenu() {
    text = Column(
        children: const [
          Text('Quiz Mode', style: pauseMenuTextStyle),
          SizedBox(height: 20.0),
          Text('Practice the notes like in the lessons for each lesson'),
          SizedBox(height: 10),
          Text('or choose ''\'Random mixed quiz\' to practice questions from all the lessons.'),
          SizedBox(height: 20.0),
          Text('Good luck!'),
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