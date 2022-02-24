import 'package:sight_reading_app/question.dart';

//List of questions
class QuestionList {
  int _questionNum = 0;

  final List<Question> questionList;

  QuestionList({
    required this.questionList,
  });

  String getImageName() {
    return questionList[_questionNum].image;
  }

  String getImagePath() {
    String path = 'assets/NoteImages/';
    String fullImagePath = path + getImageName();
    return fullImagePath;
  }

  String getQuestionsText() {
    return questionList[_questionNum].question;
  }

  String getCorrectAnswer() {
    return questionList[_questionNum].correctAnswer;
  }

  void goToNextQuestion() {
    if (_questionNum < questionList.length - 1) {
      _questionNum++;
    }
  }

  int getCurrentQuestionNum() {
    return _questionNum;
  }

  int getTotalQuestionLength() {
    return questionList.length;
  }
}
