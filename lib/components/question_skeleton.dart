import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/sheet_music_components/music_sheet.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/components/sheet_music_components/note.dart';

/// A skeleton for every question to be based on.
///
/// Questions are used in lessons, the quizzes and the speedrun mode.
class QuestionSkeleton extends StatefulWidget {
  /// The id for the question skeleton.
  static String id = 'question_skeleton';
  /// The note which will be the answer for the question.
  final Note note;
  /// The clef used in the question.
  final Clef clef;
  /// The question text to be displayed on the screen.
  final String questionText;
  /// The number of the question.
  final int questionNum;
  /// The total number of questions.
  final int totalNumOfQuestions;

  const QuestionSkeleton({
    Key? key,
    required this.note,
    required this.clef,
    required this.questionText,
    required this.questionNum,
    required this.totalNumOfQuestions,
  }) : super(key: key);

  @override
  _QuestionSkeletonState createState() => _QuestionSkeletonState();
}

class _QuestionSkeletonState extends State<QuestionSkeleton> {
  late final MusicSheet _sheet;
  late final NextNoteNotifier _nextNote;

  @override
  void initState() {
    super.initState();
    _nextNote = NextNoteNotifier();
    _sheet = MusicSheet(_nextNote, Clef.treble);
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// A text of the current question number of total question.
  Widget getQuestionNumberTrackerWidget() {
    return Expanded(
      key: const Key('question number'),
      child: Text(
        'Question ${widget.questionNum} of ${widget.totalNumOfQuestions}',
        style: questionTrackerTextStyle,
      ),
    );
  }

  /// Get the question image.
  Widget getQuestionImage() {
    _sheet.changeClef(widget.clef);
    _nextNote.setNextNote(widget.note);

    /// Makes rounded border for question images
    _sheet.changeToRoundedBorder();

    return Expanded(
      flex: 1,
      key: const Key('question image'),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50.0, 80.0, 10.0, 50.0),
        //show notes here
        child: CustomPaint(
          painter: _sheet,
          child: Container(),
        ),
      ),
    );
  }

  /// A sentence of the question.
  Widget getQuestionText() {
    return Expanded(
      flex: 1,
      key: const Key('question text'),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          //show question text
          widget.questionText,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            getQuestionNumberTrackerWidget(),
            Expanded(
              flex: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  getQuestionImage(),
                  getQuestionText(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
