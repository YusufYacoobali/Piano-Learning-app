import 'package:flutter/material.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/lessons_and_quizzes/quiz.dart';
import 'package:sight_reading_app/screens/quiz_selection_screen.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_brain.dart';
import '../lessons_and_quizzes/question_finder.dart';

/// Creates screen for the random mixed quiz.
/// This screen consists of the option buttons and components in question_skeleton

class RandomQuizScreen extends StatefulWidget {
  static const String id = 'random_quiz_screen';

  const RandomQuizScreen({Key? key}) : super(key: key);

  @override
  _RandomQuizScreenState createState() => _RandomQuizScreenState();
}

class _RandomQuizScreenState extends State<RandomQuizScreen> {
  late QuestionBrain questionBrain;

  @override
  void initState() {
    super.initState();
    questionBrain = QuestionBrain(
        questions:
            QuestionFinder().getRandomListOfQuestions(numOfQuestions: 10));
  }

  @override
  void dispose() {
    super.dispose();
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
        ),
      ),
    );
  }

  void getResults() {
    String title = '';
    double percentage =
        questionBrain.getScore() / questionBrain.getTotalNumberOfQuestions();
    if (percentage < passThreshold) {
      title = "Aww, better luck next time!";
    } else {
      title = "Congratulations!";
    }
    getResultsScreen(title, percentage, questionBrain);
  }

  @override
  Widget build(BuildContext context) {
    return Quiz(
      name: 'Quizzes',
      id: QuizSelectionScreen.id,
      questionBrain: questionBrain,
      getResults: getResults,
      useQuestionText: false,
    );
  }
}
