import 'components/sheet_music_components/note.dart';

class Question {
  final String note;
  final Clef clef;
  final String question;
  final String correctAnswer;
//options;

  Question({
    required this.note,
    required this.clef,
    required this.question,
    required this.correctAnswer,
  });
}
