import 'package:sight_reading_app/question.dart';

import 'components/sheet_music_components/note.dart';

//List of questions
class Questions {
  int _questionNum = 0;

  final List<Question> _questions = [
    Question(
      note: 'A3',
      clef: Clef.bass,
      question: 'What note is this?',
      correctAnswer: 'A',
    ),
    Question(
      note: 'B3',
      clef: Clef.bass,
      question: 'What note is this?',
      correctAnswer: 'B',
    ),
    Question(
      note: 'C3.jpeg',
      clef: Clef.bass,
      question: 'What note is this?',
      correctAnswer: 'C',
    ),
    /* Question(
      note: 'D3.jpeg',
      question: 'What note is this?',
      correctAnswer: 'D',
    ),
    Question(
      note: 'E3.jpeg',
      question: 'What note is this?',
      correctAnswer: 'E',
    ),
    Question(
      note: 'F3.jpeg',
      question: 'What note is this?',
      correctAnswer: 'F',
    ),
    Question(
      note: 'G3.jpeg',
      question: 'What note is this?',
      correctAnswer: 'G',
    ),
    Question(
      note: 'A2.jpeg',
      question: 'What note is this?',
      correctAnswer: 'A',
    ),
    Question(
      note: 'B2.jpeg',
      question: 'What note is this?',
      correctAnswer: 'B',
    ),
    Question(
      note: 'F2.jpeg',
      question: 'What note is this?',
      correctAnswer: 'F',
    ),
    Question(
      note: 'G2.jpeg',
      question: 'What note is this?',
      correctAnswer: 'G',
    ),
    Question(
      note: 'Bs_MidC.jpeg',
      question: 'What note is this?',
      correctAnswer: 'C',
    ),
    Question(
      note: 'Tr_A.jpeg',
      question: 'What note is this?',
      correctAnswer: 'A',
    ),
    Question(
      note: 'Tr_B.jpeg',
      question: 'What note is this?',
      correctAnswer: 'B',
    ),
    Question(
      note: 'Tr_C.jpeg',
      question: 'What note is this?',
      correctAnswer: 'C',
    ),
    Question(
      note: 'Tr_D.jpeg',
      question: 'What note is this?',
      correctAnswer: 'D',
    ),
    Question(
      note: 'Tr_E.jpeg',
      question: 'What note is this?',
      correctAnswer: 'E',
    ),
    Question(
      note: 'Tr_F.jpeg',
      question: 'What note is this?',
      correctAnswer: 'F',
    ),
    Question(
      note: 'Tr_G.jpeg',
      question: 'What note is this?',
      correctAnswer: 'G',
    ),
    Question(
      note: 'Tr_HighA.jpeg',
      question: 'What note is this?',
      correctAnswer: 'A',
    ),
    Question(
      note: 'Tr_HighD.jpeg',
      question: 'What note is this?',
      correctAnswer: 'D',
    ),
    Question(
      note: 'Tr_HighE.jpeg',
      question: 'What note is this?',
      correctAnswer: 'E',
    ),
    Question(
      note: 'Tr_HighF.jpeg',
      question: 'What note is this?',
      correctAnswer: 'F',
    ),
    Question(
      note: 'Tr_HighG.jpeg',
      question: 'What note is this?',
      correctAnswer: 'G',
    ),
    Question(
      note: 'Tr_MidC.jpeg',
      question: 'What note is this?',
      correctAnswer: 'C', 
    ),*/
  ];

  String getnoteName() {
    return _questions[_questionNum].note;
  }

  String getnotePath() {
    String path = 'assets/note_notes/';
    String fullnotePath = path + getnoteName();
    return fullnotePath;
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
