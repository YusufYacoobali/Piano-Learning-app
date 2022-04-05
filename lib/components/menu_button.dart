import 'package:flutter/material.dart';
import '../constants.dart';

/// Styling for the buttons that appear on menu screens.
class MenuButton extends StatelessWidget {
  /// The text to be displayed on the button, which may be wrapped in a formatting widget.
  final Widget buttonChild;
  /// A function to be called when the button is pressed.
  final VoidCallback onPress;

  /// The constructor for this class.
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
