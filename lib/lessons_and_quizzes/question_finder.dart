import 'dart:math';
import 'package:sight_reading_app/lessons_and_quizzes/question_answer_data.dart';
import 'package:sight_reading_app/questions.dart';
import '../question.dart';

class QuestionFinder {
  List<Question> getQuestionsForLesson(int lessonID) {
    List<Question> lessonQuestions = [];
    for (Question question in questions) {
      if (question.lessonID == lessonID) {
        lessonQuestions.add(question);
      }
    }
    return lessonQuestions;
  }

  List<Question> getRandomListOfQuestions(int numOfQuestions) {
    Random randomNum = Random();
    List<Question> questionsToPickFrom = questions;
    List<Question> lessonQuestions = [];
    while (lessonQuestions.length < numOfQuestions) {
      int randomIndex = randomNum.nextInt(questionsToPickFrom.length);
      lessonQuestions.add(questionsToPickFrom.removeAt(randomIndex));
    }
    return lessonQuestions;
  }

  List<Question> getPracticeQuestions(int numOfQuestions) {
    // TODO: Make more efficient
    List<Question> practiceQuestions = [];
    List<int> questionIDs =
        QuestionAnswerData.getPracticeQuestionIDs(numOfQuestions);

    for (int id in questionIDs) {
      for (Question question in questions) {
        if (question.questionID == id) {
          practiceQuestions.add(question);
        }
      }
    }

    return practiceQuestions;
  }
}
