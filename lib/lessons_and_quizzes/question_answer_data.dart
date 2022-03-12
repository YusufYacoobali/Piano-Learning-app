class QuestionAnswerData {
  // Need to load map from storage when app open
  // Need to write map to storage when app close
  static Map<int, int> _questionStatistics = {};

  // TODO: Implement method
  static List<int> getPracticeQuestionIDs(int numOfQuestionIDs) {
    // Go through map values in ascending order
    // Add each corresponding ID to the return list
    return [1, 2, 3];
  }

  static void questionAnswered(int questionID, bool isCorrect) {
    int? currentStatistic = _questionStatistics[questionID];
    if (currentStatistic != null) {
      if (isCorrect) {
        _questionStatistics[questionID] = ++currentStatistic;
      } else {
        _questionStatistics[questionID] = --currentStatistic;
      }
    } else {
      print('Invalid id');
    }
  }
}
