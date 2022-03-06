import 'package:flutter/material.dart';

import '../constants.dart';

class OptionButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const OptionButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  // build button for choice
//add value of answer in button
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: optionButtonColour,
          ),
          child: Text(
            buttonText,
            style: optionButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
