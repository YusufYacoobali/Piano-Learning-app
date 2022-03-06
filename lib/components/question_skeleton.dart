import 'package:flutter/material.dart';
import 'package:sight_reading_app/components/sheet_music_components/music_sheet.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/components/sheet_music_components/note.dart';

class QuestionSkeleton extends StatefulWidget {
  static String id = 'question_skeleton';
  final Note note;
  final Clef clef;
  final String questionText;
  final int questionNum;
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
  late final NextNote _nextNote;

  @override
  void initState() {
    super.initState();
    _nextNote = NextNote();
    _sheet = MusicSheet(_nextNote, MusicSheetModes.showNotes, Clef.treble);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget getQuestionNumberTrackerWidget() {
    return Expanded(
      key: const Key('question number'),
      child: Text(
        'Question ${widget.questionNum} of ${widget.totalNumOfQuestions}',
        style: questionTrackerTextStyle,
      ),
    );
  }

  Widget getQuestionImage() {
    _sheet.changeClef(widget.clef);
    _nextNote.setNextNote(widget.note);
    return Expanded(
      key: const Key('question image'),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        //show notes here
        child: CustomPaint(
          painter: _sheet,
          child: Container(),
        ),
      ),
    );
  }

  Widget getQuestionText() {
    return Expanded(
      key: const Key('question text'),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            getQuestionNumberTrackerWidget(),
            Row(
              children: <Widget>[
                getQuestionImage(),
                getQuestionText(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
