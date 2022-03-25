import 'package:flutter/material.dart';
import 'keyboard.dart';

class PageKeyboard extends StatefulWidget {
  static const String id = 'pageKeyboard';

  final Function(String) callFunction;

  const PageKeyboard(this.callFunction, {Key? key}) : super(key: key);

  @override
  State<PageKeyboard> createState() => _PageKeyboardState();
}

class _PageKeyboardState extends State<PageKeyboard> {

  ///manages swipe detection
  final controller = PageController(
    initialPage: 2,
  );

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


