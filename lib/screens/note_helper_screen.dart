import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/sheet_music_components/music_sheet.dart';
import 'package:sight_reading_app/components/sheet_music_components/note.dart';
import '../components/note_helper/bass_note_list_helper.dart';
import '../components/note_helper/clef_note_helper_list.dart';
import '../components/note_helper/note_helper_brain.dart';
import '../components/note_helper/note_helper_list.dart';
import '../components/note_helper/note_helper_type_list.dart';
import '../constants.dart';
import 'package:audioplayers/audioplayers.dart';

///This screen creates note_helper screen
///It contains multiple cards with note images, names and icon buttons
List<Key> cardKeys = <Key>[];
List<Key> buttonKeys = <Key>[];
List<Key> textKeys = <Key>[];
List<Key> imageKeys = <Key>[];
List<Key> descriptionKeys = <Key>[];

///List of note_helper list available
List<NoteHelperList> helperList = [
  bassNoteImageNameList,
  clefNoteImageNameList,
  noteTypeList
];

class NoteHelperScreen extends StatefulWidget {
  static const String id = 'note_helper_screen';

  /// This number is the unique id for specific note_helper
  final int helperNum;

  const NoteHelperScreen({Key? key, this.helperNum = 1}) : super(key: key);

  @override
  _NoteHelperScreenState createState() => _NoteHelperScreenState();
}

class _NoteHelperScreenState extends State<NoteHelperScreen> {
  final ScrollController _helperController = ScrollController();

  late NoteHelperBrain helperBrain;

  final playSound = AudioCache();

  /// Make widget visible or not.
  late bool isVisible;

  /// This number is representing the current position of the note_helper list
  late int index;

  ///helperBrain provides the unique number for helping locate the list we need.
  @override
  void initState() {
    super.initState();
    int helperNum = widget.helperNum;

    /// Display different note_helper list.
    helperBrain = NoteHelperBrain(helpers: helperList[helperNum - 1]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///Builds the screen with appBar and multiple note_helper cards.
  ///Inside the note_helper card, it contains images, names and icon buttons.
  @override
  Widget build(BuildContext context) {
    cardKeys = <Key>[]; //list of card keys
    textKeys = <Key>[]; //list of text keys
    imageKeys = <Key>[]; //list of image keys
    buttonKeys = <Key>[]; //list of button keys
    descriptionKeys = <Key>[]; //list of description keys
    for (int i = 0; i < helperBrain.getNumbersOfHelperNote(); i++) {
      cardKeys.add(Key('card:${helperBrain.getHelperNoteName(i)}'));
      textKeys.add(Key('card text:${helperBrain.getHelperNoteName(i)}'));
      imageKeys.add(Key('card image:$i'));
      buttonKeys
          .add(Key('card button:${helperBrain.getHelperNoteSoundName(i)}'));
      descriptionKeys
          .add(Key('card description:${helperBrain.getHelperDescription(i)}'));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Helper'),
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
              children: _getAllHelperCards(),
            ),
          ),
        ),
      ),
    );
  }

  /// Returns a list of Card widgets to display.
  List<Widget> _getAllHelperCards() {
    List<Widget> allHelperCards = [];

    for (int i = 0; i < helperBrain.getNumbersOfHelperNote(); ++i) {
      allHelperCards.add(_createCardHelper(i));
    }
    return allHelperCards;
  }

  ///Creates a card that holds note images, names and sound.
  Widget _createCardHelper(index) {
    return Center(
      child: Card(
        key: cardKeys[index],
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
                        _getCardNoteImage(index),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(height: 30.0),
                            _getCardText(index),
                            const SizedBox(
                              height: 5.0,
                              width: 230.0,
                            ),
                            if (_getWidgetVisible())
                              _getCardPlayIcon(index)
                            else
                              _getCardDescription(index),
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

  ///A widget that holds the image of the note.
  Widget _getCardNoteImage(index) {
    // sets the clef of the image
    Clef clef = Clef.treble;
    if (widget.helperNum == 1) {
      clef = Clef.bass;
    }

    NextNoteNotifier noteNotifier = NextNoteNotifier();
    noteNotifier.setNextNote(helperBrain.getHelperNoteImageName(index));
    MusicSheet sheet = MusicSheet(noteNotifier, clef);

    // Makes rounded border for note_helper images
    sheet.changeToRoundedBorder();

    return SizedBox(
      key: imageKeys[index],
      height: 200.0,
      width: 260.0,
      child: CustomPaint(
        painter: sheet,
        child: Container(),
      ),
    );
  }

  ///A widget that holds the name of the note.
  Widget _getCardText(index) {
    return FittedBox(
      key: textKeys[index],
      child: Text(
        helperBrain.getHelperNoteName(index),
        style: helperTextStyle,
      ),
    );
  }

  ///A boolean method that makes specific widget visible
  ///in the note helper card.
  bool _getWidgetVisible() {
    if (widget.helperNum > 2) {
      return false;
    } else {
      return true;
    }
  }

  ///A widget that holds the icon button which can play note sound when pressed.
  Widget _getCardPlayIcon(index) {
    return ElevatedButton.icon(
      key: buttonKeys[index],
      icon: helpPlayButtonStyle,
      label: const Text('Play'),
      style: helperButtonStyle,
      onPressed: () {
        playSound.play('${helperBrain.getHelperNoteSoundName(index)}.wav');
      },
    );
  }

  ///Widget for note_helper description
  Widget _getCardDescription(index) {
    return Container(
      height: 150,
      width: 250,
      padding: const EdgeInsets.fromLTRB(20, 15, 15, 10),
      key: descriptionKeys[index],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              helperBrain.getHelperDescription(index),
              style: helperDescriptionTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
