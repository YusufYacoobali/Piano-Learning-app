import 'package:flutter/material.dart';
import '../menu_screen.dart';

class EndlessInstructions extends StatelessWidget {
  const EndlessInstructions({Key? key}) : super(key: key);
  static const id = 'endless_instruction_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Endless Mode'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, MenuScreen.id);
              },
              child: const Text('Next'))
        ],
      ),
      body: const SafeArea(
          child: Text('Get as many questions correct as you can!')
      ),
    );
  }
}