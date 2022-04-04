import 'package:sight_reading_app/lessons_and_quizzes/question.dart';
import '../components/sheet_music_components/note.dart';

/// A list of all of the questions in the app
final List<Question> questions = [
  Question(
    clef: Clef.treble,
    question:
        'We are going to learn how to read notes. All music notes are on the lines or spaces of the musical stave. The far left symbol is called the Treble clef. This is our first note. The name is C (Do). The middle C is a circle with a short line across it. Press C on the keyboard.',
    correctAnswer: Note(name: 'C4'),
    questionID: 1,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question:
        'This is our second note. The name is D (Re). It is directly under the lowest line. Now press D on the keyboard.',
    correctAnswer: Note(name: 'D4'),
    questionID: 2,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question:
        'This is our third note. The name is E (Mi). The circle is on the lowest line of the 5 line stave. Now press E on the keyboard.',
    correctAnswer: Note(name: 'E4'),
    questionID: 3,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question:
        'Great Job. Now you have learnt the first three notes. Try answering the rest of the questions without help. What note is this?',
    correctAnswer: Note(name: 'C4'),
    questionID: 4,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D4'),
    questionID: 5,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E4'),
    questionID: 6,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D4'),
    questionID: 7,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E4'),
    questionID: 8,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C4'),
    questionID: 9,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E4'),
    questionID: 10,
    lessonID: 1,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C4'),
    questionID: 11,
    lessonID: 1,
  ),

  /// Lesson 2
  Question(
    clef: Clef.treble,
    question:
        'This lesson will teach you 2 more notes. This note is F (Fa). It is between the 2 lowest lines of the stave. Now press F on the keyboard.',
    correctAnswer: Note(name: 'F4'),
    questionID: 12,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question:
        'This note is G (Sol). The circle is on the second from lowest line of the stave. Now press G on the keyboard.',
    correctAnswer: Note(name: 'G4'),
    questionID: 13,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question:
        'Try answer these questions on your own with a combination of the previous notes.',
    correctAnswer: Note(name: 'G4'),
    questionID: 14,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F4'),
    questionID: 15,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'G4'),
    questionID: 16,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E4'),
    questionID: 17,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D4'),
    questionID: 18,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F4'),
    questionID: 19,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C4'),
    questionID: 20,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E4'),
    questionID: 21,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F4'),
    questionID: 22,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'G4'),
    questionID: 23,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F4'),
    questionID: 24,
    lessonID: 2,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'G4'),
    questionID: 25,
    lessonID: 2,
  ),

  ///Lesson 3
  Question(
    clef: Clef.treble,
    question:
        'This lesson will teach you the last 2 notes. This note is A (La). It is located below the middle line of the stave. Now press A on the keyboard.',
    correctAnswer: Note(name: 'A4'),
    questionID: 26,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question:
        'This note is B (Ti). It is located at the middle line of the stave. Now press B on the keyboard.',
    correctAnswer: Note(name: 'B4'),
    questionID: 27,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question:
        'Now you can read all the notes associated with the treble clef. Try answer these questions on your own with a combination of the previous notes.',
    correctAnswer: Note(name: 'B4'),
    questionID: 28,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'A4'),
    questionID: 29,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'G4'),
    questionID: 30,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'B4'),
    questionID: 31,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F4'),
    questionID: 32,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'B4'),
    questionID: 33,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'A4'),
    questionID: 34,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E4'),
    questionID: 35,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D4'),
    questionID: 36,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'A4'),
    questionID: 37,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C4'),
    questionID: 38,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D4'),
    questionID: 39,
    lessonID: 3,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E4'),
    questionID: 40,
    lessonID: 3,
  ),

  ///Lesson 4
  Question(
    clef: Clef.bass,
    question:
        'The clef symbol has changed! This is the Bass clef and notes are played on the lower part of the piano. The positions of the notes will be different. This is C on the Bass clef which is under the middle line. Now press C on the keyboard. ** Move the keyboard to the left before answering **.',
    correctAnswer: Note(name: 'C3'),
    questionID: 41,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question:
        'This name is D (Re) on the Bass clef. It is on the middle line of the stave. Now press D on the keyboard.',
    correctAnswer: Note(name: 'D3'),
    questionID: 42,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question:
        'This is E (Mi) on the Bass clef. It is between the second and third lines from top of the stave and is above D. Now press E on the keyboard.',
    correctAnswer: Note(name: 'E3'),
    questionID: 43,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question:
        'This is F (Fa) on the Bass clef. It is one the second from top line of the stave. Now press F on the keyboard.',
    correctAnswer: Note(name: 'F3'),
    questionID: 44,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question:
        'Great Job. Now you have learnt the first four notes on the Bass clef. Try answering the rest of the questions without help. What note is this?',
    correctAnswer: Note(name: 'E3'),
    questionID: 45,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D3'),
    questionID: 46,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F3'),
    questionID: 47,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C3'),
    questionID: 48,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D3'),
    questionID: 49,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E3'),
    questionID: 50,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C3'),
    questionID: 51,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F3'),
    questionID: 52,
    lessonID: 4,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C3'),
    questionID: 53,
    lessonID: 4,
  ),

  ///Lesson 5
  Question(
    clef: Clef.bass,
    question:
        '** This lesson is in bass clef, swipe the keyboard to the left first. ** Lets learn G A B on the Bass clef. This is position of G on the Bass clef which is below the top line of the stave. Now press G on the keyboard.',
    correctAnswer: Note(name: 'G3'),
    questionID: 54,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question:
        'This name is A (La) on the Bass clef. This time A is a note crossed by the top line of the stave. Now press A on the keyboard.',
    correctAnswer: Note(name: 'A3'),
    questionID: 55,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question:
        'This is B (Ti) on the Bass clef. It is on top of the first line from the stave. Now press B on the keyboard.',
    correctAnswer: Note(name: 'B3'),
    questionID: 56,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question:
        'Great Job. Now you have learnt to read the basic notes on the Bass clef. Try answering the rest of the questions without help. What note is this?',
    correctAnswer: Note(name: 'A3'),
    questionID: 57,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'B3'),
    questionID: 58,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'G3'),
    questionID: 59,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C3'),
    questionID: 60,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D3'),
    questionID: 61,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F3'),
    questionID: 62,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'A3'),
    questionID: 63,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'G3'),
    questionID: 64,
    lessonID: 5,
  ),
  Question(
    clef: Clef.bass,
    question: 'What note is this?',
    correctAnswer: Note(name: 'B3'),
    questionID: 65,
    lessonID: 5,
  ),

  /// Lesson 6
  Question(
    clef: Clef.treble,
    question:
        'We are going to read higher notes on the Treble clef. The higher the note on on 5 line stave, the higher the pitch. Tap B for this note',
    correctAnswer: Note(name: 'B4'),
    questionID: 66,
    lessonID: 6,
  ),
  Question(
    clef: Clef.treble,
    question:
        'Notice that this note is higher than B in the previous question. MOVE THE KEYBOARD TO THE RIGHT FOR HIGH PITCH and press C on the keyboard.',
    correctAnswer: Note(name: 'C5'),
    questionID: 67,
    lessonID: 6,
  ),
  Question(
    clef: Clef.treble,
    question:
        'Great Job. All notes will repeat the pattern C-D-E-F-G-A-B before going back to C as you go higher up the musical stave. You will go further to the right when playing higher. What note is this?',
    correctAnswer: Note(name: 'B4'),
    questionID: 68,
    lessonID: 6,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C5'),
    questionID: 69,
    lessonID: 6,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D5'),
    questionID: 70,
    lessonID: 6,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E5'),
    questionID: 71,
    lessonID: 6,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'A4'),
    questionID: 72,
    lessonID: 6,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C5'),
    questionID: 73,
    lessonID: 6,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D5'),
    questionID: 74,
    lessonID: 6,
  ),

  ///Lesson 7
  Question(
    clef: Clef.treble,
    question:
        'This is an extra lesson on how to lower notes. The lower the note on on 5 line stave, the lower the pitch. Tap C for this note',
    correctAnswer: Note(name: 'C4'),
    questionID: 75,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question:
        'Notice that this note is lower than C in the previous question. MOVE THE KEYBOARD TO THE LEFT FOR LOW PITCH and press B on the keyboard.',
    correctAnswer: Note(name: 'B3'),
    questionID: 76,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question:
        'Great Job. All notes will repeat the pattern C-B-A-G-F-E-D and goes back to C as you go down the musical stave or further to the left of a keyboard/piano. What note is this?',
    correctAnswer: Note(name: 'A3'),
    questionID: 77,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'B3'),
    questionID: 78,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'A3'),
    questionID: 79,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D4'),
    questionID: 80,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'B3'),
    questionID: 81,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C4'),
    questionID: 82,
    lessonID: 7,
  ),

  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'A3'),
    questionID: 83,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'B3'),
    questionID: 84,
    lessonID: 7,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C4'),
    questionID: 85,
    lessonID: 7,
  ),

  ///Lesson 8
  Question(
    clef: Clef.treble,
    question:
        'This is an extra lesson on how to read sharps and flats. This # mark is a sharp. You have to press the closest key to the right (most of the time it is a black key). In this case, press the black key next to F on the right.',
    correctAnswer: Note(name: 'F#4'),
    questionID: 86,
    lessonID: 8,
  ),
  Question(
    clef: Clef.treble,
    question:
        'Great job, now learn about flats. The b-like mark is a flat. You have to press the closest key to the left. In this case, press the black key at the left of B',
    correctAnswer: Note(name: 'Bb4'),
    questionID: 87,
    lessonID: 8,
  ),
  Question(
    clef: Clef.treble,
    question:
        'Great job, now try to answer this set of sharps and flats on your own. Press the keys the same way when you found a flat or a sharp on the bass clef.',
    correctAnswer: Note(name: 'F#4'),
    questionID: 88,
    lessonID: 8,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'G4'),
    questionID: 89,
    lessonID: 8,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C4'),
    questionID: 90,
    lessonID: 8,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'C#4'),
    questionID: 91,
    lessonID: 8,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'D4'),
    questionID: 92,
    lessonID: 8,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'E4'),
    questionID: 93,
    lessonID: 8,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'F#4'),
    questionID: 94,
    lessonID: 8,
  ),

  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'B4'),
    questionID: 95,
    lessonID: 8,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'Bb4'),
    questionID: 96,
    lessonID: 8,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'A4'),
    questionID: 97,
    lessonID: 8,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'Ab4'),
    questionID: 98,
    lessonID: 8,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'A4'),
    questionID: 99,
    lessonID: 8,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'Bb4'),
    questionID: 100,
    lessonID: 8,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'Eb4'),
    questionID: 101,
    lessonID: 8,
  ),
  Question(
    clef: Clef.treble,
    question: 'What note is this?',
    correctAnswer: Note(name: 'G#4'),
    questionID: 102,
    lessonID: 8,
  ),

  ///Lesson 9
  Question(
    clef: Clef.treble,
    question:
        'This is a wrap up lesson. We are reviewing notes on Treble clef and add some new notes for challenge. Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'C4'),
    questionID: 103,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave.',
    correctAnswer: Note(name: 'F4'),
    questionID: 104,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave.',
    correctAnswer: Note(name: 'F#4'),
    questionID: 105,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'G4'),
    questionID: 106,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave.',
    correctAnswer: Note(name: 'C#4'),
    questionID: 107,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave.',
    correctAnswer: Note(name: 'D4'),
    questionID: 108,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'A3'),
    questionID: 109,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'Bb3'),
    questionID: 110,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'B3'),
    questionID: 111,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'G#4'),
    questionID: 112,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'A4'),
    questionID: 113,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'Ab4'),
    questionID: 114,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'Eb4'),
    questionID: 115,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'F#4'),
    questionID: 116,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'Bb4'),
    questionID: 117,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'B4'),
    questionID: 118,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'C5'),
    questionID: 119,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'E5'),
    questionID: 120,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'Db5'),
    questionID: 121,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'F5'),
    questionID: 122,
    lessonID: 9,
  ),
  Question(
    clef: Clef.treble,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'D5'),
    questionID: 123,
    lessonID: 9,
  ),

  ///Lesson 10
  Question(
    clef: Clef.bass,
    question:
        'This is a wrap up lesson. We are reviewing notes on bass clef and some new notes for challenge. Remember you can swipe the keyboard left and right to change octave. REMINDER TO SWIPE LEFT FIRST ',
    correctAnswer: Note(name: 'C3'),
    questionID: 124,
    lessonID: 10,
  ),
  Question(
    clef: Clef.bass,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'E3'),
    questionID: 125,
    lessonID: 10,
  ),
  Question(
    clef: Clef.bass,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'Db3'),
    questionID: 126,
    lessonID: 10,
  ),
  Question(
    clef: Clef.bass,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'C#3'),
    questionID: 127,
    lessonID: 10,
  ),
  Question(
    clef: Clef.bass,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'A3'),
    questionID: 128,
    lessonID: 10,
  ),
  Question(
    clef: Clef.bass,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'C4'),
    questionID: 129,
    lessonID: 10,
  ),
  Question(
    clef: Clef.bass,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'G3'),
    questionID: 130,
    lessonID: 10,
  ),
  Question(
    clef: Clef.bass,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'F#3'),
    questionID: 131,
    lessonID: 10,
  ),
  Question(
    clef: Clef.bass,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'D#3'),
    questionID: 132,
    lessonID: 10,
  ),
  Question(
    clef: Clef.bass,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'F3'),
    questionID: 133,
    lessonID: 10,
  ),
  Question(
    clef: Clef.bass,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'D3'),
    questionID: 134,
    lessonID: 10,
  ),
  Question(
    clef: Clef.bass,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'Eb3'),
    questionID: 135,
    lessonID: 10,
  ),
  Question(
    clef: Clef.bass,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'B3'),
    questionID: 136,
    lessonID: 10,
  ),

  Question(
    clef: Clef.bass,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'Bb3'),
    questionID: 137,
    lessonID: 10,
  ),

  Question(
    clef: Clef.bass,
    question:
        'What note is this? Remember you can swipe the keyboard left and right to change octave. ',
    correctAnswer: Note(name: 'G#3'),
    questionID: 138,
    lessonID: 10,
  ),
];
