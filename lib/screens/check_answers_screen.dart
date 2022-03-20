import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';
import '../constants.dart';

class _CheckAnswersScreenState extends State<CheckAnswersScreen> {
  final ScrollController _checkController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///creates an exit button which takes back to the main menu
  Widget getNavigationButtons() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName(MenuScreen.id));
              },
              style: navButtonDeco,
              child: const Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }

  ///Gets the image of the question
  ///TODO: add map in question brain and import images of lesson
  Widget addQuestionImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: SizedBox(
        height: 160.0,
        width: 200.0,
        child: Image.asset(
          'assets/note_images/Bs_A.jpeg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget addCorrectAnswer(String message) {
    return Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        alignment: WrapAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(fontSize: 20.0),
          ),
        ]);
  }

  /// Creates card that show the question picture, correct answer and the answer that the user picked
  Widget createResultCard() {
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
                    addQuestionImage(),
                    Column(
                      children: [
                        addCorrectAnswer('A'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Answers'),
      ),
      body: SafeArea(
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _checkController,
          radius: const Radius.circular(10),
          thickness: 5.0,
          child: SingleChildScrollView(
              controller: _checkController,
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  createResultCard(),
                  createResultCard(),
                ],
              )),
        ),
      ),
      /*body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff5f0a87), Color(0xffa4508b)],
          ),
        ),
        //color: Colors.lightGreen.shade500,

        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: [
        //     getTitleWidget(),
        //     //getIconWidget(),
        //     //getScoreWidget(),
        //     getNavigationButtons(),
        //   ],
         ),
      ),*/
    );
  }
}

class CheckAnswersScreen extends StatefulWidget {
  static const String id = 'check_answers_screen';

  const CheckAnswersScreen({Key? key}) : super(key: key);

  @override
  _CheckAnswersScreenState createState() => _CheckAnswersScreenState();
}
