import 'package:flutter/material.dart';

/// This file creates the instructions for the endless mode.

class EndlessInstructions extends StatelessWidget {
  const EndlessInstructions({Key? key}) : super(key: key);
  static const id = 'endless_instruction_screen';

  /// Builds the appBar and container with the text
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Endless Mode'),
      ),
      body: SafeArea(
        child: Container(
          child: const Center(
            child: Text('Get as many questions correct as you can before your lives run out!\n'
                '\n Good luck!')
          ),
          margin: const EdgeInsets.all(50),
        )
      ),
    );
  }
}
