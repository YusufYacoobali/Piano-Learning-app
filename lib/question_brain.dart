import 'package:flutter/material.dart';
import 'package:sight_reading_app/storage_writer.dart';
import 'lessons_and_quizzes/question_list.dart';

/// Manages the questions in lessons/quizzes
class QuestionBrain {
  /// The current question number
  int _questionNum = 0;
  int _score = 0;

  /// Used to store the score in storage
  StorageWriter writer = StorageWriter();

  /// The list of questions
  final QuestionList questions;

  /// Constructor
  QuestionBrain({
    required this.questions,
  });

  /// Gets the name of the image of the current question
  String getImageName() {
    return questions.questionList[_questionNum].image;
  }

  /// Gets the path of the image of the current question
  String getImagePath() {
    String path = 'assets/note_images/${getImageName()}';
    return path;
  }

  /// Gets the image for the current question
  AssetImage getImage() {
    return AssetImage(getImagePath());
  }

  /// Gets the question text for the current question
  String getQuestionText() {
    return questions.questionList[_questionNum].question;
  }

  /// Gets the correct answer of the current question
  String getCorrectAnswer() {
    return questions.questionList[_questionNum].correctAnswer;
  }

  /// Moves to the next question if there is a next question
  void goToNextQuestion() {
    if (_questionNum < questions.questionList.length - 1) {
      ++_questionNum;
    }
  }

  /// Gets the question number of the current question (starting from 1)
  int getQuestionNum() {
    return (_questionNum + 1);
  }

  /// Gets the total number of questions in the question list
  int getTotalNumberOfQuestions() {
    return questions.questionList.length;
  }

  /// Sets the user answer for the current question
  void setAnswer(String userAnswer) {
    // Checks if the user answer was correct and if so, increments the score
    if (checkAnswer(userAnswer)) {
      ++_score;
    }
    // Checks if there are no more questions
    if (isLastQuestion()) {
      // Creates key for shared preferences
      String lessonName = 'lesson ${questions.lessonID}';
      // Stores [LessonName] as key and [_score] as value in storage
      writer.write(lessonName, _score);
    }
  }

  /// Gets the current score
  int getScore() {
    return _score;
  }

  /// Checks if the user answer is correct
  bool checkAnswer(String userAnswer) {
    return userAnswer == getCorrectAnswer();
  }

  /// Checks if the current question is the last question
  bool isLastQuestion() {
    return _questionNum == questions.questionList.length - 1;
  }
}
