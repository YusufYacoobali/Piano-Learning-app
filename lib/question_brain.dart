import 'storage_writer.dart';
import 'lessons_and_quizzes/question_list.dart';
import 'components/sheet_music_components/note.dart';

//List of questions
class QuestionBrain {
  int _questionNum = 0;
  int _score = 0;
  StorageWriter writer = StorageWriter();

  final QuestionList questions;

  QuestionBrain({
    required this.questions,
  });

  Note getNote() {
    return questions.questionList[_questionNum].note;
  }

  Clef getClef() {
    return questions.questionList[_questionNum].clef;
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
