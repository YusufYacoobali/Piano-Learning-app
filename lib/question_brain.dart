import 'package:flutter/material.dart';
import 'package:sight_reading_app/question.dart';

//List of questions
class QuestionBrain {
  int _questionNum = 0;

  final List<Question> questionList;

  QuestionBrain({
    required this.questionList,
  });

  String getImageName() {
    return questionList[_questionNum].image;
  }

  String getImagePath() {
    String path = 'assets/note_images/';
    String fullImagePath = path + getImageName();
    return fullImagePath;
  }

  AssetImage getImage() {
    return AssetImage(getImagePath());
  }

  String getQuestionText() {
    return questionList[_questionNum].question;
  }

  String getCorrectAnswer() {
    return questionList[_questionNum].correctAnswer;
  }

  void goToNextQuestion() {
    if (_questionNum < questionList.length - 1) {
      ++_questionNum;
    }
  }

  int getQuestionNum() {
    return (_questionNum + 1);
  }

  int getTotalNumberOfQuestions() {
    return questionList.length;
  }

  //check answers
  bool checkAnswer(String userAnswer) {
    return userAnswer == getCorrectAnswer();
  }

  bool isLastQuestion() {
    return _questionNum == questionList.length - 1;
  }
}
