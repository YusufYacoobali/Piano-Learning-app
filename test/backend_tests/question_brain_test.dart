import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/components/sheet_music_components/note.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_answer_data.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_brain.dart';

void main() {
  List<Question> _getFakeQuestions() {
    QuestionAnswerData.createDefaultMap();
    return [
      Question(
        clef: Clef.treble,
        question:
            'This is our first note. The name is C (Do). Now press C on the keyboard.',
        correctAnswer: Note(name: 'C4'),
        questionID: 1,
        lessonID: 1,
      ),
      Question(
        clef: Clef.treble,
        question:
            'This is our second note. The name is D (Re). Now press D on the keyboard.',
        correctAnswer: Note(name: 'D4'),
        questionID: 2,
        lessonID: 1,
      ),
      Question(
        clef: Clef.treble,
        question:
            'This is our third note. The name is E (Mi). Now press E on the keyboard.',
        correctAnswer: Note(name: 'E4'),
        questionID: 3,
        lessonID: 1,
      ),
    ];
  }

  test('Check that getNote() correctly returns the name of the note', () {
    SharedPreferences.setMockInitialValues({});
    List<Question> fakeQuestions = _getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    String noteName = qb.getNote().name;
    expect(noteName, fakeQuestions[0].correctAnswer.name);
  });

  test('Check that getQuestionText() correctly returns the question text', () {
    SharedPreferences.setMockInitialValues({});
    List<Question> fakeQuestions = _getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    String questionText = qb.getQuestionText();
    expect(questionText, fakeQuestions[0].question);
  });

  test(
      'Check that getCorrectAnswer() correctly returns the answer to the question',
      () {
    SharedPreferences.setMockInitialValues({});
    List<Question> fakeQuestions = _getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    String answer = qb.getCorrectAnswer();
    expect(answer, fakeQuestions[0].correctAnswer.name);
  });

  test('Check that getQuestionNumber() correctly returns the question number',
      () {
    SharedPreferences.setMockInitialValues({});
    QuestionBrain qb = QuestionBrain(questions: _getFakeQuestions());
    int questionNum = qb.getQuestionNum();
    expect(questionNum, 1);
  });

  test('Check that goToNextQuestion() correctly increments the question number',
      () {
    SharedPreferences.setMockInitialValues({});
    QuestionBrain qb = QuestionBrain(questions: _getFakeQuestions());
    int beforeQuestionNum = qb.getQuestionNum();
    qb.goToNextQuestion();
    int afterQuestionNum = qb.getQuestionNum();
    expect(afterQuestionNum, beforeQuestionNum + 1);
  });

  test(
      'Check that goToNextQuestion() does not increment the question number if we are at the last question',
      () {
    SharedPreferences.setMockInitialValues({});
    List<Question> fakeQuestions = _getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    for (int i = 0; i < fakeQuestions.length; ++i) {
      qb.goToNextQuestion();
    }
    int beforeQuestionNum = qb.getQuestionNum();
    qb.goToNextQuestion();
    int afterQuestionNum = qb.getQuestionNum();
    expect(beforeQuestionNum, afterQuestionNum);
  });

  test(
      'Check that getTotalNumberOfQuestions() correctly returns the total number of questions',
      () {
    SharedPreferences.setMockInitialValues({});
    List<Question> fakeQuestions = _getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    int numOfQuestions = qb.getTotalNumberOfQuestions();
    expect(numOfQuestions, fakeQuestions.length);
  });

  test('Check that getScore() correctly starts at 0', () {
    SharedPreferences.setMockInitialValues({});
    QuestionBrain qb = QuestionBrain(questions: _getFakeQuestions());
    int score = qb.getScore();
    expect(score, 0);
  });

  test(
      'Check that setAnswer() correctly increments the score if the answer is correct',
      () {
    SharedPreferences.setMockInitialValues({});
    List<Question> fakeQuestions = _getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    int beforeScore = qb.getScore();
    qb.setAnswer(userAnswer: fakeQuestions[0].correctAnswer.name);
    int afterScore = qb.getScore();
    expect(afterScore, beforeScore + 1);
  });

  test(
      'Check that setAnswer() does not increment the score if the answer is incorrect',
      () {
    SharedPreferences.setMockInitialValues({});
    List<Question> fakeQuestions = _getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    int beforeScore = qb.getScore();
    qb.setAnswer(userAnswer: "H");
    int afterScore = qb.getScore();
    expect(afterScore, beforeScore);
  });

  test(
      'Check that checkAnswer() correctly returns true if the answer is correct',
      () {
    SharedPreferences.setMockInitialValues({});
    List<Question> fakeQuestions = _getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    bool result = qb.checkAnswer(fakeQuestions[0].correctAnswer.name);
    expect(result, true);
  });

  test(
      'Check that checkAnswer() correctly returns false if the answer is incorrect',
      () {
    SharedPreferences.setMockInitialValues({});
    List<Question> fakeQuestions = _getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    bool result = qb.checkAnswer("H");
    expect(result, false);
  });

  test(
      'Check that isLastQuestion() correctly returns true if we are at the last question',
      () {
    SharedPreferences.setMockInitialValues({});
    List<Question> fakeQuestions = _getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    for (int i = 0; i < fakeQuestions.length; ++i) {
      qb.goToNextQuestion();
    }
    bool result = qb.isLastQuestion();
    expect(result, true);
  });

  test(
      'Check that isLastQuestion() correctly returns false if we are not at the last question',
      () {
    SharedPreferences.setMockInitialValues({});
    List<Question> fakeQuestions = _getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    bool result = qb.isLastQuestion();
    expect(result, false);
  });

  test(
      'Check that goBackToBeginning makes the first question the current question.',
      () async {
    SharedPreferences.setMockInitialValues({});
    List<Question> fakeQuestions = _getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    int expectedQuestionNum = 1;
    qb.goToNextQuestion();
    qb.goToNextQuestion();
    int updatedQuestionNum = qb.getQuestionNum();
    qb.goBackToBeginning();
    int actualQuestionNum = qb.getQuestionNum();
    expect(expectedQuestionNum == updatedQuestionNum, false);
    expect(expectedQuestionNum, actualQuestionNum);
  });

  test(
      'Check that getUserAnswer correctly returns the answer selected by the user for the current question.',
      () async {
    SharedPreferences.setMockInitialValues({});
    List<Question> fakeQuestions = _getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    String expectedUserAnswer = 'C';
    qb.setAnswer(userAnswer: 'F');
    qb.goToNextQuestion();
    qb.setAnswer(userAnswer: expectedUserAnswer);
    String actualUserAnswer = qb.getUserAnswer();
    expect(expectedUserAnswer, actualUserAnswer);
  });
  test(
      'Check that getNumberOfUserAnswers correctly returns the number of user answers when user did not answer any question.',
      () async {
    SharedPreferences.setMockInitialValues({});
    List<Question> fakeQuestions = _getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    int result = qb.getNumberOfUserAnswers();
    expect(result, 0);
  });
  test(
      'Check that getNumberOfUserAnswers correctly returns the number of user answers when user answers some questions.',
      () async {
    SharedPreferences.setMockInitialValues({});
    List<Question> fakeQuestions = _getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    qb.goBackToBeginning();
    qb.setAnswer(userAnswer: 'C');
    qb.goToNextQuestion();
    qb.setAnswer(userAnswer: 'B');
    int result = qb.getNumberOfUserAnswers();
    expect(result, 2);
  });
  test(
      'Check that getNumberOfUserAnswers correctly returns the number of user answers when user answers every question.',
      () async {
    SharedPreferences.setMockInitialValues({});
    List<Question> fakeQuestions = _getFakeQuestions();
    QuestionBrain qb = QuestionBrain(questions: fakeQuestions);
    qb.goBackToBeginning();
    qb.setAnswer(userAnswer: 'C');
    qb.goToNextQuestion();
    qb.setAnswer(userAnswer: 'C');
    qb.goToNextQuestion();
    qb.setAnswer(userAnswer: 'C');
    int result = qb.getNumberOfUserAnswers();
    expect(result, qb.getTotalNumberOfQuestions());
  });
}
