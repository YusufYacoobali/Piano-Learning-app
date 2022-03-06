import 'package:sight_reading_app/question.dart';

import '../components/sheet_music_components/note.dart';

//List of questions
//Teaches how to read Sol La Ti in bass clef

final List<Question> lessonFiveQuestions = [
  //Tutorial
  //Read C to F with the base clef
  Question(
    note: Note(name: 'G3', duration: 4),
    clef: Clef.bass,
    question:
        'Lets learn G A B on the Base clef. This is position of G on the Base clef. Now press G in the option box.',
    correctAnswer: 'G',
  ),
  Question(
    note: Note(name: 'A2', duration: 4),
    clef: Clef.bass,
    question:
        'This name is A (La) on the Base clef. Now press A in the option box.',
    correctAnswer: 'A',
  ),
  Question(
    note: Note(name: 'B2', duration: 4),
    clef: Clef.bass,
    question: 'This is B (Ti) on the Base clef. Now press B in the option box.',
    correctAnswer: 'B',
  ),

  //start questions
  Question(
    note: Note(name: 'A2', duration: 4),
    clef: Clef.bass,
    question:
        'Great Job. Now you have learnt to read the basic notes on the Base clef. Try answering the rest of the questions without help. What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    note: Note(name: 'B2', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'B',
  ),
  Question(
    note: Note(name: 'G3', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'G',
  ),
  Question(
    note: Note(name: 'C3', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'C',
  ),
  Question(
    note: Note(name: 'D3', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'D',
  ),
  Question(
    note: Note(name: 'E3', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'E',
  ),
  Question(
    note: Note(name: 'F3', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'F',
  ),
  Question(
    note: Note(name: 'G3', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'G',
  ),
  Question(
    note: Note(name: 'B2', duration: 4),
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'B',
  ),
];
