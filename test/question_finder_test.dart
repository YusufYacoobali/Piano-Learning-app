import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_answer_data.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_finder.dart';
import 'package:sight_reading_app/question.dart';
import 'package:sight_reading_app/questions.dart';

void main() {
  void setMockQuestionStatistics() {
    List<Question> allQuestions = questions;
    QuestionAnswerData.createDefaultMap();
    int changeBy = -4;
    // Last question was wrong the most times and vice versa
    for (int i = allQuestions.length - 1; i >= 0; --i) {
      if (changeBy < 0) {
        int absVal = changeBy.abs();
        for (int j = 1; j <= absVal; ++j) {
          QuestionAnswerData.questionAnswered(
              allQuestions[i].questionID, false);
        }
      } else {
        for (int j = 1; j <= changeBy; ++j) {
          QuestionAnswerData.questionAnswered(allQuestions[i].questionID, true);
        }
      }
      ++changeBy;
    }
  }

  test(
      'Check that getQuestionsForLesson correctly returns all Questions for the lesson',
      () {
    List<Question> allQuestions = questions;
    List<Question> expectedQuestions = [];
    for (Question question in allQuestions) {
      if (question.lessonID == 1) {
        expectedQuestions.add(question);
      }
    }
    List<Question> actualQuestions = QuestionFinder().getQuestionsForLesson(1);
    expect(expectedQuestions, actualQuestions);
  });

  test(
      'Check that getRandomListOfQuestions correctly returns the right number of Questions',
      () {
    int numOfQuestions = 3;
    List<Question> randomQuestions =
        QuestionFinder().getRandomListOfQuestions(numOfQuestions);
    expect(randomQuestions.length, numOfQuestions);
  });

  test(
      'Check that getPracticeQuestions returns the Questions in the right order',
      () {
    SharedPreferences.setMockInitialValues({});
    List<Question> allQuestions = questions;
    setMockQuestionStatistics();
    List<Question> expectedQuestionsInOrder = List.from(allQuestions.reversed);
    List<Question> actualQuestionsInOrder =
        QuestionFinder().getPracticeQuestions(allQuestions.length);
    expect(expectedQuestionsInOrder, actualQuestionsInOrder);
  });
}
