import 'package:flutter/material.dart';
import 'package:sight_reading_app/constants.dart';

class MenuButtonText extends StatelessWidget {
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
