import 'package:flutter/material.dart';
import '../constants.dart';

/// A box used to display the name of the app.
class AppNameBox extends StatelessWidget {
  const AppNameBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: boxMargin,
      padding: const EdgeInsets.all(20.0),
      decoration: menuButtonDeco,
      child: FittedBox(
        fit: BoxFit.contain,
        alignment: Alignment.center,
        child: Text(
          formattedAppName,
          style: appNameTextStyle,
        ),
      ),
    );
  }
}
