import 'package:sight_reading_app/question.dart';

import '../components/sheet_music_components/note.dart';

//List of questions
//Teaches how to read Do Re Mi

final List<Question> lessonOneQuestions = [
  //Tutorial
  Question(
    note: 'C4',
    clef: Clef.treble,
    question:
        'This is our first note. The name is C (Do). Now press C in the option box.',
    correctAnswer: 'C',
  ),
  Question(
    note: 'D4',
    clef: Clef.treble,
    question:
        'This is our second note. The name is D (Re). Now press D in the option box.',
    correctAnswer: 'D',
  ),
  Question(
    note: 'E4',
    clef: Clef.treble,
    question:
        'This is our third note. The name is E (Mi). Now press E in the option box.',
    correctAnswer: 'E',
  ),
  //start questions
  Question(
    note: 'C4',
    clef: Clef.treble,
    question:
        'Great Job. Now you have learnt the first three notes. Try answering the rest of the questions without help. What note is this?',
    correctAnswer: 'C',
  ),
  Question(
    note: 'D4',
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'D',
  ),
  Question(
    note: 'E4',
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'E',
  ),
  Question(
    note: 'D4',
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'D',
  ),
  Question(
    note: 'E4',
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'E',
  ),
  Question(
    note: 'C4',
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'C',
  ),
  Question(
    note: 'E4',
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'E',
  ),
  Question(
    note: 'C4',
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'C',
  ),
];
