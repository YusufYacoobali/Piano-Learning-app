import 'dart:math';
import 'package:sight_reading_app/lessons_and_quizzes/question_answer_data.dart';
import 'package:sight_reading_app/lessons_and_quizzes/questions.dart';
import 'question.dart';

/// A finder to get the correct set of questions depending on the mode.
///
/// Different finders are implemented for lessons and quizzes.
class QuestionFinder {
  /// The list of questions for a specific lesson.
  List<Question> getQuestionsForLesson(int lessonID) {
    List<Question> lessonQuestions = [];
    for (Question question in questions) {
      if (question.lessonID == lessonID) {
        lessonQuestions.add(question);
      }
    }
    return lessonQuestions;
  }

  /// The list of randomly selected questions.
  List<Question> getRandomListOfQuestions({int? numOfQuestions}) {
    List<Question> questionsToPickFrom = questions;
    if (numOfQuestions != null) {
      Random randomNum = Random();
      List<Question> lessonQuestions = [];
      while (lessonQuestions.length < numOfQuestions) {
        int randomIndex = randomNum.nextInt(questionsToPickFrom.length);
        lessonQuestions.add(questionsToPickFrom.removeAt(randomIndex));
      }
      return lessonQuestions;
      // If the numOfQuestions is not provided, randomise the order of all of the questions
      // Used in speedrun
    } else {
      questionsToPickFrom.shuffle();
      return questionsToPickFrom;
    }
  }

  /// An ordered list of practice questions.
  ///
  /// The first question is the question that was answered incorrectly the most number of times.
  List<Question> getPracticeQuestionsForLesson(
      int lessonID, int numOfQuestions) {
    List<Question> practiceQuestions = [];
    // Get a list of practice question IDs
    List<int> questionIDs = QuestionAnswerData.getPracticeQuestionIDs();

    // Get a list of questions for the lesson requested
    List<Question> lessonQuestions =
        questions.where((question) => question.lessonID == lessonID).toList();

    for (int id in questionIDs) {
      for (Question question in lessonQuestions) {
        if (question.questionID == id &&
            practiceQuestions.length < numOfQuestions) {
          practiceQuestions.add(question);
        }
      }
    }

    return practiceQuestions;
  }
}
