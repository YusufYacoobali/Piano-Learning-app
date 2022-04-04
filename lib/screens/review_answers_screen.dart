import 'package:flutter/material.dart';
import '../components/sheet_music_components/music_sheet.dart';
import '../components/sheet_music_components/note.dart';
import '../lessons_and_quizzes/question_brain.dart';
import '../constants.dart';

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
  List<Widget> _getAllReviewAnswerCards() {
    List<Widget> allResults = [];
    questionBrain.goBackToBeginning();
    for (int i = 0; i < questionBrain.getTotalNumberOfQuestions(); ++i) {
      if (questionBrain.getUserAnswer() != "N/A") {
        resultCardKeys.add(Key('resultCard:$i'));
        allResults.add(_createReviewAnswerCard(i));
        allResults.add(const SizedBox(
          width: 20,
        ));
      }
      questionBrain.goToNextQuestion();
    }
    return allResults;
  }

  /// Converts the answers if both are the same note but different octaves
  List<String> _convertAnswers() {
    String correct = questionBrain.getCorrectAnswerWithoutOctave();
    String user = questionBrain.getUserAnswerWithoutOctave();
    if (correct == user &&
        questionBrain.getCorrectAnswer() != questionBrain.getUserAnswer()) {
      return [questionBrain.getCorrectAnswer(), questionBrain.getUserAnswer()];
    }
    return [correct, user];
  }

  /// Creates a card that show the question picture, correct answer and the answer that the user picked
  Widget _createReviewAnswerCard(int i) {
    return Center(
      child: SizedBox(
        height: reviewAnswerCardHeight,
        width: reviewAnswerCardWidth,
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
                      _addQuestionImage(),
                      Column(
                        children: [
                          _addResultBox(),
                          _addMessageWrap(
                              'Correct Answer: ' + _convertAnswers()[0]),
                          _addMessageWrap(
                              'Your Answer: ' + _convertAnswers()[1]),
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
  Widget _addQuestionImage() {
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

  /// Add the result box on top of each card, the display depends on whether the userAnswer is correct or not
  Widget _addResultBox() {
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
  Widget _addMessageWrap(String message) {
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
        //shows special message if user did not answer any questions
        child: (questionBrain.getNumberOfUserAnswers() <= 0)
            ? const Center(
                child: Text(
                  'You did not answer any questions',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0),
                ),
              )
            //otherwise create review answers cards if the user answer at least 1 question
            : Scrollbar(
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
                      children: _getAllReviewAnswerCards(),
                    )),
              ),
      ),
    );
  }
}
