import 'package:flutter/material.dart';
import '../play_along_menu_screen.dart';

class PlayAlongInstructions extends StatelessWidget {
  const PlayAlongInstructions({Key? key}) : super(key: key);
  static const id = 'play_along_instructions_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play Along Mode'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, PlayAlongMenuScreen.id);
              },
              child: const Text('Next'))
        ],
      ),
      body: const SafeArea(
          child: Text('Choose the track you want to try playing!')
      ),
    );
  }
}
