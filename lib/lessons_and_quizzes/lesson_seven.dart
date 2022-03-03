import 'package:sight_reading_app/question.dart';

//List of questions
//Teaches how to read low notes

final List<Question> lessonSixQuestions = [
  //Tutorial
  Question(
    image: 'Bs_LowB.jpeg',
    question:
        'Similar to the last lesson, in this lesson we are going to read notes lower than usual. The lower the note on the lines(fix this), the higher the pitch. Tap B for this note',
    correctAnswer: 'B',
  ),
  Question(
    image: 'Tr_LowA.jpeg',
    question:
        'Notice that this note is lower than B in the previous question. Press A in the option box.',
    correctAnswer: 'A',
  ),

  //start questions
  Question(
    image: 'Bs_C.jpeg',
    question:
        'Great Job. Try answering the rest of the questions without help. What note is this?',
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
];
