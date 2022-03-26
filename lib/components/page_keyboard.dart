import 'package:flutter/material.dart';
import 'keyboard.dart';

class PageKeyboard extends StatefulWidget {
  static const String id = 'pageKeyboard';

  final Function(String) callFunction;

  final int startOctave;

  const PageKeyboard(this.callFunction, {Key? key, this.startOctave = 4}) : super(key: key);

  @override
  State<PageKeyboard> createState() => _PageKeyboardState();
}

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


