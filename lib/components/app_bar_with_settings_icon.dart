import 'package:flutter/material.dart';

import '../../components/pop_up_components/pop_up_controller.dart';
import '../../screens/settings_screen.dart';

const double appBarHeight = 60.0; //Default value

/// The AppBar contained at the top of multiple practice menu screens.
///
/// It contains the relevant screen's title text as a parameter to the class,
/// as well as a back arrow that comes as standard and a settings icon,
/// which when clicked on takes yu to the settings screen.
class AppBarWithSettingsIcon extends StatelessWidget implements PreferredSizeWidget{
  /// An id used to identify the AppBar
  static const id = 'app_bar_with_settings_icon';
  /// The key for the settings icon button.
  static const navigateToSettingsButtonKey = Key('navigateToSettings');
  ///The text to be contained in the AppBar
  final Text titleText;
  ///Instruction screen to use for page
  final PopUpController instructionScreen;
  ///The constructor, which takes the titleText as a parameter of type Text
  const AppBarWithSettingsIcon(this.titleText, this.instructionScreen, {Key? key}) : super(key: key);

  ///The "default" height of the AppBar
  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);

  ///Builds the AppBar onto the screen it is being used in.
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleText,
      centerTitle: true,
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              //Navigator.pushNamed(context, instructionScreen);
              instructionScreen.show();
            },
        ),
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () {
            Navigator.pushNamed(
                context, SettingsScreen.id); //Replace screen name
          },
          key: navigateToSettingsButtonKey,
        )
      ],
    );
  }
}