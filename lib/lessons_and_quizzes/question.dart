import '../components/sheet_music_components/note.dart';

/// Class representing a question
class Question {
  final Clef clef;
  final String question;
  final Note correctAnswer;
  final int questionID;
  final int lessonID;

  Question({
    required this.clef,
    required this.question,
    required this.correctAnswer,
    required this.questionID,
    required this.lessonID,
  });
}
