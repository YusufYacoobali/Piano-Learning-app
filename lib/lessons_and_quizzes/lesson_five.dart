import 'package:sight_reading_app/question_brain.dart';
import 'package:sight_reading_app/question.dart';

//List of questions
//Teaches how to read Do Re Mi
class LessonFourQuestions {
  final QuestionBrain _questions = QuestionBrain(questionList: [
    //Tutorial
    //Read C to F with the base clef
    Question(
      image: 'Bs_G.jpeg',
      question:
          'Lets learn G A B on the Base clef. This is position of G on the Base clef. Now press G in the option box.',
      correctAnswer: 'G',
    ),
    Question(
      image: 'Bs_LowA.jpeg',
      question:
          'This name is A (La) on the Base clef. Now press A in the option box.',
      correctAnswer: 'A',
    ),
    Question(
      image: 'Bs_LowB.jpeg',
      question:
          'This is B (Ti) on the Base clef. Now press B in the option box.',
      correctAnswer: 'B',
    ),

    //start questions
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

  QuestionBrain getQuestions() {
    return _questions;
  }
}
