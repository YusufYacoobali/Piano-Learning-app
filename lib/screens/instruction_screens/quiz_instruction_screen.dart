import 'package:flutter/material.dart';
import '../quiz_selection_screen.dart';

class QuizInstruction extends StatelessWidget {
  const QuizInstruction({Key? key}) : super(key: key);
  static const id = 'quiz_instruction_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Mode'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, QuizSelectionScreen.id);
              },
              child: const Text('Next'))
        ],
      ),
      body: const SafeArea(
          child: Text('Select the quiz you want to practice!')
      ),
    );
  }
}
