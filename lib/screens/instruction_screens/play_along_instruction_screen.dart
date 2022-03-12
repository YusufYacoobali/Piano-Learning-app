import 'package:flutter/material.dart';

/// This file creates the instructions for the play along mode.

class PlayAlongInstructions extends StatelessWidget {
  const PlayAlongInstructions({Key? key}) : super(key: key);
  static const id = 'play_along_instructions_screen';

  /// Builds the appBar and container with the text
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play Along Mode'),
      ),
      body: SafeArea(
        child: Container(
          child: const Center(
            child: Text('Play the melody along with your chosen backing track.\n'
                '\n Have fun!',
            textAlign: TextAlign.center),
          ),
          margin: const EdgeInsets.all(50),
        )
      ),
    );
  }
}
