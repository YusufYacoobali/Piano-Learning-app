import 'package:sight_reading_app/lessons_and_quizzes/question.dart';
import '../components/sheet_music_components/note.dart';

final List<Question> questions = [
  Question(
    clef: Clef.treble,
    question:
        'We are going to learn how to read notes. All music notes will be on the lines or spaces of the musical staff. The far left symbol is called the Treble clef. This is our first note. The name is C (Do). The middle C is a circle with a short line across it. Press C on the keyboard.',
    correctAnswer: Note(name: 'C4', duration: 4),
    questionID: 1,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question:
        'This is our second note. The name is D (Re). It is directly under the lowest line. Now press D on the keyboard.',
    correctAnswer: Note(name: 'D4', duration: 4),
    questionID: 2,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question:
        'This is our third note. The name is E (Mi). The circle is across the lowest line of the 5 line staff. Now press E on the keyboard.',
    correctAnswer: Note(name: 'E4', duration: 4),
    questionID: 3,
    lessonID: 1,
  ),

  ///start questions
  Question(
    clef: Clef.treble,
    question:
        'Great Job. Now you have learnt the first three notes. Try answering the rest of the questions without help. What note is this?',
    correctAnswer: Note(name: 'C4', duration: 4),
    questionID: 4,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D4', duration: 4),
    questionID: 5,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E4', duration: 4),
    questionID: 6,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D4', duration: 4),
    questionID: 7,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E4', duration: 4),
    questionID: 8,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C4', duration: 4),
    questionID: 9,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E4', duration: 4),
    questionID: 10,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C4', duration: 4),
    questionID: 11,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question:
        'This lesson will teach you 2 more notes. This note is call F (Fa). It is between the 2 lowest lines of the staff. Now press F on the keyboard.',
    correctAnswer: Note(name: 'F4', duration: 4),
    questionID: 12,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question:
        'This note is call G (Sol). The circle is on the second from lowest line of the staff. Now press G on the keyboard.',
    correctAnswer: Note(name: 'G4', duration: 4),
    questionID: 13,
    lessonID: 2,
  ),

  ///Lesson questions
  Question(
    clef: Clef.treble,
    question:
        'Try answer these questions on your own with a combination of the previous notes.',
    correctAnswer: Note(name: 'G4', duration: 4),
    questionID: 14,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F4', duration: 4),
    questionID: 15,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'G4', duration: 4),
    questionID: 16,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E4', duration: 4),
    questionID: 17,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D4', duration: 4),
    questionID: 18,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F4', duration: 4),
    questionID: 19,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C4', duration: 4),
    questionID: 20,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E4', duration: 4),
    questionID: 21,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F4', duration: 4),
    questionID: 22,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'G4', duration: 4),
    questionID: 23,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F4', duration: 4),
    questionID: 24,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'G4', duration: 4),
    questionID: 25,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question:
        'This lesson will teach you the last 2 notes. This note is call A (La). It is located below the middle line of the staff. Now press A on the keyboard.',
    correctAnswer: Note(name: 'A4', duration: 4),
    questionID: 26,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question:
        'This note is call B (Ti). It is located at the middle line of the staff. Now press B on the keyboard.',
    correctAnswer: Note(name: 'B4', duration: 4),
    questionID: 27,
    lessonID: 3,
  ),

  ///Lesson questions
  Question(
    clef: Clef.treble,
    question:
        'Now you can read all the notes associated with the treble clef. Try answer these questions on your own with a combination of the previous notes.',
    correctAnswer: Note(name: 'B4', duration: 4),
    questionID: 28,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'A4', duration: 4),
    questionID: 29,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'G4', duration: 4),
    questionID: 30,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'B4', duration: 4),
    questionID: 31,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F4', duration: 4),
    questionID: 32,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'B4', duration: 4),
    questionID: 33,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'A4', duration: 4),
    questionID: 34,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E4', duration: 4),
    questionID: 35,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D4', duration: 4),
    questionID: 36,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'A4', duration: 4),
    questionID: 37,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C4', duration: 4),
    questionID: 38,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D4', duration: 4),
    questionID: 39,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E4', duration: 4),
    questionID: 40,
    lessonID: 3,
  ),

  ///Lesson 4
  Question(
    clef: Clef.bass,
    question:
        'Have you noticed that the symbol at the far left has changed? This is called the Base clef which means the notes will be played on the lower part of the piano. The positions of the notes on the staff are different from the Treble clef. This is position of C on the Base clef which is under the middle line. Now press C on the keyboard.',
    correctAnswer: Note(name: 'C3', duration: 4),
    questionID: 41,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question:
        'This name is D (Re) on the Base clef. It is on the middle line of the staff. Now press D on the keyboard.',
    correctAnswer: Note(name: 'D3', duration: 4),
    questionID: 42,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question:
        'This is E (Mi) on the Base clef. It is between the second and third lines from top of the staff and is above D. Now press E on the keyboard.',
    correctAnswer: Note(name: 'E3', duration: 4),
    questionID: 43,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question:
        'This is F (Fa) on the Base clef. It is one the second from top line of the staff. Now press F on the keyboard.',
    correctAnswer: Note(name: 'F3', duration: 4),
    questionID: 44,
    lessonID: 4,
  ),

  ///start questions
  Question(
    clef: Clef.bass,
    question:
        'Great Job. Now you have learnt the first four notes on the Base clef. Try answering the rest of the questions without help. What note is this?',
    correctAnswer: Note(name: 'E3', duration: 4),
    questionID: 45,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D3', duration: 4),
    questionID: 46,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F3', duration: 4),
    questionID: 47,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C3', duration: 4),
    questionID: 48,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D3', duration: 4),
    questionID: 49,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E3', duration: 4),
    questionID: 50,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C3', duration: 4),
    questionID: 51,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F3', duration: 4),
    questionID: 52,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C3', duration: 4),
    questionID: 53,
    lessonID: 4,
  ),

  ///Lesson 5
  Question(
    clef: Clef.bass,
    question:
        'Lets learn G A B on the Base clef. This is position of G on the Base clef which is below the top line of the staff. Now press G on the keyboard.',
    correctAnswer: Note(name: 'G3', duration: 4),
    questionID: 54,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question:
        'This name is A (La) on the Base clef. This time A is a note with the first line of the staff across it. Now press A on the keyboard.',
    correctAnswer: Note(name: 'A3', duration: 4),
    questionID: 55,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question:
        'This is B (Ti) on the Base clef. It is above the first line of the staff. Now press B on the keyboard.',
    correctAnswer: Note(name: 'B3', duration: 4),
    questionID: 56,
    lessonID: 5,
  ),

  ///start questions
  Question(
    clef: Clef.bass,
    question:
        'Great Job. Now you have learnt to read the basic notes on the Base clef. Try answering the rest of the questions without help. What note is this?',
    correctAnswer: Note(name: 'A3', duration: 4),
    questionID: 57,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'B3', duration: 4),
    questionID: 58,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'G3', duration: 4),
    questionID: 59,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C3', duration: 4),
    questionID: 60,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D3', duration: 4),
    questionID: 61,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E3', duration: 4),
    questionID: 62,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F3', duration: 4),
    questionID: 63,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'G3', duration: 4),
    questionID: 64,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'B3', duration: 4),
    questionID: 65,
    lessonID: 5,
  ),

  /// Lesson 6
  Question(
    clef: Clef.treble,
    question:
        'We are going to read higher notes on the treble clef. The higher the note on on 5 line staff, the higher the pitch. Tap B for this note',
    correctAnswer: Note(name: 'B4', duration: 4),
    questionID: 66,
    lessonID: 6,
  ),
  Question(
    clef: Clef.treble,
    question:
        'Notice that this note is higher than B in the previous question. Press C on the keyboard.',
    correctAnswer: Note(name: 'C5', duration: 4),
    questionID: 67,
    lessonID: 6,
  ),

  ///Start questions
  Question(
    clef: Clef.treble,
    question:
        'Great Job. All notes will repeat the pattern C-D-E-F-G-A-B before going back to C as you go higher up on the musical staff. For an actual keyboard/piano, you will go further to the right. Try answering the rest of the questions without help. What note is this?',
    correctAnswer: Note(name: 'B4', duration: 4),
    questionID: 68,
    lessonID: 6,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C5', duration: 4),
    questionID: 69,
    lessonID: 6,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D5', duration: 4),
    questionID: 70,
    lessonID: 6,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E5', duration: 4),
    questionID: 71,
    lessonID: 6,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'A4', duration: 4),
    questionID: 72,
    lessonID: 6,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C5', duration: 4),
    questionID: 73,
    lessonID: 6,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D5', duration: 4),
    questionID: 74,
    lessonID: 6,
  ),

  ///sharps and flats
  Question(
    clef: Clef.treble,
    question:
        'This is an extra lesson on how to read sharps and flats. This # mark is a sharp. You have to press the closest key to the right (most of the time it is a black key). In this case, press the black key next to F on the right.',
    correctAnswer: Note(name: 'F#4', duration: 4),
    questionID: 75,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question:
        'Great job, now learn about flats. The b-like mark is a flat. You have to press the closest key to the left. In this case, press the black key at the left of B',
    correctAnswer: Note(name: 'Bb4', duration: 4),
    questionID: 76,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question:
        'Great job, now try to answer this set of sharps and flats on your own. Press the keys the same way when you found a flat or a sharp on the base clef.',
    correctAnswer: Note(name: 'F#4', duration: 4),
    questionID: 77,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'G4', duration: 4),
    questionID: 78,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F#4', duration: 4),
    questionID: 79,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E4', duration: 4),
    questionID: 80,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F#4', duration: 4),
    questionID: 81,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D4', duration: 4),
    questionID: 82,
    lessonID: 7,
  ),

  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C5', duration: 4),
    questionID: 83,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'Bb4', duration: 4),
    questionID: 84,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'A4', duration: 4),
    questionID: 85,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'Bb4', duration: 4),
    questionID: 86,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'G4', duration: 4),
    questionID: 87,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'Bb4', duration: 4),
    questionID: 88,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'A4', duration: 4),
    questionID: 89,
    lessonID: 7,
  ),
];
