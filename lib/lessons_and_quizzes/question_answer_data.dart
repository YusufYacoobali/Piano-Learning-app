import 'package:sight_reading_app/questions.dart';
import 'package:sight_reading_app/storage_reader_writer.dart';
import '../question.dart';

class QuestionAnswerData {
  static final Map<int, int> _questionStatistics = {};

  /// Get an ordered list of question IDs
  /// The first question ID is the ID of the question that was answered incorrectly the most number of times
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
  /// Record when a question has been answered correctly/incorrectly
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

  /// Initialise values in map when no saved data is available
  static void createDefaultMap() {
    for (Question question in questions) {
      _questionStatistics[question.questionID] = 0;
    }
  }

  /// Accessor for statistics map
  static Map<int, int> getQuestionStatisticsMap() {
    return _questionStatistics;
  }

  /// Updates statistics map
  static void updateQuestionStatisticsMap(int questionID, int value) {
    _questionStatistics[questionID] = value;
  }
}
