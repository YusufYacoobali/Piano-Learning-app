import 'package:flutter/material.dart';
import 'package:sight_reading_app/storage_writer.dart';

import 'lessons_and_quizzes/question_list.dart';

//List of questions
class QuestionBrain {
  int _questionNum = 0;
  int _score = 0;

  final QuestionList questions;

  QuestionBrain({
    required this.questions,
  });

  String getImageName() {
    return questions.questionList[_questionNum].image;
  }

  String getImagePath() {
    String path = 'assets/note_images/${getImageName()}';
    return path;
  }

  AssetImage getImage() {
    return AssetImage(getImagePath());
  }

  String getQuestionText() {
    return questions.questionList[_questionNum].question;
  }

  String getCorrectAnswer() {
    return questions.questionList[_questionNum].correctAnswer;
  }

  void goToNextQuestion() {
    if (_questionNum < questions.questionList.length - 1) {
      ++_questionNum;
    }
  }

  int getQuestionNum() {
    return (_questionNum + 1);
  }

  int getTotalNumberOfQuestions() {
    return questions.questionList.length;
  }

  void setAnswer(String userAnswer) {
    if (checkAnswer(userAnswer)) {
      ++_score;
    }
    if (isLastQuestion()) {
      StorageWriter writer = StorageWriter();
      String lessonName = 'lesson ${questions.lessonID}';
      writer.write(lessonName, _score);
    }
  }

  int getScore() {
    return _score;
  }

  bool checkAnswer(String userAnswer) {
    return userAnswer == getCorrectAnswer();
  }

  bool isLastQuestion() {
    return _questionNum == questions.questionList.length - 1;
  }
}
