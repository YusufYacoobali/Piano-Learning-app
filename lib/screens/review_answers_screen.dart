import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/sheet_music_components/music_sheet.dart';
import 'package:sight_reading_app/components/sheet_music_components/note.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';
import '../constants.dart';
import 'package:sight_reading_app/question_brain.dart';

class _ReviewAnswersScreenState extends State<ReviewAnswersScreen> {
  final ScrollController _checkController = ScrollController();
  late QuestionBrain questionBrain;
  @override
  void initState() {
    super.initState();
    //int lessonNum = widget.lessonNum;
    questionBrain = widget.questionBrain;
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
  Widget addQuestionImage(int questionIndex) {
    NextNoteNotifier _nextNote = NextNoteNotifier();
    _nextNote.setNextNote(questionBrain.getSpecificNote(questionIndex));
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: SizedBox(
        height: 200.0,
        width: 240.0,
        child: CustomPaint(
          painter: MusicSheet(
              _nextNote, questionBrain.getSpecificClef(questionIndex)),
          child: Container(),
        ),
      ),
    );
  }

  Widget addMessageWrap(String message) {
    return Wrap(
        spacing: 20.0,
        runSpacing: 20.0,
        alignment: WrapAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(fontSize: 30.0),
          ),
        ]);
  }

  Widget addResultBox(int questionIndex) {
    String resultText = "Incorrect";
    Color resultColor = Colors.red;

    if (questionBrain.getUserAnswer(questionIndex) ==
        questionBrain.getSpecificCorrectAnswer(questionIndex)) {
      resultText = "Correct";
      resultColor = Colors.lightGreen;
    }
    return Container(
      margin: boxMargin,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: resultColor,
        borderRadius: BorderRadius.circular(boxRadii),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        alignment: Alignment.center,
        child: Text(resultText, style: const TextStyle(fontSize: 40)),
      ),
    );
  }

  /// Creates a card that show the question picture, correct answer and the answer that the user picked
  Widget createResultCard(int questionIndex) {
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
                Column(
                  children: [
                    Text(
                      'Question ${questionIndex + 1} of ${questionBrain.getTotalNumberOfQuestions()}',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        addQuestionImage(questionIndex),
                        Column(
                          children: [
                            //change to display result
                            addResultBox(questionIndex),
                            //change method name to add text
                            addMessageWrap('Correct Answer: ' +
                                questionBrain
                                    .getSpecificCorrectAnswer(questionIndex)),
                            addMessageWrap('Your Answer: ' +
                                questionBrain.getUserAnswer(questionIndex)),
                          ],
                        ),
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

  List<Widget> getAllResultCards() {
    List<Widget> allResults = [];
    for (int i = 0; i < questionBrain.getTotalNumberOfQuestions(); ++i) {
      allResults.add(createResultCard(i));
    }
    return allResults;
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
                children: getAllResultCards(),
              )),
        ),
      ),
    );
  }
}

///get the question brain
class ReviewAnswersScreen extends StatefulWidget {
  static const String id = 'check_answers_screen';
  final int lessonNum;
  final QuestionBrain questionBrain;
  const ReviewAnswersScreen(
      {Key? key, this.lessonNum = 1, required this.questionBrain})
      : super(key: key);

  @override
  _ReviewAnswersScreenState createState() => _ReviewAnswersScreenState();
}
