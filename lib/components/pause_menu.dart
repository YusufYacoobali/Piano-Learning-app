import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/lesson_menu_screen.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';

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
      icon: const Icon(
        Icons.home,
        size: 20.0,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo.shade400,
        onPrimary: Colors.grey.shade300,
        fixedSize: const Size(180.0, 30.0),
      ),
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
      icon: const Icon(
        Icons.play_arrow,
        size: 20.0,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo.shade400,
        onPrimary: Colors.grey.shade300,
        fixedSize: const Size(180.0, 30.0),
      ),
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
      icon: const Icon(
        Icons.auto_stories_outlined,
        size: 20.0,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo.shade400,
        onPrimary: Colors.grey.shade300,
        fixedSize: const Size(180.0, 30.0),
      ),
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
      style: TextStyle(fontSize: 40.0, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Card(
          color: Colors.black.withOpacity(0.8),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 80.0, vertical: 30.0),
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
      ],
    );
  }
}
