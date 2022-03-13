import 'package:flutter/material.dart';

import '../../constants.dart';

class _IntermediateMenuState extends State<IntermediateMenu> {

  /// Combines the text and the options
  List<Widget> getDisplay() {
    List<Widget> display = [];
    display.add(widget.text);
    display.add(const SizedBox(height: 10,));
    for (Widget option in widget.options) {
      display.add(option);
      display.add(const SizedBox(height: 5,));
    }
    return display;
  }

  /// Card containing some text and options.
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child:Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.black.withOpacity(0.8),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              decoration: cardBackground,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: menuLength, vertical: menuWidth),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: getDisplay(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IntermediateMenu extends StatefulWidget {
  static const String id = 'clef_choice';
  final List<Widget> options;
  final Widget text;
  final Function removeMenu;

  const IntermediateMenu({
    Key? key,
    required this.text,
    required this.options,
    required this.removeMenu,
  }) : super(key: key);

  @override
  _IntermediateMenuState createState() => _IntermediateMenuState();
}