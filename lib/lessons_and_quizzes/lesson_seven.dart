import 'package:sight_reading_app/lessons_and_quizzes/question_list.dart';
import 'package:sight_reading_app/question.dart';

import '../components/sheet_music_components/note.dart';

/// List of questions for lesson 7.
///
/// Teaches how to read lower notes than the ones taught in previous lessons.

final QuestionList lessonSevenQuestions =
    QuestionList(lessonID: 7, questionList: [
  ///Tutorial
  Question(
    note: Note(name: 'B2', duration: 4),
    clef: Clef.bass,
    question:
        'Similar to the last lesson, in this lesson we are going to read notes lower than usual. The lower the note on 5 line staff, the lower the pitch. Tap B for this note',
    correctAnswer: 'B',
  ),

  Question(
    note: Note(name: 'A3', duration: 4),
    clef: Clef.treble,
    question:
        'Notice that this note is lower than B in the previous question. Press A in the option box.',
    correctAnswer: 'A',
  ),

  ///start questions
  Question(
    note: Note(name: 'C3', duration: 4),
    clef: Clef.bass,
    question:
        'Great Job. When you play an actual keyboard/piano, the lower notes will be further to the left of the keyboard/piano. Try answering the rest of the questions without help. What note is this?',
    correctAnswer: 'C',
  ),
  Question(
    note: Note(name: 'D3', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'D',
  ),
  Question(
    note: Note(name: 'B2', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'B',
  ),
  Question(
    note: Note(name: 'A2', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    note: Note(name: 'A3', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    note: Note(name: 'G3', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'G',
  ),
]);
