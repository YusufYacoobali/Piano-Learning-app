import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/helper/helper_brain.dart';
import '../components/helper/helper_bass_note_list.dart';
import '../components/helper/helper_clef_note_list.dart';
import '../constants.dart';
import 'package:sight_reading_app/components/helper/helper_list.dart';
import 'package:audioplayers/audioplayers.dart';

///This screen creates helper screen
///It contains multiple cards with images, names and icon buttons
class HelperScreen extends StatefulWidget {
  static const String id = 'helper_screen';
  final int helperNum;
  const HelperScreen({Key? key, this.helperNum = 1}) : super(key: key);

  @override
  _HelperScreenState createState() => _HelperScreenState();
}

class _HelperScreenState extends State<HelperScreen> {
  final ScrollController _helperController = ScrollController();
  late HelperBrain helperBrain;
  late int index;
  final playSound = AudioCache();

  ///List of helper list available
  List<HelperList> helperList = [bassNoteImageNameList, clefNoteImageNameList];

  ///helperBrain provides the unique number for helping locate the list we need.
  @override
  void initState() {
    super.initState();
    int helperNum = widget.helperNum;
    helperBrain = HelperBrain(helpers: helperList[helperNum - 1]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///Builds the screen with appBar and multiple helper cards.
  ///Inside the helper card, it contains images, names and icon buttons.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Helper'),
      ),
      body: SafeArea(
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _helperController,
          radius: const Radius.circular(10),
          thickness: 5.0,
          child: SingleChildScrollView(
              controller: _helperController,
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  cardHelper(0),
                  cardHelper(1),
                  cardHelper(2),
                  cardHelper(3),
                  cardHelper(4),
                  cardHelper(5),
                  cardHelper(6),
                ],
              )),
        ),
      ),
    );
  }

  ///Create a card that holds note images, names and sound.
  Widget cardHelper(index) {
    return Center(
      key: const Key('card helper'),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: SizedBox(
          height: 300.0,
          width: 500.0,
          child: Container(
            decoration: cardBackground,
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    cardNoteImage(index),
                    Column(
                      children: [
                        cardText(index),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                cardPlayIcon(index),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///A widget that holds the name of the note.
  Widget cardText(index) {
    return Wrap(
      key: const Key('card text'),
      spacing: 10.0,
      runSpacing: 10.0,
      alignment: WrapAlignment.center,
      children: [
        Text(
          helperBrain.getHelperNoteName(index),
          style: helperTextStyle,
        ),
      ],
    );
  }

  ///A widget that holds the image path of the note.
  Widget cardNoteImage(index) {
    return ClipRRect(
      key: const Key('card note image'),
      borderRadius: BorderRadius.circular(15.0),
      child: SizedBox(
        height: 200.0,
        width: 250.0,
        child: Image.asset(
          helperBrain.getHelperNoteImageName(index),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  ///A widget that holds the icon button which can play note sound when pressed.
  Widget cardPlayIcon(index) {
    return IconButton(
      key: const Key('card play button'),
      icon: helpPlayButtonStyle,
      onPressed: () {
        playSound.play(helperBrain.getHelperNoteSoundName(index));
      },
    );
  }
}
