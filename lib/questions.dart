import 'package:sight_reading_app/question.dart';

//List of questions
class Questions {
  int _questionNum = 0;

  final List<Question> _questions = [
    Question(
      image: 'Bs_A.jpeg',
      question: 'What note is this?',
      correctAnswer: 'A',
    ),
    Question(
      image: 'Bs_B.jpeg',
      question: 'What note is this?',
      correctAnswer: 'B',
    ),
    Question(
      image: 'Bs_C.jpeg',
      question: 'What note is this?',
      correctAnswer: 'C',
    ),
    /* Question(
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
      image: 'Bs_LowA.jpeg',
      question: 'What note is this?',
      correctAnswer: 'A',
    ),
    Question(
      image: 'Bs_LowB.jpeg',
      question: 'What note is this?',
      correctAnswer: 'B',
    ),
    Question(
      image: 'Bs_LowF.jpeg',
      question: 'What note is this?',
      correctAnswer: 'F',
    ),
    Question(
      image: 'Bs_LowG.jpeg',
      question: 'What note is this?',
      correctAnswer: 'G',
    ),
    Question(
      image: 'Bs_MidC.jpeg',
      question: 'What note is this?',
      correctAnswer: 'C',
    ),
    Question(
      image: 'Tr_A.jpeg',
      question: 'What note is this?',
      correctAnswer: 'A',
    ),
    Question(
      image: 'Tr_B.jpeg',
      question: 'What note is this?',
      correctAnswer: 'B',
    ),
    Question(
      image: 'Tr_C.jpeg',
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
      image: 'Tr_HighA.jpeg',
      question: 'What note is this?',
      correctAnswer: 'A',
    ),
    Question(
      image: 'Tr_HighD.jpeg',
      question: 'What note is this?',
      correctAnswer: 'D',
    ),
    Question(
      image: 'Tr_HighE.jpeg',
      question: 'What note is this?',
      correctAnswer: 'E',
    ),
    Question(
      image: 'Tr_HighF.jpeg',
      question: 'What note is this?',
      correctAnswer: 'F',
    ),
    Question(
      image: 'Tr_HighG.jpeg',
      question: 'What note is this?',
      correctAnswer: 'G',
    ),
    Question(
      image: 'Tr_MidC.jpeg',
      question: 'What note is this?',
      correctAnswer: 'C', 
    ),*/
  ];

  String getImageName() {
    return _questions[_questionNum].image;
  }

  String getImagePath() {
    String path = 'assets/note_images/';
    String fullImagePath = path + getImageName();
    return fullImagePath;
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

  int getCurrentQuestionNum() {
    return _questionNum;
  }

  int getTotalQuestionLength() {
    return _questions.length;
  }
}
