import 'package:flutter/material.dart';

import '../../components/intermediate_menus/display_intermediate_menu.dart';
import '../../components/intermediate_menus/play_along_instructions_builder.dart';

/// This file creates the instructions for the play along mode.

class _PlayAlongInstructionsState extends State<PlayAlongInstructions> {

  late final DisplayIntermediateMenu _instructionsMenu;

  @override
  void initState() {
    super.initState();
    PlayAlongStartMenuBuilder startMenuBuilder = PlayAlongStartMenuBuilder(context: context);

    DisplayIntermediateMenu _instructionsMenu = DisplayIntermediateMenu(context: context, menuBuilder: startMenuBuilder);
    _instructionsMenu.show();
  }

  @override
  void dispose() {
    super.dispose();
    _instructionsMenu.delete();
  }

  /// Builds the appBar and container with the text
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PlayAlongInstructions extends StatefulWidget {
  static const String id = 'play_along_instructions_screen';

  const PlayAlongInstructions({Key? key}) : super(key: key);

  @override
  _PlayAlongInstructionsState createState() => _PlayAlongInstructionsState();
}