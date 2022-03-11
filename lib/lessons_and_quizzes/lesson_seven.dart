import 'package:sight_reading_app/lessons_and_quizzes/question_list.dart';
import 'package:sight_reading_app/question.dart';

/**
 * List of questions for lesson 7.
 * Teaches how to read lower notes than the ones taught in previous lessons.
 */

final QuestionList lessonSevenQuestions =
    QuestionList(lessonID: 7, questionList: [
  //Tutorial
  Question(
    image: 'Bs_LowB.jpeg',
    question:
        'Similar to the last lesson, in this lesson we are going to read notes lower than usual. The lower the note on 5 line staff, the lower the pitch. Tap B for this note',
    correctAnswer: 'B',
  ),
  Question(
    image: 'Bs_LowA.jpeg',
    question:
        'Notice that this note is lower than B in the previous question. Press A in the option box.',
    correctAnswer: 'A',
  ),

  //start questions
  Question(
    image: 'Bs_C.jpeg',
    question:
        'Great Job. When you play an actual keyboard/piano, the lower notes will be further to the left of the keyboard/piano. Try answering the rest of the questions without help. What note is this?',
    correctAnswer: 'C',
  ),
  Question(
    image: 'Bs_D.jpeg',
    question: 'What note is this?',
    correctAnswer: 'D',
  ),
  Question(
    image: 'Bs_LowB.jpeg',
    question: 'What note is this?',
    correctAnswer: 'B',
  ),
  Question(
    image: 'Bs_LowA.jpeg',
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    image: 'Bs_A.jpeg',
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    image: 'Bs_G.jpeg',
    question: 'What note is this?',
    correctAnswer: 'G',
  ),
]);
