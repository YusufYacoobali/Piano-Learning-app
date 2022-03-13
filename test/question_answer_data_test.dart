import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_answer_data.dart';
import 'package:sight_reading_app/question.dart';
import 'package:sight_reading_app/questions.dart';

void main() {
  test('Check that createDefaultMap correctly initialises values to 0', () {
    List<Question> allQuestions = questions;
    QuestionAnswerData.createDefaultMap();
    Map<int, int> initialMap = QuestionAnswerData.getQuestionStatisticsMap();
    for (Question question in allQuestions) {
      int? value = initialMap[question.questionID];
      expect(value, 0);
    }
  });

  test(
      'Check that questionAnswered correctly updates map when the question was answered correctly',
      () {
    // TODO: Update test when checking time taken
    List<Question> allQuestions = questions;
    int questionID = allQuestions[0].questionID;
    QuestionAnswerData.createDefaultMap();
    Map<int, int> initialMap = QuestionAnswerData.getQuestionStatisticsMap();
    int? oldValue = initialMap[questionID];
    QuestionAnswerData.questionAnswered(questionID, true);
    Map<int, int> updatedMap = QuestionAnswerData.getQuestionStatisticsMap();
    int? newValue = updatedMap[questionID];
    expect(oldValue! + 1, newValue);
  });

  test(
      'Check that questionAnswered correctly updates map when the question was answered incorrectly',
      () {
    // TODO: Update test when checking time taken
    List<Question> allQuestions = questions;
    int questionID = allQuestions[0].questionID;
    QuestionAnswerData.createDefaultMap();
    Map<int, int> initialMap = QuestionAnswerData.getQuestionStatisticsMap();
    int? oldValue = initialMap[questionID];
    QuestionAnswerData.questionAnswered(questionID, false);
    Map<int, int> updatedMap = QuestionAnswerData.getQuestionStatisticsMap();
    int? newValue = updatedMap[questionID];
    expect(oldValue! - 1, newValue);
  });

  test(
      'Check that getPracticeQuestionIDs returns a list of IDs in the correct order',
      () {
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
    List<int> expectedQuestionIDsOrder = [];
    for (int i = allQuestions.length - 1; i >= 0; --i) {
      expectedQuestionIDsOrder.add(allQuestions[i].questionID);
    }
    List<int> actualQuestionIDsInOrder =
        QuestionAnswerData.getPracticeQuestionIDs(allQuestions.length);
    expect(expectedQuestionIDsOrder, actualQuestionIDsInOrder);
  });
}
