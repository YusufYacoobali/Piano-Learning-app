import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/note_helper_screen.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';

///This screen is the note_helper selection screen which contain buttons.
class _NoteHelperMenuScreenState extends State<NoteHelperMenuScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///Builds the screen with appBar and note_helper buttons.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Helper'),
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

  ///A button that will be route to specific screen of bass note_helper.
  Widget bassClefNoteHelperbutton() {
    return MenuButton(
      buttonChild: const ButtonText(buttonText: 'Bass Clef Notes'),
      onPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const NoteHelperScreen(
              helperNum: 1,
            );
          }),
        );
      },
    );
  }

  ///A button that will be route to specific screen of clef note_helper.
  Widget trebleClefNoteHelperbutton() {
    return MenuButton(
      buttonChild: const ButtonText(buttonText: 'Treble Clef Notes'),
      onPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const NoteHelperScreen(
              helperNum: 2,
            );
          }),
        );
      },
    );
  }

  /// A button that will be routed to a specific screen of the note types note_helper.
  Widget noteTypesHelperButton() {
    return MenuButton(
      buttonChild: const ButtonText(buttonText: 'Note Types'),
      onPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const NoteHelperScreen(
              helperNum: 3,
            );
          }),
        );
      },
    );
  }
}

class NoteHelperMenuScreen extends StatefulWidget {
  static const String id = 'helper_menu_screen';
  const NoteHelperMenuScreen({Key? key}) : super(key: key);

  @override
  _NoteHelperMenuScreenState createState() => _NoteHelperMenuScreenState();
}
