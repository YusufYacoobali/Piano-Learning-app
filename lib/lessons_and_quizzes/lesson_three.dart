import 'package:sight_reading_app/lessons_and_quizzes/question_list.dart';
import 'package:sight_reading_app/question.dart';
import '../components/sheet_music_components/note.dart';

/// List of questions for lesson 3.
/// Teaches how to read A B on Treble clef.

final QuestionList lessonThreeQuestions =
    QuestionList(lessonID: 3, questionList: [
  ///Tutorial
  Question(
    note: Note(name: 'A4', duration: 4),
    clef: Clef.treble,
    question:
        'This lesson will teach you the last 2 notes. This note is call A (La). It is located below the middle line of the staff. Now press A in the option box.',
    correctAnswer: 'A',
  ),
  Question(
    note: Note(name: 'B4', duration: 4),
    clef: Clef.treble,
    question:
        'This note is call B (Ti). It is located at the middle line of the staff. Now press B in the option box.',
    correctAnswer: 'B',
  ),

  ///Lesson questions
  Question(
    note: Note(name: 'B4', duration: 4),
    clef: Clef.treble,
    question:
        'Now you can read all the notes associated with the treble clef. Try answer these questions on your own with a combination of the previous notes.',
    correctAnswer: 'B',
  ),
  Question(
    note: Note(name: 'A4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    note: Note(name: 'G4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'G',
  ),
  Question(
    note: Note(name: 'B4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'B',
  ),
  Question(
    note: Note(name: 'F4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'F',
  ),
  Question(
    note: Note(name: 'B4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'B',
  ),
  Question(
    note: Note(name: 'A4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    note: Note(name: 'E4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'E',
  ),
  Question(
    note: Note(name: 'D4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'D',
  ),
  Question(
    note: Note(name: 'A4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    note: Note(name: 'C4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'C',
  ),
  Question(
    note: Note(name: 'D4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'D',
  ),
  Question(
    note: Note(name: 'E4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'E',
  ),
]);
