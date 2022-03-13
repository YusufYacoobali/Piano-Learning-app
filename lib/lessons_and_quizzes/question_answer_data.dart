import 'package:sight_reading_app/questions.dart';
import 'package:sight_reading_app/storage_reader_writer.dart';
import '../question.dart';

class QuestionAnswerData {
  // Need to load map from storage when app open
  // Need to write map to storage when app close
  static final Map<int, int> _questionStatistics = {};

  static List<int> getPracticeQuestionIDs(int numOfQuestionIDs) {
    // Go through map values in ascending order
    // Add each corresponding ID to the return list

    // Converting map to List of List with inner list size 2 (Pairs)
    List<List<int>> statisticPairs = [];
    _questionStatistics.forEach((k, v) => statisticPairs.add([k, v]));

    // Sorting so first element is the question that was incorrect the most number of times
    statisticPairs.sort((p1, p2) => p1[1].compareTo(p2[1]));

    // Extracting the question IDs from most incorrect to correct
    List<int> questionIDs = [];
    statisticPairs.take(numOfQuestionIDs).forEach((pair) {
      questionIDs.add(pair[0]);
    });

    return questionIDs;
  }

  // TODO: Add time taken parameter
  static void questionAnswered(int questionID, bool isCorrect) {
    int? currentStatistic = _questionStatistics[questionID];
    if (currentStatistic != null) {
      if (isCorrect) {
        _questionStatistics[questionID] = ++currentStatistic;
      } else {
        _questionStatistics[questionID] = --currentStatistic;
      }
      StorageReaderWriter().write(questionID.toString(), currentStatistic);
    } else {
      print('Invalid id');
    }
  }

  static void createDefaultMap() {
    for (Question question in questions) {
      _questionStatistics[question.questionID] = 0;
    }
  }

  static Map<int, int> getQuestionStatisticsMap() {
    return _questionStatistics;
  }

  static void updateQuestionStatisticsMap(int questionID, int value) {
    _questionStatistics[questionID] = value;
  }
}
