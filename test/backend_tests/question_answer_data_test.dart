import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_answer_data.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question.dart';
import 'package:sight_reading_app/lessons_and_quizzes/questions_list.dart';

void main() {
  test('Check that createDefaultMap correctly initialises values to 0', () {
    SharedPreferences.setMockInitialValues({});
    List<Question> allQuestions = questions;
    QuestionAnswerData.createDefaultMap();
    Map<int, int> initialMap = QuestionAnswerData.getQuestionStatisticsMap();
    for (Question question in allQuestions) {
      int? value = initialMap[question.questionID];
      expect(value, 0);
    }
  });

  test(
      'Check that questionAnswered correctly updates map when the question was answered correctly within the time threshold',
      () {
    SharedPreferences.setMockInitialValues({});
    List<Question> allQuestions = questions;
    int questionID = allQuestions[0].questionID;
    QuestionAnswerData.createDefaultMap();
    Map<int, int> initialMap = QuestionAnswerData.getQuestionStatisticsMap();
    int? oldValue = initialMap[questionID];
    QuestionAnswerData.questionAnswered(questionID, true, timeThreshold);
    Map<int, int> updatedMap = QuestionAnswerData.getQuestionStatisticsMap();
    int? newValue = updatedMap[questionID];
    expect(oldValue! + correctAnswerIncrease, newValue);
  });

  test(
      'Check that questionAnswered correctly updates map when the question was answered correctly outside of the time threshold',
      () {
    SharedPreferences.setMockInitialValues({});
    List<Question> allQuestions = questions;
    int questionID = allQuestions[0].questionID;
    QuestionAnswerData.createDefaultMap();
    Map<int, int> initialMap = QuestionAnswerData.getQuestionStatisticsMap();
    int? oldValue = initialMap[questionID];
    int timeTaken = timeThreshold + 100;
    QuestionAnswerData.questionAnswered(questionID, true, timeThreshold + 100);
    Map<int, int> updatedMap = QuestionAnswerData.getQuestionStatisticsMap();
    int timePenalty = (timeTaken ~/ 100) - correctAnswerIncrease;
    timePenalty =
        timePenalty <= maxTimeReduction ? timePenalty : maxTimeReduction;
    int? newValue = updatedMap[questionID];
    expect(oldValue! - timePenalty, newValue);
  });

  test(
      'Check that questionAnswered does not give a time penalty larger than maxTimeReduction',
      () {
    SharedPreferences.setMockInitialValues({});
    List<Question> allQuestions = questions;
    int questionID = allQuestions[0].questionID;
    QuestionAnswerData.createDefaultMap();
    Map<int, int> initialMap = QuestionAnswerData.getQuestionStatisticsMap();
    int? oldValue = initialMap[questionID];
    QuestionAnswerData.questionAnswered(
        questionID, true, timeThreshold + 100000);
    Map<int, int> updatedMap = QuestionAnswerData.getQuestionStatisticsMap();
    int? newValue = updatedMap[questionID];
    expect(oldValue! - maxTimeReduction, newValue);
  });

  test(
      'Check that questionAnswered correctly updates map when the question was answered incorrectly within the time threshold',
      () {
    SharedPreferences.setMockInitialValues({});
    List<Question> allQuestions = questions;
    int questionID = allQuestions[0].questionID;
    QuestionAnswerData.createDefaultMap();
    Map<int, int> initialMap = QuestionAnswerData.getQuestionStatisticsMap();
    int? oldValue = initialMap[questionID];
    QuestionAnswerData.questionAnswered(questionID, false, timeThreshold - 100);
    Map<int, int> updatedMap = QuestionAnswerData.getQuestionStatisticsMap();
    int? newValue = updatedMap[questionID];
    expect(oldValue! - incorrectAnswerReduction, newValue);
  });

  test(
      'Check that questionAnswered correctly updates map when the question was answered incorrectly outside of the time threshold',
      () {
    SharedPreferences.setMockInitialValues({});
    List<Question> allQuestions = questions;
    int questionID = allQuestions[0].questionID;
    QuestionAnswerData.createDefaultMap();
    Map<int, int> initialMap = QuestionAnswerData.getQuestionStatisticsMap();
    int? oldValue = initialMap[questionID];
    QuestionAnswerData.questionAnswered(questionID, false, timeThreshold + 100);
    Map<int, int> updatedMap = QuestionAnswerData.getQuestionStatisticsMap();
    int? newValue = updatedMap[questionID];
    expect(oldValue! - incorrectAnswerReduction, newValue);
  });

  test(
      'Check that questionAnswered does not increase the penalty beyond the maximum incorrect answer reduction',
      () {
    SharedPreferences.setMockInitialValues({});
    List<Question> allQuestions = questions;
    int questionID = allQuestions[0].questionID;
    QuestionAnswerData.createDefaultMap();
    Map<int, int> initialMap = QuestionAnswerData.getQuestionStatisticsMap();
    int? oldValue = initialMap[questionID];
    QuestionAnswerData.questionAnswered(
        questionID, false, timeThreshold + 100000000);
    Map<int, int> updatedMap = QuestionAnswerData.getQuestionStatisticsMap();
    int? newValue = updatedMap[questionID];
    expect(oldValue! - incorrectAnswerReduction, newValue);
  });

  test(
      'Check that getPracticeQuestionIDs returns a list of IDs in the correct order',
      () {
    SharedPreferences.setMockInitialValues({});
    List<Question> allQuestions = questions;
    QuestionAnswerData.createDefaultMap();
    int changeBy = -4;
    // Last question was wrong the most times and vice versa
    for (int i = allQuestions.length - 1; i >= 0; --i) {
      if (changeBy < 0) {
        int absVal = changeBy.abs();
        for (int j = 1; j <= absVal; ++j) {
          QuestionAnswerData.questionAnswered(
              allQuestions[i].questionID, false, null);
        }
      } else {
        for (int j = 1; j <= changeBy; ++j) {
          QuestionAnswerData.questionAnswered(
              allQuestions[i].questionID, true, null);
        }
      }
      ++changeBy;
    }
    List<int> expectedQuestionIDsOrder = [];
    for (int i = allQuestions.length - 1; i >= 0; --i) {
      expectedQuestionIDsOrder.add(allQuestions[i].questionID);
    }
    List<int> actualQuestionIDsInOrder =
        QuestionAnswerData.getPracticeQuestionIDs();
    expect(expectedQuestionIDsOrder, actualQuestionIDsInOrder);
  });

  test('Check that updateQuestionStatisticsMap correctly updates the map', () {
    SharedPreferences.setMockInitialValues({});
    List<Question> allQuestions = questions;
    int questionID = allQuestions[0].questionID;
    QuestionAnswerData.createDefaultMap();
    Map<int, int> initialMap = QuestionAnswerData.getQuestionStatisticsMap();
    int? oldValue = initialMap[questionID];
    expect(oldValue, 0);
    QuestionAnswerData.updateQuestionStatisticsMap(questionID, 5);
    Map<int, int> updatedMap = QuestionAnswerData.getQuestionStatisticsMap();
    int? newValue = updatedMap[questionID];
    expect(oldValue == newValue, false);
    expect(newValue, 5);
  });
}
