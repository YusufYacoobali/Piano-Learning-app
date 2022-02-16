import 'package:sight_reading_app/question.dart';

//List of questions
class Questions {
  int _questionNum = 0;

  final List<Question> _questions = [
    Question(
      image: 'Bs_A',
      question: 'What note is this?',
      correctAnswer: 'A',
    ),
    Question(
      image: 'Bs_B',
      question: 'What note is this?',
      correctAnswer: 'B',
    ),
    Question(
      image: 'Bs_C',
      question: 'What note is this?',
      correctAnswer: 'C',
    ),
    Question(
      image: 'Bs_D',
      question: 'What note is this?',
      correctAnswer: 'D',
    ),
    Question(
      image: 'Bs_E',
      question: 'What note is this?',
      correctAnswer: 'E',
    ),
    Question(
      image: 'Bs_F',
      question: 'What note is this?',
      correctAnswer: 'F',
    ),
    Question(
      image: 'Bs_G',
      question: 'What note is this?',
      correctAnswer: 'G',
    ),
    Question(
      image: 'Bs_LowA',
      question: 'What note is this?',
      correctAnswer: 'A',
    ),
    Question(
      image: 'Bs_LowB',
      question: 'What note is this?',
      correctAnswer: 'B',
    ),
    Question(
      image: 'Bs_LowF',
      question: 'What note is this?',
      correctAnswer: 'F',
    ),
    Question(
      image: 'Bs_LowG',
      question: 'What note is this?',
      correctAnswer: 'G',
    ),
    Question(
      image: 'Bs_MidC',
      question: 'What note is this?',
      correctAnswer: 'C',
    ),
    Question(
      image: 'Tr_A',
      question: 'What note is this?',
      correctAnswer: 'A',
    ),
    Question(
      image: 'Tr_B',
      question: 'What note is this?',
      correctAnswer: 'B',
    ),
    Question(
      image: 'Tr_C',
      question: 'What note is this?',
      correctAnswer: 'C',
    ),
    Question(
      image: 'Tr_D',
      question: 'What note is this?',
      correctAnswer: 'D',
    ),
    Question(
      image: 'Tr_E',
      question: 'What note is this?',
      correctAnswer: 'E',
    ),
    Question(
      image: 'Tr_F',
      question: 'What note is this?',
      correctAnswer: 'F',
    ),
    Question(
      image: 'Tr_G',
      question: 'What note is this?',
      correctAnswer: 'G',
    ),
    Question(
      image: 'Tr_HighA',
      question: 'What note is this?',
      correctAnswer: 'A',
    ),
    Question(
      image: 'Tr_HighD',
      question: 'What note is this?',
      correctAnswer: 'D',
    ),
    Question(
      image: 'Tr_HighE',
      question: 'What note is this?',
      correctAnswer: 'E',
    ),
    Question(
      image: 'Tr_HighF',
      question: 'What note is this?',
      correctAnswer: 'F',
    ),
    Question(
      image: 'Tr_HighG',
      question: 'What note is this?',
      correctAnswer: 'G',
    ),
    Question(
      image: 'Tr_MidC',
      question: 'What note is this?',
      correctAnswer: 'C',
    ),
  ];

  String getImageName() {
    return _questions[_questionNum].image;
  }

  String getQuestionsText() {
    return _questions[_questionNum].question;
  }

  String getCorrectAnswer() {
    return _questions[_questionNum].correctAnswer;
  }

  void goToNextQuestion() {
    if (_questionNum < _questions.length - 1) {
      _questionNum++;
    }
  }
}
