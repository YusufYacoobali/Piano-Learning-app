import 'package:sight_reading_app/lessons_and_quizzes/question_list.dart';
import 'package:sight_reading_app/question.dart';

//List of questions
//Teaches how to read La Ti
final QuestionList lessonThreeQuestions =
    QuestionList(lessonID: 3, questionList: [
  //Tutorial
  Question(
    image: 'Tr_A.jpeg',
    question:
        'This lesson will teach you the last 2 notes. This note is call A (La). Now press A in the option box.',
    correctAnswer: 'F',
  ),
  Question(
    image: 'Tr_B.jpeg',
    question: 'This note is call B (Ti). Now press B in the option box.',
    correctAnswer: 'G',
  ),
  //Lesson questions
  Question(
    image: 'Tr_B.jpeg',
    question:
        'Try answer these questions on your own with a combination of the previous notes.',
    correctAnswer: 'B',
  ),
  Question(
    image: 'Tr_A.jpeg',
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    image: 'Tr_G.jpeg',
    question: 'What note is this?',
    correctAnswer: 'G',
  ),
  Question(
    image: 'Tr_B.jpeg',
    question: 'What note is this?',
    correctAnswer: 'B',
  ),
  Question(
    image: 'Tr_F.jpeg',
    question: 'What note is this?',
    correctAnswer: 'F',
  ),
  Question(
    image: 'Tr_B.jpeg',
    question: 'What note is this?',
    correctAnswer: 'B',
  ),
  Question(
    image: 'Tr_A.jpeg',
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    image: 'Tr_E.jpeg',
    question: 'What note is this?',
    correctAnswer: 'E',
  ),
  Question(
    image: 'Tr_D.jpeg',
    question: 'What note is this?',
    correctAnswer: 'D',
  ),
  Question(
    image: 'Tr_A.jpeg',
    question: 'What note is this?',
    correctAnswer: 'A',
  ),
  Question(
    image: 'Tr_MidC.jpeg',
    question: 'What note is this?',
    correctAnswer: 'C',
  ),
  Question(
    image: 'Tr_D.jpeg',
    question: 'What note is this?',
    correctAnswer: 'D',
  ),
  Question(
    image: 'Tr_E.jpeg',
    question: 'What note is this?',
    correctAnswer: 'E',
  ),
  //maybe add more pictures with 2 notes or more and ask to read the second note.
]);
