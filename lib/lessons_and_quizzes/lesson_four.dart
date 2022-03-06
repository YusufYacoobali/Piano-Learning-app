import 'package:sight_reading_app/question.dart';

import '../components/sheet_music_components/note.dart';

//List of questions
//Teaches how to read Do Re Mi Fa on base clef

final List<Question> lessonFourQuestions = [
  //Tutorial
  //Read C to F with the base clef
  Question(
    note: 'C3',
    clef: Clef.bass,
    question:
        'Have you noticed that the symbol at the far left has changed? This is called the Base clef.We have been learning the notes with the Treble clef so far. However the positions are different with the Base clef. This is position of C on the Base clef. Now press C in the option box.',
    correctAnswer: 'C',
  ),
  Question(
    note: 'D3',
    clef: Clef.bass,
    question:
        'This name is D (Re) on the Base clef. Now press D in the option box.',
    correctAnswer: 'D',
  ),
  Question(
    note: 'E3',
    clef: Clef.bass,
    question: 'This is E (Mi) on the Base clef. Now press E in the option box.',
    correctAnswer: 'E',
  ),
  Question(
    note: 'F3',
    clef: Clef.bass,
    question: 'This is F (Fa) on the Base clef. Now press E in the option box.',
    correctAnswer: 'F',
  ),
  //start questions
  Question(
    note: 'E3',
    clef: Clef.bass,
    question:
        'Great Job. Now you have learnt the first four notes on the Base clef. Try answering the rest of the questions without help. What note is this?',
    correctAnswer: 'E',
  ),
  Question(
    note: 'D3',
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'D',
  ),
  Question(
    note: 'F3',
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'F',
  ),
  Question(
    note: 'C3',
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'C',
  ),
  Question(
    note: 'D3',
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'D',
  ),
  Question(
    note: 'E3',
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'E',
  ),
  Question(
    note: 'C3',
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'C',
  ),
  Question(
    note: 'F3',
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'F',
  ),
  Question(
    note: 'C3',
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'C',
  ),
];
