import 'package:sight_reading_app/question.dart';

import '../components/sheet_music_components/note.dart';

//List of questions
//Teaches how to read La Ti
final List<Question> lessonThreeQuestions = [
  //Tutorial
  Question(
    note: Note(name: 'A4', duration: 4),
    clef: Clef.treble,
    question:
        'This lesson will teach you the last 2 notes. This note is call A (La). Now press A in the option box.',
    correctAnswer: 'F',
  ),
  Question(
    note: Note(name: 'B4', duration: 4),
    clef: Clef.treble,
    question: 'This note is call B (Ti). Now press B in the option box.',
    correctAnswer: 'G',
  ),
  //Lesson questions
  Question(
    note: Note(name: 'B4', duration: 4),
    clef: Clef.treble,
    question:
        'Try answer these questions on your own with a combination of the previous notes.',
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
  //maybe add more pictures with 2 notes or more and ask to read the second note.
];
