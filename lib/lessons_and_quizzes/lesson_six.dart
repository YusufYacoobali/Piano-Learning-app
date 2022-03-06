import 'package:sight_reading_app/question.dart';

import '../components/sheet_music_components/note.dart';

//List of questions
//Teaches how to read high notes

final List<Question> lessonSixQuestions = [
  //Tutorial
  Question(
    note: Note(name: 'C5', duration: 4),
    clef: Clef.treble,
    question:
        'We are going to read notes higher than usual. The higher the note on on 5 line staff, the higher the pitch. Tap C for this note',
    correctAnswer: 'C',
  ),
  Question(
    note: Note(name: 'D5', duration: 4),
    clef: Clef.treble,
    question:
        'Notice that this note is higher than C in the previous question. Press D in the option box.',
    correctAnswer: 'D',
  ),
  Question(
    note: Note(name: 'A3', duration: 4),
    clef: Clef.bass,
    question:
        'The same goes for notes in Base clef. This note is on the line above G. Now press A in the option box.',
    correctAnswer: 'A',
  ),
  //start questions
  Question(
    note: Note(name: 'B4', duration: 4),
    clef: Clef.treble,
    question:
        'Great Job. Try answering the rest of the questions without help. What note is this?',
    correctAnswer: 'B',
  ),
  Question(
    note: Note(name: 'C5', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'C',
  ),
  Question(
    note: Note(name: 'D5', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'D',
  ),
  Question(
    note: Note(name: 'G3', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'G',
  ),
  Question(
    note: Note(name: 'A3', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    note: Note(name: 'B3', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'B',
  ),
  Question(
    note: Note(name: 'E5', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'E',
  ),
  Question(
    note: Note(name: 'A4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    note: Note(name: 'C5', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'C',
  ),
  Question(
    note: Note(name: 'D5', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'D',
  ),
  Question(
    note: Note(name: 'G3', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'G',
  ),
  Question(
    note: Note(name: 'B3', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'B',
  ),
  Question(
    note: Note(name: 'F3', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'F',
  ),
  Question(
    note: Note(name: 'A3', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
];
