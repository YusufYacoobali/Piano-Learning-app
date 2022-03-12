import 'package:sight_reading_app/lessons_and_quizzes/question_list.dart';
import 'package:sight_reading_app/question.dart';

/// List of questions for lesson 5.
///
/// Teaches how to read G A B on Bass clef.

final QuestionList lessonFiveQuestions =
    QuestionList(lessonID: 5, questionList: [
  ///Tutorial
  Question(
    image: 'Bs_G.jpeg',
    question:
        'Lets learn G A B on the Base clef. This is position of G on the Base clef which is below the top line of the staff. Now press G in the option box.',
    correctAnswer: 'G',
  ),
  Question(
    image: 'Bs_LowA.jpeg',
    question:
        'This name is A (La) on the Base clef. This time A is directly below the . Now press A in the option box.',
    correctAnswer: 'A',
  ),
  Question(
    image: 'Bs_LowB.jpeg',
    question:
        'This is B (Ti) on the Base clef. It is right below C on the second line from the bottom. Now press B in the option box.',
    correctAnswer: 'B',
  ),

  ///start questions
  Question(
    image: 'Bs_LowA.jpeg',
    question:
        'Great Job. Now you have learnt to read the basic notes on the Base clef. Try answering the rest of the questions without help. What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    image: 'Bs_LowB.jpeg',
    question: 'What note is this?',
    correctAnswer: 'B',
  ),
  Question(
    image: 'Bs_G.jpeg',
    question: 'What note is this?',
    correctAnswer: 'G',
  ),
  Question(
    image: 'Bs_C.jpeg',
    question: 'What note is this?',
    correctAnswer: 'C',
  ),
  Question(
    image: 'Bs_D.jpeg',
    question: 'What note is this?',
    correctAnswer: 'D',
  ),
  Question(
    image: 'Bs_E.jpeg',
    question: 'What note is this?',
    correctAnswer: 'E',
  ),
  Question(
    image: 'Bs_F.jpeg',
    question: 'What note is this?',
    correctAnswer: 'F',
  ),
  Question(
    image: 'Bs_G.jpeg',
    question: 'What note is this?',
    correctAnswer: 'G',
  ),
  Question(
    image: 'Bs_LowB.jpeg',
    question: 'What note is this?',
    correctAnswer: 'B',
  ),
]);
