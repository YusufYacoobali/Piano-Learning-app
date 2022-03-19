import 'package:flutter/material.dart';

import '../components/helper_note_info.dart';
import '../constants.dart';

//import '../components/helper_note_info_list.dart';

class HelperScreen extends StatefulWidget {
  static const String id = 'helper_screen';
  const HelperScreen({Key? key}) : super(key: key);

  @override
  _HelperScreenState createState() => _HelperScreenState();
}

class _HelperScreenState extends State<HelperScreen> {
  final ScrollController _helperController = ScrollController();

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
                  cardHelper(),
                  cardHelper(),
                  cardHelper(),
                  cardHelper(),
                  cardHelper(),
                  cardHelper(),
                  cardHelper(),
                ],
              )),
        ),
      ),
    );
  }

  Widget cardHelper() {
    return Center(
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
                    cardNoteImage(),
                    Column(
                      children: [
                        cardText(),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                cardPlayIcon(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardText() {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      alignment: WrapAlignment.center,
      children: const [
        Text(
          'Bass A',
          style: TextStyle(fontSize: 30.0),
        ),
      ],
    );
  }

  Widget cardNoteImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: SizedBox(
        height: 200.0,
        width: 250.0,
        child: Image.asset(
          'assets/note_images/Bs_A.jpeg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget cardPlayIcon() {
    return IconButton(
      icon: helpPlayButtonStyle,
      onPressed: () {},
    );
  }

  final List<HelperNoteInfo> helperNoteList = [
    HelperNoteInfo(noteImageName: 'Bs_A.jpeg', noteName: 'Bass A'),
    HelperNoteInfo(noteImageName: 'Bs_B.jpeg', noteName: 'Bass B'),
    HelperNoteInfo(noteImageName: 'Bs_C.jpeg', noteName: 'Bass C'),
    HelperNoteInfo(noteImageName: 'Bs_D.jpeg', noteName: 'Bass D'),
    HelperNoteInfo(noteImageName: 'Bs_E.jpeg', noteName: 'Bass E'),
    HelperNoteInfo(noteImageName: 'Bs_F.jpeg', noteName: 'Bass F'),
    HelperNoteInfo(noteImageName: 'Bs_G.jpeg', noteName: 'Bass G'),
    HelperNoteInfo(noteImageName: 'Tr_A.jpeg', noteName: 'Clef A'),
    HelperNoteInfo(noteImageName: 'Tr_B.jpeg', noteName: 'Clef B'),
    HelperNoteInfo(noteImageName: 'Tr_C.jpeg', noteName: 'Clef C'),
    HelperNoteInfo(noteImageName: 'Tr_D.jpeg', noteName: 'Clef D'),
    HelperNoteInfo(noteImageName: 'Tr_E.jpeg', noteName: 'Clef E'),
    HelperNoteInfo(noteImageName: 'Tr_F.jpeg', noteName: 'Clef F'),
    HelperNoteInfo(noteImageName: 'Tr_G.jpeg', noteName: 'Clef G'),
  ];
}
