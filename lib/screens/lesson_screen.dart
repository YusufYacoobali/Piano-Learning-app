import 'package:flutter/material.dart';

import '../components/notifications/in_app_notification_pop_up.dart';
import '../constants.dart';
import '../screens/lesson_menu_screen.dart';
import '../lessons_and_quizzes/quiz.dart';
import '../screens/results_screen.dart';
import '../storage_reader_writer.dart';
import '../lessons_and_quizzes/question_brain.dart';
import '../lessons_and_quizzes/question_finder.dart';
import 'menu_screen.dart';

/// Creates screen for a lesson.
/// The lesson screen consists of the option buttons and components in question_skeleton
class LessonScreen extends StatefulWidget {
  static const String id = 'lesson_screen';

  /// What lesson we are displaying
  final int lessonNum;
  const LessonScreen({Key? key, required this.lessonNum}) : super(key: key);

  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late QuestionBrain questionBrain;
  StorageReaderWriter storage = StorageReaderWriter();

  @override
  void initState() {
    super.initState();
    questionBrain = QuestionBrain(
        questions: QuestionFinder().getQuestionsForLesson(widget.lessonNum));
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Create result screen which displays after the user finishes all questions
  void _getResults() async {
    String title = '';
    double percentage =
        questionBrain.getScore() / questionBrain.getTotalNumberOfQuestions();
    if (percentage < passThreshold) {
      title = "Aww, better luck next time!";
      _getResultsScreen(title, percentage, questionBrain);
    } else {
      title = "Congratulations!";
      storage.saveCompletedLesson(widget.lessonNum - 1);
      List displayNotification = await storage.displayLessonNotification();
      _getResultsScreen(title, percentage, questionBrain);
      //only displays notification if achievement is completed
      if (displayNotification[0]) {
        inAppNotification(context, displayNotification[1]);
      }
    }
  }

  /// Displays the results screen
  void _getResultsScreen(
      String title, double percentage, QuestionBrain questionBrain) {
    Navigator.popUntil(context, ModalRoute.withName(MenuScreen.id));
    Navigator.pushNamed(context, LessonMenuScreen.id);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(
          score: percentage,
          title: title,
          questionBrain: questionBrain,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Quiz(
      name: 'Lessons',
      id: LessonMenuScreen.id,
      questionBrain: questionBrain,
      getResults: _getResults,
      useQuestionText: true,
    );
  }
}
