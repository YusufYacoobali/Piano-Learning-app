import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/helper/helper_brain.dart';
import 'package:sight_reading_app/components/sheet_music_components/music_sheet.dart';
import 'package:sight_reading_app/components/sheet_music_components/note.dart';
import '../components/helper/helper_bass_note_list.dart';
import '../components/helper/helper_clef_note_list.dart';

///import blank helper list
import '../components/helper/helper_note_type_list.dart';
import '../constants.dart';
import 'package:sight_reading_app/components/helper/helper_list.dart';
import 'package:audioplayers/audioplayers.dart';

///This screen creates helper screen
///It contains multiple cards with note images, names and icon buttons

class _HelperScreenState extends State<HelperScreen> {
  final ScrollController _helperController = ScrollController();

  late HelperBrain helperBrain;

  final playSound = AudioCache();

  /// Make widget visiable or not.
  late bool isVisiable;

  /// This number is representing the current position of the helper list
  late int index;

  ///List of helper list available
  List<HelperList> helperList = [
    bassNoteImageNameList,
    clefNoteImageNameList,
    noteTypeList
  ];

  ///helperBrain provides the unique number for helping locate the list we need.
  @override
  void initState() {
    super.initState();
    int helperNum = widget.helperNum;

    /// Display different helper list.
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
              children: getAllHelperCards(),
            ),
          ),
        ),
      ),
    );
  }

  ///Create a card that holds note images, names and sound.
  Widget cardHelper(index) {
    return Center(
      child: Card(
        key: const Key('card'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: FittedBox(
          child: Container(
            decoration: cardBackground,
            child: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20.0),
                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      children: [
                        cardNoteImage(index),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(height: 30.0),
                            cardText(index),
                            const SizedBox(height: 5.0),
                            if (getWidgetVisiable())
                              cardPlayIcon(index)
                            else
                              cardDescription(index),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// List of Card widgets to display.
  List<Widget> getAllHelperCards() {
    List<Widget> allHelperCards = [];
    for (int i = 0; i < helperBrain.getNumbersOfHelperNote(); ++i) {
      allHelperCards.add(cardHelper(i));
    }
    return allHelperCards;
  }

  ///A widget that holds the name of the note.
  Widget cardText(index) {
    return FittedBox(
      key: Key('card text: $index'),
      child: Text(
        helperBrain.getHelperNoteName(index),
        style: helperTextStyle,
      ),
    );
  }

  ///NEW FEATURE:
  ///Widget for helper description
  ///fixed size of text because of SizeBox
  Widget cardDescription(index) {
    return Container(
      height: 150,
      padding: const EdgeInsets.fromLTRB(20, 15, 15, 10),
      width: 250,
      key: Key('card description: $index'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              helperBrain.getHelperDescription(index),
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }

  ///A widget that holds the image of the note.
  Widget cardNoteImage(index) {
    Clef clef = Clef.treble;
    if (widget.helperNum == 1) {
      clef = Clef.bass;
    }

    NextNoteNotifier noteNotifier = NextNoteNotifier();
    noteNotifier.setNextNote(helperBrain.getHelperNoteImageName(index));
    MusicSheet sheet = MusicSheet(noteNotifier, clef);

    /// Makes rounded border for helper images
    sheet.changeToRoundedBorder();

    return SizedBox(
      key: const Key('card image'),
      height: 200.0,
      width: 260.0,
      child: CustomPaint(
        painter: sheet,
        child: Container(),
      ),
    );
  }

  ///A widget that holds the icon button which can play note sound when pressed.
  Widget cardPlayIcon(index) {
    return ElevatedButton.icon(
      key: const Key('card button'),
      icon: helpPlayButtonStyle,
      label: const Text('Play'),
      style: helperButtonStyle,
      onPressed: () {
        playSound.play('${helperBrain.getHelperNoteSoundName(index)}.wav');
      },
    );
  }

  bool getWidgetVisiable() {
    if (widget.helperNum > 2) {
      return false;
    } else {
      return true;
    }
  }
}

class HelperScreen extends StatefulWidget {
  static const String id = 'helper_screen';

  /// This number is the unique id for specific helper
  final int helperNum;

  const HelperScreen({Key? key, this.helperNum = 1}) : super(key: key);

  @override
  _HelperScreenState createState() => _HelperScreenState();
}
