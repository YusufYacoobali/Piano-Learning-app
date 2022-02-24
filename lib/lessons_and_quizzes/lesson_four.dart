import 'package:sight_reading_app/lessons_and_quizzes/question_list.dart';
import 'package:sight_reading_app/question.dart';

//List of questions
//Teaches how to read Do Re Mi Fa on base clef
class LessonFourQuestions {
  final QuestionList _questions = QuestionList(questionList: [
    //Tutorial
    //Read C to F with the base clef
    Question(
      image: 'Bs_C.jpeg',
      question:
          'Have you noticed that the symbol at the far left has changed? This is called the Base clef.We have been learning the notes with the Treble clef so far. However the positions are different with the Base clef. This is position of C on the Base clef. Now press C in the option box.',
      correctAnswer: 'C',
    ),
    Question(
      image: 'Bs_D.jpeg',
      question:
          'This name is D (Re) on the Base clef. Now press D in the option box.',
      correctAnswer: 'D',
    ),
    Question(
      image: 'Bs_E.jpeg',
      question:
          'This is E (Mi) on the Base clef. Now press E in the option box.',
      correctAnswer: 'E',
    ),
    Question(
      image: 'Bs_F.jpeg',
      question:
          'This is F (Fa) on the Base clef. Now press E in the option box.',
      correctAnswer: 'F',
    ),
    //start questions
    Question(
      image: 'Bs_E.jpeg',
      question:
          'Great Job. Now you have learnt the first four notes on the Base clef. Try answering the rest of the questions without help. What note is this?',
      correctAnswer: 'E',
    ),
    Question(
      image: 'Bs_D.jpeg',
      question: 'What note is this?',
      correctAnswer: 'D',
    ),
    Question(
      image: 'Bs_F.jpeg',
      question: 'What note is this?',
      correctAnswer: 'F',
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
      image: 'Bs_C.jpeg',
      question: 'What note is this?',
      correctAnswer: 'C',
    ),
    Question(
      image: 'Bs_F.jpeg',
      question: 'What note is this?',
      correctAnswer: 'F',
    ),
    Question(
      image: 'Bs_C.jpeg',
      question: 'What note is this?',
      correctAnswer: 'C',
    ),
  ]);

  QuestionList getQuestions() {
    return _questions;
  }
}
