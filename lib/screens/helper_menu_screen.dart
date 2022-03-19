import 'package:flutter/material.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/screens/helper_screen.dart';
//import 'package:sight_reading_app/screens/menu_screen.dart';

class _HelperMenuScreenState extends State<HelperMenuScreen> {
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
        title: const Text('Helper'),
      ),
      body: SafeArea(
        child: GridView.count(
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height * (5 / 7)),
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              width: 50.0,
              height: 50.0,
              decoration: cardBackground,
              padding: const EdgeInsets.all(8),
              child: bassNoteHelperbutton(),
            ),
            Container(
              width: 50.0,
              height: 50.0,
              decoration: cardBackground,
              padding: const EdgeInsets.all(8),
              child: clefNoteHelperbutton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget bassNoteHelperbutton() {
    return ElevatedButton(
        child: const Text('Bass note', style: helperMenuTextStyle),
        style: helperMenuButonStyle,
        onPressed: () {
          Navigator.pushNamed(context, HelperScreen.id);
        });
  }

  Widget clefNoteHelperbutton() {
    return ElevatedButton(
        child: const Text(
          'Clef note',
          style: helperMenuTextStyle,
        ),
        style: helperMenuButonStyle,
        onPressed: () {
          Navigator.pushNamed(context, HelperScreen.id);
        });
  }
}

class HelperMenuScreen extends StatefulWidget {
  static const String id = 'helper_menu_screen';
  const HelperMenuScreen({Key? key}) : super(key: key);

  @override
  _HelperMenuScreenState createState() => _HelperMenuScreenState();
}
