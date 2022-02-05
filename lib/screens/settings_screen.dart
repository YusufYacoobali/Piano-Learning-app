import 'package:flutter/material.dart';

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read That Sheet'),
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Settings PAGE',
            ),
            ElevatedButton(onPressed: () {}, child: Text('BACK TO HOME')),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings_screen';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}
