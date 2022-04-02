import '../components/sheet_music_components/note.dart';

/// Class representing a question.
class Question {
  /// The clef used in the question.
  final Clef clef;
  /// The question text
  final String question;
  /// The question note itself.
  final Note correctAnswer;
  /// An ID used to uniquely identify every question.
  final int questionID;
  /// The lesson the question is associated with.
  final int lessonID;

  Question({
    required this.clef,
    required this.question,
    required this.correctAnswer,
    required this.questionID,
    required this.lessonID,
  });
}
