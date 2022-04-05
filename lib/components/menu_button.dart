import 'package:flutter/material.dart';
import '../constants.dart';

class MenuButton extends StatelessWidget {
  final Widget buttonChild;
  final VoidCallback onPress;

  const MenuButton({
    Key? key,
    required this.buttonChild,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        margin: boxMargin,
        decoration: menuButtonDeco,
        child: FittedBox(
          fit: BoxFit.contain,
          alignment: Alignment.center,
          child: buttonChild,
        ),
      ),
    );
  }
}
