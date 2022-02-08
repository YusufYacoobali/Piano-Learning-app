import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:sight_reading_app/components/settings.dart';

class _SettingsScreenState extends State<SettingsScreen> {

  Settings settings = Settings();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _confirmReset(BuildContext context) {
    ElevatedButton cancelButton = ElevatedButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    ElevatedButton resetButton = ElevatedButton(
      child: const Text("Reset"),
      onPressed: () {
        setState(() => settings.setDefaultValues());
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Warning"),
      content: const Text("Resetting will delete all progress."),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: SettingsList(
          sections: [
            SettingsSection(
              title: const Text('General'),
              tiles: <SettingsTile>[

                SettingsTile.switchTile(
                  title: const Text('Sound'),
                  leading: const Icon(Icons.music_note_outlined),
                  initialValue: settings.getSound(),
                  onToggle: (value) => setState(() => settings.updateSound(value)),
                ),

                SettingsTile.navigation(
                  title: const Text('Volume'),
                  leading: const Icon(Icons.volume_up),
                  value: Column(
                    children: [
                      Slider(
                        max: 100,
                        min: 0,
                        value: settings.getVolume().toDouble(),
                        onChanged: (n) => setState(() => settings.updateVolume(n.toInt())
                        ),
                      ),
                      Center(
                        child: Text(settings.getVolume().toString()),
                      ),
                    ],
                  ),
                ),

                SettingsTile.navigation(
                  leading: const Icon(Icons.signal_cellular_alt_rounded),
                  title: const Text('Difficulty'),
                  value: DropdownButton(
                    value: settings.getCurrentDifficulty(),
                    items: settings.getDifficulties().map((option) {
                      return DropdownMenuItem(
                        child: Text(option.toString()),
                        value: option,
                      );
                    }).toList(),
                    onChanged: (level) =>
                        setState(() => settings.updateCurrentDifficulty(level!)),
                  ),
                ),

                SettingsTile.navigation(
                    title: const Text('Theme'),
                    leading: const Icon(Icons.format_paint),
                    value: DropdownButton(
                        value: settings.getCurrentTheme(),
                        items: settings.getThemes().map((option) {
                          return DropdownMenuItem(
                            child: Text(option.toString()),
                            value: option,
                          );
                        }).toList(),
                        onChanged: (colour) => setState(() => settings.updateCurrentTheme(colour!))
                    ),
                ),

                SettingsTile.navigation(
                  title: Center(
                    child: ElevatedButton(
                      child: const Text("Reset"),
                      onPressed: () => _confirmReset(context),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings_screen';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}
