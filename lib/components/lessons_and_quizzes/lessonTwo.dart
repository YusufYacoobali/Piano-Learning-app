import 'package:sight_reading_app/components/lessons_and_quizzes/question_list.dart';
import 'package:sight_reading_app/question.dart';

//List of questions
//Teaches how to read Do Re Mi
class LessonTwoQuestions {
  final QuestionList _questions = QuestionList(questionList: [
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

  QuestionList getQuestions() {
    return _questions;
  }
}
