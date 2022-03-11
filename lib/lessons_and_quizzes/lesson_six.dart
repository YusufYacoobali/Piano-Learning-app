import 'package:sight_reading_app/lessons_and_quizzes/question_list.dart';
import 'package:sight_reading_app/question.dart';

/**
 * List of questions for lesson 6.
 * Teaches how to read higher notes than the ones taught in previous lessons.
 */

final QuestionList lessonSixQuestions =
    QuestionList(lessonID: 6, questionList: [
  //Tutorial
  Question(
    image: 'Tr_C.jpeg',
    question:
        'We are going to read notes higher than usual. The higher the note on on 5 line staff, the higher the pitch. Tap C for this note',
    correctAnswer: 'C',
  ),
  Question(
    image: 'Tr_HighD.jpeg',
    question:
        'Notice that this note is higher than C in the previous question. Press D in the option box.',
    correctAnswer: 'D',
  ),
  Question(
    image: 'Bs_A.jpeg',
    question:
        'The same goes for notes in Base clef. This note is on the line above G. Now press A in the option box.',
    correctAnswer: 'A',
  ),

  //Start questions
  Question(
    image: 'Tr_B.jpeg',
    question:
        'Great Job. All notes will repeat the pattern C-D-E-F-G-A-B before going back to C as you go higher up on the musical staff. For an actual keyboard/piano, you will go further to the right. Try answering the rest of the questions without help. What note is this?',
    correctAnswer: 'B',
  ),
  Question(
    image: 'Tr_C.jpeg',
    question: 'What note is this?',
    correctAnswer: 'C',
  ),
  Question(
    image: 'Tr_HighD.jpeg',
    question: 'What note is this?',
    correctAnswer: 'D',
  ),
  Question(
    image: 'Bs_G.jpeg',
    question: 'What note is this?',
    correctAnswer: 'G',
  ),
  Question(
    image: 'Bs_A.jpeg',
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    image: 'Bs_B.jpeg',
    question: 'What note is this?',
    correctAnswer: 'B',
  ),
  Question(
    image: 'Tr_HighE.jpeg',
    question: 'What note is this?',
    correctAnswer: 'E',
  ),
  Question(
    image: 'Tr_A.jpeg',
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    image: 'Tr_C.jpeg',
    question: 'What note is this?',
    correctAnswer: 'C',
  ),
  Question(
    image: 'Tr_HighD.jpeg',
    question: 'What note is this?',
    correctAnswer: 'D',
  ),
  Question(
    image: 'Bs_G.jpeg',
    question: 'What note is this?',
    correctAnswer: 'G',
  ),
  Question(
    image: 'Bs_B.jpeg',
    question: 'What note is this?',
    correctAnswer: 'B',
  ),
  Question(
    image: 'Bs_F.jpeg',
    question: 'What note is this?',
    correctAnswer: 'F',
  ),
  Question(
    image: 'Bs_A.jpeg',
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
]);
