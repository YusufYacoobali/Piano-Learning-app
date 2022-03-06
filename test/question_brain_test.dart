import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/question.dart';
import 'package:sight_reading_app/question_brain.dart';

void main() {
  // List<Question> getFakeQuestions() {
  //   return [
  //     Question(
  //       image: 'Tr_MidC.jpeg',
  //       question:
  //           'This is our first note. The name is C (Do). Now press C in the option box.',
  //       correctAnswer: 'C',
  //     ),
  //     Question(
  //       image: 'Tr_D.jpeg',
  //       question:
  //           'This is our second note. The name is D (Re). Now press D in the option box.',
  //       correctAnswer: 'D',
  //     ),
  //     Question(
  //       image: 'Tr_E.jpeg',
  //       question:
  //           'This is our third note. The name is E (Mi). Now press E in the option box.',
  //       correctAnswer: 'E',
  //     ),
  //   ];
  // }
  //
  // test('Check that getImageName() correctly returns the name of the image', () {
  //   List<Question> fakeQuestions = getFakeQuestions();
  //   QuestionBrain qb = QuestionBrain(questionList: fakeQuestions);
  //   String imageName = qb.getImageName();
  //   expect(imageName, fakeQuestions[0].image);
  // });
  //
  // test('Check that getImagePath() correctly returns the path of the image', () {
  //   List<Question> fakeQuestions = getFakeQuestions();
  //   QuestionBrain qb = QuestionBrain(questionList: fakeQuestions);
  //   String imagePath = qb.getImagePath();
  //   expect(imagePath, 'assets/note_images/${fakeQuestions[0].image}');
  // });
  //
  // test('Check that getImage() correctly returns the image', () {
  //   List<Question> fakeQuestions = getFakeQuestions();
  //   QuestionBrain qb = QuestionBrain(questionList: fakeQuestions);
  //   AssetImage image = qb.getImage();
  //   expect(image, AssetImage('assets/note_images/${fakeQuestions[0].image}'));
  // });
  //
  // test('Check that getQuestionText() correctly returns the question text', () {
  //   List<Question> fakeQuestions = getFakeQuestions();
  //   QuestionBrain qb = QuestionBrain(questionList: fakeQuestions);
  //   String questionText = qb.getQuestionText();
  //   expect(questionText, fakeQuestions[0].question);
  // });
  //
  // test(
  //     'Check that getCorrectAnswer() correctly returns the answer to the question',
  //     () {
  //   List<Question> fakeQuestions = getFakeQuestions();
  //   QuestionBrain qb = QuestionBrain(questionList: fakeQuestions);
  //   String answer = qb.getCorrectAnswer();
  //   expect(answer, fakeQuestions[0].correctAnswer);
  // });
  //
  // test('Check that getQuestionNumber() correctly returns the question number',
  //     () {
  //   QuestionBrain qb = QuestionBrain(questionList: getFakeQuestions());
  //   int questionNum = qb.getQuestionNum();
  //   expect(questionNum, 1);
  // });
  //
  // test('Check that goToNextQuestion() correctly increments the question number',
  //     () {
  //   QuestionBrain qb = QuestionBrain(questionList: getFakeQuestions());
  //   int beforeQuestionNum = qb.getQuestionNum();
  //   qb.goToNextQuestion();
  //   int afterQuestionNum = qb.getQuestionNum();
  //   expect(afterQuestionNum, beforeQuestionNum + 1);
  // });
  //
  // test(
  //     'Check that goToNextQuestion() does not increment the question number if we are at the last question',
  //     () {
  //   List<Question> fakeQuestions = getFakeQuestions();
  //   QuestionBrain qb = QuestionBrain(questionList: fakeQuestions);
  //   for (int i = 0; i < fakeQuestions.length; ++i) {
  //     qb.goToNextQuestion();
  //   }
  //   int beforeQuestionNum = qb.getQuestionNum();
  //   qb.goToNextQuestion();
  //   int afterQuestionNum = qb.getQuestionNum();
  //   expect(beforeQuestionNum, afterQuestionNum);
  // });
  //
  // test(
  //     'Check that getTotalNumberOfQuestions() correctly returns the total number of questions',
  //     () {
  //   List<Question> fakeQuestions = getFakeQuestions();
  //   QuestionBrain qb = QuestionBrain(questionList: fakeQuestions);
  //   int numOfQuestions = qb.getTotalNumberOfQuestions();
  //   expect(numOfQuestions, fakeQuestions.length);
  // });
  //
  // test('Check that getScore() correctly starts at 0', () {
  //   QuestionBrain qb = QuestionBrain(questionList: getFakeQuestions());
  //   int score = qb.getScore();
  //   expect(score, 0);
  // });
  //
  // test(
  //     'Check that setAnswer() correctly increments the score if the answer is correct',
  //     () {
  //   List<Question> fakeQuestions = getFakeQuestions();
  //   QuestionBrain qb = QuestionBrain(questionList: fakeQuestions);
  //   int beforeScore = qb.getScore();
  //   qb.setAnswer(fakeQuestions[0].correctAnswer);
  //   int afterScore = qb.getScore();
  //   expect(afterScore, beforeScore + 1);
  // });
  //
  // test(
  //     'Check that setAnswer() does not increment the score if the answer is incorrect',
  //     () {
  //   List<Question> fakeQuestions = getFakeQuestions();
  //   QuestionBrain qb = QuestionBrain(questionList: fakeQuestions);
  //   int beforeScore = qb.getScore();
  //   qb.setAnswer("H");
  //   int afterScore = qb.getScore();
  //   expect(afterScore, beforeScore);
  // });
  //
  // test(
  //     'Check that checkAnswer() correctly returns true if the answer is correct',
  //     () {
  //   List<Question> fakeQuestions = getFakeQuestions();
  //   QuestionBrain qb = QuestionBrain(questionList: fakeQuestions);
  //   bool result = qb.checkAnswer(fakeQuestions[0].correctAnswer);
  //   expect(result, true);
  // });
  //
  // test(
  //     'Check that checkAnswer() correctly returns false if the answer is incorrect',
  //     () {
  //   List<Question> fakeQuestions = getFakeQuestions();
  //   QuestionBrain qb = QuestionBrain(questionList: fakeQuestions);
  //   bool result = qb.checkAnswer("H");
  //   expect(result, false);
  // });
  //
  // test(
  //     'Check that isLastQuestion() correctly returns true if we are at the last question',
  //     () {
  //   List<Question> fakeQuestions = getFakeQuestions();
  //   QuestionBrain qb = QuestionBrain(questionList: fakeQuestions);
  //   for (int i = 0; i < fakeQuestions.length; ++i) {
  //     qb.goToNextQuestion();
  //   }
  //   bool result = qb.isLastQuestion();
  //   expect(result, true);
  // });
  //
  // test(
  //     'Check that isLastQuestion() correctly returns false if we are not at the last question',
  //     () {
  //   List<Question> fakeQuestions = getFakeQuestions();
  //   QuestionBrain qb = QuestionBrain(questionList: fakeQuestions);
  //   bool result = qb.isLastQuestion();
  //   expect(result, false);
  // });
}
