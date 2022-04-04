import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:provider/provider.dart';
import '../storage_reader_writer.dart';
import '../theme_listener.dart';
import '../constants.dart' as constants;

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings_screen';
  final Function(String)? onBack;

  const SettingsScreen({Key? key, this.onBack}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

/// A screen that contain the various settings that can be changed by the user.
///
/// There is also the option to reset a user's progress on this screen.
class _SettingsScreenState extends State<SettingsScreen> {
  /// The object that will read and write the settings to storage.
  StorageReaderWriter settings = StorageReaderWriter();

  @override
  void initState() {
    super.initState();
    settings.loadDataFromStorage().then((value) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Confirms if the settings should be reset.
  _confirmReset(BuildContext context, ThemeNotifier themeNotifier) {
    ElevatedButton cancelButton = ElevatedButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    ElevatedButton resetButton = ElevatedButton(
      child: const Text("Confirm"),
      onPressed: () {
        setState(() => settings.reset());
        Navigator.of(context, rootNavigator: true).pop('dialog');
        themeNotifier.theme = constants.defaultTheme;
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Warning"),
      content: const Text("Resetting will delete all progress and settings."),
      actions: [
        cancelButton,
        resetButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
              if (widget.onBack != null)
                widget.onBack!(settings.read('difficulty').toString());
            },
          ),
        ),
        body: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: SettingsList(
                  sections: [
                    SettingsSection(
                      title: const Text('General'),
                      tiles: <SettingsTile>[
                        /// Adjust difficulty
                        SettingsTile(
                          leading:
                              const Icon(Icons.signal_cellular_alt_rounded),
                          title: const Text('Difficulty'),
                          value: DropdownButton(
                              value: settings.read('difficulty'),
                              key: const Key('difficulty selector'),
                              items: constants.difficultyList.map((option) {
                                return DropdownMenuItem(
                                  child: Text(option.toString()),
                                  value: option,
                                );
                              }).toList(),
                              onChanged: (level) {
                                if (level != null) {
                                  settings
                                      .write('difficulty', level)
                                      .then((v) => setState(() => {}));
                                }
                              }),
                        ),

                        /// Adjust theme
                        SettingsTile(
                          title: const Text('Theme'),
                          leading: const Icon(Icons.format_paint),
                          key: const Key('theme selector'),
                          value: DropdownButton(
                              value: settings.read('theme'),
                              items: constants.themeColors.keys
                                  .toList()
                                  .map((option) {
                                return DropdownMenuItem(
                                  child: Text(option.toString()),
                                  value: option,
                                );
                              }).toList(),
                              onChanged: (theme) {
                                if (theme != null) {
                                  settings
                                      .write('theme', theme)
                                      .then((v) => setState(() => {}));
                                  themeNotifier.theme = theme.toString();
                                }
                              }),
                        ),

                        /// Reset progress
                        SettingsTile(
                          title: Center(
                            child: ElevatedButton(
                              child: const Text("Reset Progress"),
                              onPressed: () =>
                                  _confirmReset(context, themeNotifier),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
