import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/sheet_music_components/music_sheet.dart';
import 'package:sight_reading_app/components/sheet_music_components/note.dart';
import '../constants.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_brain.dart';

///A list containing the keys for each of the result card created by addResultBox()
List<Key> resultCardKeys = <Key>[];

class ReviewAnswersScreen extends StatefulWidget {
  static const String id = 'check_answers_screen';
  final QuestionBrain questionBrain;
  const ReviewAnswersScreen({Key? key, required this.questionBrain})
      : super(key: key);

  @override
  _ReviewAnswersScreenState createState() => _ReviewAnswersScreenState();
}

class _ReviewAnswersScreenState extends State<ReviewAnswersScreen> {
  final ScrollController _checkController = ScrollController();
  late QuestionBrain questionBrain;
  @override
  void initState() {
    super.initState();
    questionBrain = widget.questionBrain;
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Returns a list of ReviewAnswer cards
  List<Widget> getAllReviewAnswerCards() {
    List<Widget> allResults = [];
    questionBrain.goBackToBeginning();

    for (int i = 0; i < questionBrain.getTotalNumberOfQuestions(); ++i) {
      if (questionBrain.getUserAnswer() != "N/A") {
        resultCardKeys.add(Key('resultCard:$i'));
        allResults.add(createReviewAnswerCard(i));
        allResults.add(const SizedBox(
          width: 20,
        ));
      }
      questionBrain.goToNextQuestion();
    }
    return allResults;
  }

  /// Creates a card that show the question picture, correct answer and the answer that the user picked
  Widget createReviewAnswerCard(int i) {
    return Center(
      child: SizedBox(
        height: reviewAnswerCardHeight, //MediaQuery.of(context).size.height,
        width: reviewAnswerCardWidth, //MediaQuery.of(context).size.width,
        child: Container(
          decoration: cardBackground,
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Column(
                children: [
                  Text(
                    'Question ${questionBrain.getQuestionNum()} of ${questionBrain.getNumberOfUserAnswers()}',
                    style: const TextStyle(fontSize: 30.0),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      addQuestionImage(),
                      Column(
                        children: [
                          //change to display result
                          addResultBox(),
                          //change method name to add text
                          addMessageWrap('Correct Answer: ' +
                              questionBrain.getCorrectAnswerWithoutOctave()),
                          addMessageWrap('Your Answer: ' +
                              questionBrain.getUserAnswerWithoutOctave()),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
            ],
          ),
          key: resultCardKeys[i],
        ),
      ),
    );
  }

  ///Gets the image of the question
  Widget addQuestionImage() {
    NextNoteNotifier _nextNote = NextNoteNotifier();
    _nextNote.setNextNote(questionBrain.getNote());
    MusicSheet sheet = MusicSheet(_nextNote, questionBrain.getClef());
    sheet.changeToRoundedBorder();
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: SizedBox(
        height: 200.0,
        width: 240.0,
        child: CustomPaint(
          painter: sheet,
          child: Container(),
        ),
      ),
    );
  }

  /// Add the result box on top of each card
  Widget addResultBox() {
    String resultText = "Incorrect";
    Color resultColor = Colors.red;
    Icon resultIcon = incorrectIcon;

    if (questionBrain.checkAnswer(questionBrain.getUserAnswer())) {
      resultText = "Correct";
      resultColor = Colors.lightGreen;
      resultIcon = correctIcon;
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
        child: Row(children: [
          resultIcon,
          Text(resultText, style: const TextStyle(fontSize: 40))
        ]),
      ),
    );
  }

  /// Adds message to each result card
  Widget addMessageWrap(String message) {
    return Wrap(
        spacing: 20.0,
        runSpacing: 20.0,
        alignment: WrapAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(fontSize: 25.0),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Answers'),
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
                children: getAllReviewAnswerCards(),
              )),
        ),
      ),
    );
  }
}
