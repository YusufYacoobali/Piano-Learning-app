import 'dart:math';
import 'package:sight_reading_app/lessons_and_quizzes/question_answer_data.dart';
import 'package:sight_reading_app/lessons_and_quizzes/questions.dart';
import 'question.dart';

class QuestionFinder {
  /// Return the list of questions for a specific lesson
  List<Question> getQuestionsForLesson(int lessonID) {
    List<Question> lessonQuestions = [];
    for (Question question in questions) {
      if (question.lessonID == lessonID) {
        lessonQuestions.add(question);
      }
    }
    return lessonQuestions;
  }

  /// Return a list of randomly selected questions
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
    } else {
      questionsToPickFrom.shuffle();
      return questionsToPickFrom;
    }
  }

  /// Return an ordered list of practice questions
  /// The first question is the question that was answered incorrectly the most number of times
  List<Question> getPracticeQuestionsForLesson(
      int lessonID, int numOfQuestions) {
    List<Question> practiceQuestions = [];
    List<int> questionIDs = List.from(
        QuestionAnswerData.getPracticeQuestionIDs().take(numOfQuestions));

    for (int id in questionIDs) {
      for (Question question in questions) {
        if (question.questionID == id && question.lessonID == lessonID) {
          practiceQuestions.add(question);
        }
      }
    }

    return practiceQuestions;
  }
}
