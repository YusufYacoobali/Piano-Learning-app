import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/lesson_menu_screen.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';
import 'package:sight_reading_app/constants.dart';

class PauseMenu extends StatefulWidget {
  static const String id = 'pause_menu';
  final VoidCallback removeMenu;
  final VoidCallback continueOnPressed;

  const PauseMenu({
    Key? key,
    required this.removeMenu,
    required this.continueOnPressed,
  }) : super(key: key);

  @override
  _PauseMenuState createState() => _PauseMenuState();
}

class _PauseMenuState extends State<PauseMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget getHomeButton() {
    return ElevatedButton.icon(
      key: const Key('home button'),
      label: const Text('Main menu'),
      icon: pauseMenuHomeIcon,
      style: pauseMenuButtonStyle,
      onPressed: () {
        Navigator.popUntil(context, ModalRoute.withName(MenuScreen.id));
        widget.removeMenu();
      },
    );
  }

  Widget getPlayButton() {
    return ElevatedButton.icon(
      key: const Key('play button'),
      label: const Text('Continue'),
      icon: pauseMenuPlayIcon,
      style: pauseMenuButtonStyle,
      onPressed: () {
        widget.continueOnPressed();
        widget.removeMenu();
      },
    );
  }

  Widget getLessonSelectionButton() {
    return ElevatedButton.icon(
      key: const Key('lesson selection button'),
      label: const Text('Back to Lessons'),
      icon: pauseMenuSelectionIcon,
      style: pauseMenuButtonStyle,
      onPressed: () {
        Navigator.popUntil(context, ModalRoute.withName(LessonMenuScreen.id));
        widget.removeMenu();
      },
    );
  }

  Widget getMenuText() {
    return const Text(
      'Paused',
      key: Key('menu text'),
      style: pauseMenuTextStyle,
    );
  }

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
                  getMenuText(),
                  const SizedBox(height: 5.0),
                  getHomeButton(),
                  const SizedBox(height: 3.0),
                  getPlayButton(),
                  const SizedBox(height: 3.0),
                  getLessonSelectionButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
