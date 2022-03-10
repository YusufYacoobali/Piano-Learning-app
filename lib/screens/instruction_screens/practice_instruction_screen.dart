import 'package:flutter/material.dart';

class PracticeInstructions extends StatelessWidget {
  const PracticeInstructions({Key? key}) : super(key: key);
  static const id = 'practice_instruction_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice your skills!'),
      ),
      body: SafeArea(
        child: Container(
          child: const Center(
            child: Text('Choose one of the four game modes to practice what you have learnt.',
            textAlign: TextAlign.center),
          ),
          margin: const EdgeInsets.all(50),
        ),
      ),
    );
  }
}
