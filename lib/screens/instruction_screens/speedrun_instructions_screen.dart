import 'package:flutter/material.dart';

class SpeedrunInstructions extends StatelessWidget {
  const SpeedrunInstructions({Key? key}) : super(key: key);
  static const id = 'speedrun_instruction_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speed-run Mode'),
      ),
      body: SafeArea(
        child: Container(
          child: const Center(
            child: Text('Get as many questions correct as you can in the chosen duration!\n'
                '\nGood luck!',
            textAlign: TextAlign.center,)
          ),
          margin: const EdgeInsets.all(50),
        )
      ),
    );
  }
}
