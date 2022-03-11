import 'package:flutter/material.dart';

class QuizInstruction extends StatelessWidget {
  const QuizInstruction({Key? key}) : super(key: key);
  static const id = 'quiz_instruction_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Mode'),
      ),
      body: SafeArea(
        child: Container(
          child: const Center(
            child: Text('Practice the notes like in the lessons for each lesson, or choose '
                '\'Random mixed quiz\' to practice questions from all the lessons.\n'
                '\n Good luck!',
            textAlign: TextAlign.center,)
          ),
          margin: const EdgeInsets.all(50),
        )
      ),
    );
  }
}
