import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/lesson_screen.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';

class PauseMenu extends StatefulWidget {
  const PauseMenu({Key? key}) : super(key: key);
  @override
  PauseMenuState createState() => PauseMenuState();
}

class PauseMenuState extends State<PauseMenu> {
  OverlayEntry? entry;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8.0),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => showMenu());
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showMenu() {
    final overlay = Overlay.of(context)!;

    entry = OverlayEntry(
      builder: (context) => buildMenu(context),
    );
    overlay.insert(entry!);
  }

  Widget buildMenu(BuildContext context) => Stack(
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
                  const SizedBox(height: 10.0),
                  getHomeButton(),
                  const SizedBox(height: 10.0),
                  getPlayButton(),
                ],
              ),
            ),
          ),
        ],
      );

  void removeMenu() {
    entry?.remove();
    entry = null;
  }

  Widget getMenuText() {
    return const Text(
      'Paused',
      style: TextStyle(fontSize: 40.0, color: Colors.white),
    );
  }

  Widget getHomeButton() {
    return ElevatedButton.icon(
      label: const Text('Main menu'),
      icon: const Icon(
        Icons.home,
        size: 20.0,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo.shade400,
        onPrimary: Colors.grey.shade300,
        fixedSize: const Size(150.0, 50.0),
      ),
      onPressed: () {
        Navigator.popUntil(context, ModalRoute.withName(MenuScreen.id));
        removeMenu();
      },
    );
  }

  Widget getPlayButton() {
    return ElevatedButton.icon(
      label: const Text('Continue'),
      icon: const Icon(
        Icons.play_arrow,
        size: 20.0,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo.shade400,
        onPrimary: Colors.grey.shade300,
        fixedSize: const Size(150.0, 50.0),
      ),
      onPressed: () {
        Navigator.popUntil(context, ModalRoute.withName(LessonScreen.id));
        removeMenu();
      },
    );
  }
}
