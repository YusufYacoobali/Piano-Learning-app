import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/endless_mode_screen.dart';

import '../../constants.dart';
import '../../screens/menu_screen.dart';

class _EndlessModeEndState extends State<EndlessModeEnd> {

  /// A play button from the paused menu
  Widget getTryAgainButton() {
    return ElevatedButton(
      key: const Key('try again'),
      child: const Text('Try Again'),
      style: pauseMenuButtonStyle,
      onPressed: () {
        widget.removeMenu();
        Navigator.pop(context);
        Navigator.pushNamed(context, EndlessModeScreen.id);
      },
    );
  }
  /// A play button from the paused menu
  Widget getExitButton() {
    return ElevatedButton(
      key: const Key('exit'),
      child: const Text('Exit'),
      style: pauseMenuButtonStyle,
      onPressed: () {
        widget.removeMenu();
        Navigator.popUntil(context, ModalRoute.withName(MenuScreen.id));
      },
    );
  }

  /// Card contain the menu title and three buttons.
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.black.withOpacity(0.8),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            decoration: cardBackground,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: menuLength, vertical: menuWidth),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Aww, better luck next time', style: pauseMenuTextStyle),
                  const SizedBox(height: 10.0),
                  Text('Your score: ${widget.numRight.toString()}'),
                  const SizedBox(height: 10.0),
                  Text('High Score: ${widget.highScore.toString()}'),
                  const SizedBox(height: 50.0),
                  getTryAgainButton(),
                  const SizedBox(height: 5.0),
                  getExitButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EndlessModeEnd extends StatefulWidget {
  static const String id = 'endless_mode_end';
  final Function removeMenu;
  final int numRight;
  final int highScore;

  const EndlessModeEnd({
    Key? key,
    required this.removeMenu,
    required this.numRight,
    required this.highScore,
  }) : super(key: key);

  @override
  _EndlessModeEndState createState() => _EndlessModeEndState();
}