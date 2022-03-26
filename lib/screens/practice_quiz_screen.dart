import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/screens/quiz_selection_screen.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import 'package:sight_reading_app/storage_reader_writer.dart';
import '../components/in_app_notification_pop_up.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_brain.dart';

import '../helper.dart';
import '../lessons_and_quizzes/question_finder.dart';
import '../lessons_and_quizzes/quiz.dart';

/// Creates screen for the practice quiz.
///
/// This screen consists of the option buttons and components in question_skeleton
class _PracticeQuizScreenState extends State<PracticeQuizScreen> {
  late QuestionBrain questionBrain;
  StorageReaderWriter storage = StorageReaderWriter();

  @override
  void initState() {
    super.initState();
    questionBrain = QuestionBrain(
        questions: QuestionFinder()
            .getPracticeQuestionsForLesson(widget.lessonID, 10));
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///Checks if the user's final score is a new record for the selected quiz, and updates shared preferences if it is.
  Future<void> _updateRecords() async {
    int score = questionBrain.getScore();
    final prefs = await SharedPreferences.getInstance();
    final List<String> quizRecords = await getRecordsForMode('quiz');
    late int currentRecord;
    if (quizRecords[widget.lessonID - 1] == 'N/A') {
      currentRecord = 0;
    } else {
      currentRecord = int.parse(quizRecords[widget.lessonID - 1]);
    }
    //If it is the user's first time, the currentRecord will be N/A.
    //We want to change N/A to 0 to show an attempt was made (even if they got nothing right).
    if (score > currentRecord || currentRecord == 0) {
      await prefs.setInt(
          '${await getRecordKeysForMode('quiz')[widget.lessonID - 1]}', score);
    }
  }

  void getResultsScreen(
      String title, double percentage, QuestionBrain questionBrain) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResultsScreen(
                score: percentage,
                title: title,
                questionBrain: questionBrain,
              )),
    );
  }

  /// Create result screen which displays after the user finishes all questions
  getResults() async {
    _updateRecords();
    String title = '';
    double percentage =
        questionBrain.getScore() / questionBrain.getTotalNumberOfQuestions();
    if (percentage < passThreshold) {
      title = "Aww, better luck next time!";
      getResultsScreen(title, percentage, questionBrain);
    } else {
      title = "Congratulations!";
      storage.saveCompletedQuiz();
      List displayNotification = await storage.displayQuizNotification();
      getResultsScreen(title, percentage, questionBrain);
      //only displays notification if achievement is completed
      if (displayNotification[0]) {
        inAppNotification(context, displayNotification[1]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Quiz(
      id: QuizSelectionScreen.id,
      name: 'Quizzes',
      questionBrain: questionBrain,
      getResults: getResults,
      useQuestionText: false,
    );
  }
}

class PracticeQuizScreen extends StatefulWidget {
  /// The id used to identify the screen
  static const String id = 'practice_quiz_screen';

  /// The lesson the quiz is getting questions from.
  final int lessonID;

  const PracticeQuizScreen({Key? key, required this.lessonID})
      : super(key: key);

  @override
  _PracticeQuizScreenState createState() => _PracticeQuizScreenState();
}
