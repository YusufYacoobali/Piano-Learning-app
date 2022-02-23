import 'package:sight_reading_app/components/lessons_and_quizzes/question_list.dart';
import 'package:sight_reading_app/question.dart';

//List of questions
//Teaches how to read Do Re Mi
class LessonOneQuestions {
  final QuestionList _questions = QuestionList(questionList: [
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
  ]);

  QuestionList getQuestions() {
    return _questions;
  }
}
