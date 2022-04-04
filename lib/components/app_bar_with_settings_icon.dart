import 'package:flutter/material.dart';
import '../../components/pop_up_components/pop_up_controller.dart';
import '../../screens/settings_screen.dart';

/// The default value for the height of the AppBar.
const double appBarHeight = 60.0;

/// The AppBar contained at the top of multiple practice menu screens.
///
/// It contains the relevant screen's title text as a parameter to the class,
/// as well as a back arrow that comes as standard and a settings icon,
/// which when clicked on takes you to the settings screen.
class AppBarWithSettingsIcon extends StatefulWidget
    implements PreferredSizeWidget {
  /// An id used to identify the AppBar.
  static const id = 'app_bar_with_settings_icon';

  /// The key for the settings icon button.
  static const navigateToSettingsButtonKey = Key('navigateToSettings');

  /// The text to be contained in the AppBar.
  final Text titleText;

  /// Instruction screen to use for page.
  final PopUpController instructionScreen;

  /// A function to be run whenever the screen the AppBar is on is deleted.
  final Function(String)? onScreenDelete;

  ///The constructor.
  const AppBarWithSettingsIcon(this.titleText, this.instructionScreen,
      {Key? key, this.onScreenDelete})
      : super(key: key);

  @override
  _AppBarWithSettingsIconState createState() => _AppBarWithSettingsIconState();

  ///The "default" height of the AppBar.
  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}

class _AppBarWithSettingsIconState extends State<AppBarWithSettingsIcon> {
  ///Builds the AppBar onto the screen it is being used in.
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget.titleText,
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.help_outline),
          onPressed: () {
            widget.instructionScreen.show();
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () {
            if (widget.onScreenDelete != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(
                      onBack: widget.onScreenDelete,
                    ),
                  ));
            } else {
              Navigator.pushNamed(
                  context, SettingsScreen.id); //Replace screen name
            }
          },
          key: AppBarWithSettingsIcon.navigateToSettingsButtonKey,
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.instructionScreen.delete();
  }
}
