import 'package:sight_reading_app/lessons_and_quizzes/question_list.dart';
import 'package:sight_reading_app/question.dart';

//List of questions
//Teaches how to read Do Re Mi

final QuestionList lessonTwoQuestions =
    QuestionList(lessonID: 2, questionList: [
  //Tutorial
  Question(
    image: 'Tr_F.jpeg',
    question:
        'This lesson will teach you 2 more notes. This note is call F (Fa). It is between the 2 lowest lines of the staff. Now press F in the option box.',
    correctAnswer: 'F',
  ),
  Question(
    image: 'Tr_G.jpeg',
    question:
        'This note is call G (Sol). The circle is on the second from lowest line of the staff. Now press G in the option box.',
    correctAnswer: 'G',
  ),
  //Lesson questions
  Question(
    image: 'Tr_G.jpeg',
    question:
        'Try answer these questions on your own with a combination of the previous notes.',
    correctAnswer: 'G',
  ),
  Question(
    image: 'Tr_F.jpeg',
    question: 'What note is this?',
    correctAnswer: 'F',
  ),
  Question(
    image: 'Tr_G.jpeg',
    question: 'What note is this?',
    correctAnswer: 'G',
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
    image: 'Tr_F.jpeg',
    question: 'What note is this?',
    correctAnswer: 'F',
  ),
  Question(
    image: 'Tr_MidC.jpeg',
    question: 'What note is this?',
    correctAnswer: 'C',
  ),
  Question(
    image: 'Tr_E.jpeg',
    question: 'What note is this?',
    correctAnswer: 'E',
  ),
  Question(
    image: 'Tr_F.jpeg',
    question: 'What note is this?',
    correctAnswer: 'F',
  ),
  Question(
    image: 'Tr_G.jpeg',
    question: 'What note is this?',
    correctAnswer: 'G',
  ),
  Question(
    image: 'Tr_F.jpeg',
    question: 'What note is this?',
    correctAnswer: 'F',
  ),
  Question(
    image: 'Tr_G.jpeg',
    question: 'What note is this?',
    correctAnswer: 'G',
  ),
  //maybe add more pictures with 2 notes or more and ask to read the second note.
]);
