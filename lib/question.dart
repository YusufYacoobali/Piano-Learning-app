import 'components/sheet_music_components/note.dart';

class Question {
  final Clef clef;
  final String question;
  final Note correctAnswer;
  final int questionID;
  final int lessonID;
//options;

  Question({
    required this.clef,
    required this.question,
    required this.correctAnswer,
    required this.questionID,
    required this.lessonID,
  });
}
