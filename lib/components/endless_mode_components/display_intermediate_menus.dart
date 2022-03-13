import 'package:flutter/material.dart';

import 'endless_score_counter.dart';
import 'intermediate_menu.dart';
import '../../constants.dart';
import '../../screens/endless_mode_screen.dart';
import '../../screens/menu_screen.dart';
import '../sheet_music_components/note.dart';

class DisplayIntermediateMenus {
  /// The clef chooser overlay
  late final OverlayEntry _startMenu;

  /// The end screen overlay
  late final OverlayEntry _endMenu;

  final BuildContext context;

  /// Counts the number of notes successfully presses
  final EndlessScoreCounter counter;

  /// The start menu
  late final IntermediateMenu _start;

  /// The end menu
  late final IntermediateMenu _end;

  /// The function that gets called when the game starts
  final Function onStart;

  /// Whether the end menu is built
  bool _isEndMenuBuilt = false;

  DisplayIntermediateMenus({required this.context, required this.counter, required this.onStart}) {
    createScreens();
    buildStartMenu();
  }

  /// Sets up the start menu
  void buildStartMenu() {
    Widget text = Column(
    children: const [
    Text('Endless Mode', style: pauseMenuTextStyle),
    SizedBox(height: 10.0),
    Text('Get as many questions correct as you can before your lives run out!'),
    SizedBox(height: 50.0),
    Text('Select The Clef', style: pauseMenuTextStyle),
    ],);

    List<Widget> options = [
      ElevatedButton(
        child: const Text('Treble'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          _removeStartMenu(Clef.treble);
        },
      ),
      ElevatedButton(
        child: const Text('Bass'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          _removeStartMenu(Clef.bass);
          },
      ),
    ];

    _start = IntermediateMenu(
      text: text,
      options: options,
      removeMenu: _removeStartMenu,
    );
  }

  /// Sets up the end menu
  void buildEndMenu() {
    Widget text = Column(
      children: [
        const Text('Aww, better luck next time', style: pauseMenuTextStyle),
        const SizedBox(height: 10.0),
        Text('Your score: ${counter.score.toString()}'),
        const SizedBox(height: 10.0),
        Text('High Score: ${counter.highScore.toString()}'),
        const SizedBox(height: 50.0),
      ]
    );

    List<Widget> options = [
      ElevatedButton(
        child: const Text('Try Again'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          _removeEndMenu;
          Navigator.pop(context);
          Navigator.pushNamed(context, EndlessModeScreen.id);
        },
      ),
      ElevatedButton(
        child: const Text('Exit'),
        style: pauseMenuButtonStyle,
        onPressed: () {
          _removeEndMenu();
          Navigator.popUntil(context, ModalRoute.withName(MenuScreen.id));
        },
      ),
    ];

    _end = IntermediateMenu(
      text: text,
      options: options,
      removeMenu: _removeStartMenu,
    );
  }

  void createScreens() {
    _endMenu = OverlayEntry(
      builder: (context) => _end,
    );

    _startMenu = OverlayEntry(
      builder: (context) => _start,
    );
  }

  /// Shows the start menu
  void showStartMenu() {
    final overlay = Overlay.of(context)!;
    overlay.insert(_startMenu);
  }

  /// Removes the start menu
  void _removeStartMenu(Clef clef) {
    onStart(clef);
    _startMenu.remove();
  }

  /// Shows the end screen
  void showEndMenu() {
    if (!_isEndMenuBuilt) {
      _isEndMenuBuilt = true;
      buildEndMenu();
    }
    if (!_endMenu.mounted) {
      final overlay = Overlay.of(context)!;
      overlay.insert(_endMenu);
    }
  }

  /// Removes the end screen
  void _removeEndMenu() {
    _endMenu.remove();
  }

  /// Gets rid of the overlays if they are visible
  void deleteScreens() {
    if (_startMenu.mounted) {
      _startMenu.remove();
    }
    if (_endMenu.mounted) {
      _endMenu.remove();
    }
  }

}