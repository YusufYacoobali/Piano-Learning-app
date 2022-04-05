import 'package:flutter/material.dart';
import 'package:sight_reading_app/constants.dart';

/// Styling for the text displayed on menu buttons.
class MenuButtonText extends StatelessWidget {
  /// The text on the button.
  final String buttonText;

  const MenuButtonText({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonText,
      textAlign: TextAlign.center,
      style: buttonTextStyle,
    );
  }
}
