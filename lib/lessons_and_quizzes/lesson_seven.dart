import 'package:sight_reading_app/question.dart';

import '../components/sheet_music_components/note.dart';

//List of questions
//Teaches how to read low notes

final List<Question> lessonSixQuestions = [
  //Tutorial
  Question(
    note: 'B2',
    clef: Clef.bass,
    question:
        'Similar to the last lesson, in this lesson we are going to read notes lower than usual. The lower the note on 5 line staff, the higher the pitch. Tap B for this note',
    correctAnswer: 'B',
  ),
  // Question(
  //   note: 'Tr_LowA.jpeg',
  //   question:
  //       'Notice that this note is lower than B in the previous question. Press A in the option box.',
  //   correctAnswer: 'A',
  // ),

  //start questions
  Question(
    note: 'C3',
    clef: Clef.bass,
    question:
        'Great Job. Try answering the rest of the questions without help. What note is this?',
    correctAnswer: 'C',
  ),
  Question(
    note: 'D3',
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'D',
  ),
  Question(
    note: 'B2',
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'B',
  ),
  Question(
    note: 'A2',
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    note: 'A3',
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    note: 'G3',
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: 'G',
  ),
];
