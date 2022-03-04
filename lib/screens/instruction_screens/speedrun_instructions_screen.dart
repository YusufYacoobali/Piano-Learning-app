import 'package:flutter/material.dart';
import '../speedrun_menu_screen.dart';

class SpeedrunInstructions extends StatelessWidget {
  const SpeedrunInstructions({Key? key}) : super(key: key);
  static const id = 'speedrun_instruction_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speed-run Mode'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, SpeedrunMenuScreen.id);
              },
              child: const Text('Next'))
        ],
      ),
      body: const SafeArea(
          child: Text('Choose the duration you want to try playing for!')
      ),
    );
  }
}
