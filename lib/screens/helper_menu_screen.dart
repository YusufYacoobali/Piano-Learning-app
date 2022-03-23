import 'package:flutter/material.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/screens/helper_screen.dart';

///This screen is the helper selection screen which contain buttons.
class _HelperMenuScreenState extends State<HelperMenuScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///Builds the screen with appBar and helper buttons.
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

  ///A button that will be route to specific screen of bass helper.
  Widget bassNoteHelperbutton() {
    return ElevatedButton(
        key: const Key('bass helper button'),
        child: const Text('Bass note', style: helperMenuTextStyle),
        style: helperMenuButonStyle,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const HelperScreen(
                helperNum: 1,
              );
            }),
          );
        });
  }

  ///A button that will be route to specific screen of clef helper.
  Widget clefNoteHelperbutton() {
    return ElevatedButton(
        key: const Key('clef helper button'),
        child: const Text(
          'Clef note',
          style: helperMenuTextStyle,
        ),
        style: helperMenuButonStyle,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const HelperScreen(
                helperNum: 2,
              );
            }),
          );
        });
  }
}

class HelperMenuScreen extends StatefulWidget {
  static const String id = 'helper_menu_screen';
  const HelperMenuScreen({Key? key}) : super(key: key);

  @override
  _HelperMenuScreenState createState() => _HelperMenuScreenState();
}
