import '../question.dart';

/// List of questions
class QuestionList {
  /// The ID of the lesson/quiz
  late int lessonID;

  /// The list of questions
  late List<Question> questionList;

  /// Constructor
  QuestionList({required this.lessonID, required this.questionList});
}
