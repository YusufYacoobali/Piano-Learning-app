import 'package:flutter/material.dart';
import 'keyboard.dart';

/// A 'page' of the full keyboard to be shown on the screen.
///
/// A 'page' represents an octave. By swiping left and right, you can access the other octaves available to the user.
class PageKeyboard extends StatefulWidget {
  static const String id = 'pageKeyboard';

  /// A function to be called for each keyboard 'page'
  final Function(String) callFunction;

  /// The octave 'page' the keyboard starts at.
  final int startOctave;

  const PageKeyboard(this.callFunction, {Key? key, this.startOctave = 4}) : super(key: key);

  @override
  State<PageKeyboard> createState() => _PageKeyboardState();
}

/// The state for the keyboard page.
class _PageKeyboardState extends State<PageKeyboard> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: widget.startOctave - 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        Keyboard(widget.callFunction, 1),
        Keyboard(widget.callFunction, 2),
        Keyboard(widget.callFunction, 3)
      ],
    );
  }
}


