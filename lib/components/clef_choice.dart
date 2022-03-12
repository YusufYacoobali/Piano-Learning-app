import 'package:flutter/material.dart';
import '../components/sheet_music_components/note.dart';

import '../constants.dart';

class _ClefChoiceState extends State<ClefChoice> {

  /// A play button from the paused menu
  Widget getTrebleClefButton() {
    return ElevatedButton(
      key: const Key('treble'),
      child: const Text('Treble'),
      style: pauseMenuButtonStyle,
      onPressed: () {
        widget.removeMenu(Clef.treble);
      },
    );
  }
  /// A play button from the paused menu
  Widget getBassClefButton() {
    return ElevatedButton(
      key: const Key('bass'),
      child: const Text('Bass'),
      style: pauseMenuButtonStyle,
      onPressed: () {
        widget.removeMenu(Clef.bass);
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
                  const Text('Endless Mode', style: pauseMenuTextStyle),
                  const SizedBox(height: 10.0),
                  const Text('Get as many questions correct as you can before your lives run out!'),
                  const SizedBox(height: 50.0),
                  const Text('Select the clef', style: pauseMenuTextStyle),
                  const SizedBox(height: 5.0),
                  getTrebleClefButton(),
                  const SizedBox(height: 5.0),
                  getBassClefButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ClefChoice extends StatefulWidget {
  static const String id = 'clef_choice';
  final Function removeMenu;

  const ClefChoice({
    Key? key,
    required this.removeMenu,
  }) : super(key: key);

  @override
  _ClefChoiceState createState() => _ClefChoiceState();
}