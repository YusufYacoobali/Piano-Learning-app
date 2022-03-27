import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/helper_screen.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';

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
            bassClefNoteHelperbutton(),
            trebleClefNoteHelperbutton(),
            noteTypesHelperButton(),
          ],
        ),
      ),
    );
  }

  ///A button that will be route to specific screen of bass helper.
  Widget bassClefNoteHelperbutton() {
    return MenuButton(
      buttonChild: const ButtonText(buttonText: 'Bass clef note'),
      onPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const HelperScreen(
              helperNum: 1,
            );
          }),
        );
      },
    );
  }

  ///A button that will be route to specific screen of clef helper.
  Widget trebleClefNoteHelperbutton() {
    return MenuButton(
      buttonChild: const ButtonText(buttonText: 'Treble clef note'),
      onPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const HelperScreen(
              helperNum: 2,
            );
          }),
        );
      },
    );
  }

  /// A button that will be routed to a specific screen of the note types helper.
  Widget noteTypesHelperButton() {
    return MenuButton(
      buttonChild: const ButtonText(buttonText: 'Note types'),
      onPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const HelperScreen(
              helperNum: 3,
            );
          }),
        );
      },
    );
  }
}

class HelperMenuScreen extends StatefulWidget {
  static const String id = 'helper_menu_screen';
  const HelperMenuScreen({Key? key}) : super(key: key);

  @override
  _HelperMenuScreenState createState() => _HelperMenuScreenState();
}
