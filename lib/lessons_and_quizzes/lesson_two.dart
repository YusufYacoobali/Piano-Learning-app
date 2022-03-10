import 'package:sight_reading_app/lessons_and_quizzes/question_list.dart';
import 'package:sight_reading_app/question.dart';

import '../components/sheet_music_components/note.dart';

//List of questions
//Teaches how to read Do Re Mi

final QuestionList lessonTwoQuestions =
    QuestionList(lessonID: 2, questionList: [
  //Tutorial
  Question(
    note: Note(name: 'F4', duration: 4),
    clef: Clef.treble,
    question:
        'This lesson will teach you 2 more notes. This note is call F (Fa). It is between the 2 lowest lines of the staff. Now press F in the option box.',
    correctAnswer: 'F',
  ),
  Question(
    note: Note(name: 'G4', duration: 4),
    clef: Clef.treble,
    question:
        'This note is call G (Sol). The circle is on the second from lowest line of the staff. Now press G in the option box.',
    correctAnswer: 'G',
  ),
  //Lesson questions
  Question(
    note: Note(name: 'G4', duration: 4),
    clef: Clef.treble,
    question:
        'Try answer these questions on your own with a combination of the previous notes.',
    correctAnswer: 'G',
  ),
  Question(
    note: Note(name: 'F4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'F',
  ),
  Question(
    note: Note(name: 'G4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'G',
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
    note: Note(name: 'F4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'F',
  ),
  Question(
    note: Note(name: 'C4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'C',
  ),
  Question(
    note: Note(name: 'E4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'E',
  ),
  Question(
    note: Note(name: 'F4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'F',
  ),
  Question(
    note: Note(name: 'G4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'G',
  ),
  Question(
    note: Note(name: 'F4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'F',
  ),
  Question(
    note: Note(name: 'G4', duration: 4),
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: 'G',
  ),
  //maybe add more pictures with 2 notes or more and ask to read the second note.
]);
