import 'package:sight_reading_app/lessons_and_quizzes/question.dart';
import 'package:sight_reading_app/storage_reader_writer.dart';
import '../components/sheet_music_components/note.dart';
import '../constants.dart';
import 'question_answer_data.dart';

/// Manages the questions in lessons/quizzes
class QuestionBrain {
  /// The current question number
  int _questionNum = 0;
  int _score = 0;

  /// Used to store the score in storage
  StorageReaderWriter writer = StorageReaderWriter();

  /// The list of questions
  final List<Question> questions;

  late final Map<int, String> _map = {};

  /// Constructor
  QuestionBrain({
    required this.questions,
  });

  Note getNote() {
    return questions[_questionNum].correctAnswer;
  }

  Clef getClef() {
    return questions[_questionNum].clef;
  }

  /// Gets the question text for the current question
  String getQuestionText() {
    return questions[_questionNum].question;
  }

  /// Gets the correct answer of the current question without the octave
  String getCorrectAnswerWithoutOctave() {
    return Note.getNameWithoutOctave(
        questions[_questionNum].correctAnswer.name);
  }

  /// Gets the correct answer of the current question
  String getCorrectAnswer() {
    return questions[_questionNum].correctAnswer.name;
  }

  /// Moves to the next question if there is a next question
  void goToNextQuestion() {
    if (_questionNum < questions.length - 1) {
      ++_questionNum;
    }
  }

  /// Gets the real question number of the current question (starting from 1)
  int getQuestionNum() {
    return (_questionNum + 1);
  }

  /// Gets the total number of questions in the question list
  int getTotalNumberOfQuestions() {
    return questions.length;
  }

  /// Gets the user's answer for the current question
  String getUserAnswer() {
    //return userAnswerList[questionNumber];
    return _map[_questionNum] ?? "N/A";
  }

  /// Gets the correct answer of the current question without the octave
  String getUserAnswerWithoutOctave() {
    String note = getUserAnswer();
    if (note != "N/A") {
      String name = note[0];
      if (note.length == 3) {
        name+=note[1];
      }
      return name;
    }
    return note;
  }

  /// Sets the user answer for the current question
  void setAnswer({required userAnswer, int? timeTaken}) {
    // Checks if the user answer was correct and if so, increments the score
    ///add map entry
    //_map.addEntries([MapEntry(_questionNum, userAnswer)]);
    _map[_questionNum] = convertToAlt(userAnswer);
    //userAnswerList.add(userAnswer);
    if (checkAnswer(userAnswer)) {
      ++_score;
      QuestionAnswerData.questionAnswered(
          questions[_questionNum].questionID, true, timeTaken);
    } else {
      QuestionAnswerData.questionAnswered(
          questions[_questionNum].questionID, false, timeTaken);
    }

    // Checks if there are no more questions
    if (isLastQuestion()) {
      // Creates key for shared preferences
      // TODO: Also saving lesson in lesson screen so figure out which one to keep
      String lessonName = 'lesson ${questions[0].lessonID}';
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
    if (userAnswer == getCorrectAnswer()) {
      return true;
    }
    else if (getCorrectAnswer().length == 3 && userAnswer.length == 3) {
      String correct = getCorrectAnswer();
      String noteWithoutOctave = userAnswer[0] + userAnswer[1];
      String? alt = sharpFlatEquivalence[noteWithoutOctave];
      if (alt != null) {
        alt = alt + userAnswer[userAnswer.length - 1];
        if (alt == correct) return true;
      }
    }
    return false;
  }

  /// Coverts the answer to its sharp equal if needed
  String convertToAlt(String userAnswer) {
    if (getCorrectAnswer().length == 3 && userAnswer.length == 3) {
      String correct = getCorrectAnswer();
      String noteWithoutOctave = userAnswer[0] + userAnswer[1];
      String alt = sharpFlatEquivalence[noteWithoutOctave]!;
      alt = alt + userAnswer[userAnswer.length - 1];
      if (alt == correct) return alt;
      if (alt[1] == correct[1]) {
        return alt;
      }
    }
    return userAnswer;
  }

  /// Checks if the current question is the last question
  bool isLastQuestion() {
    return _questionNum == questions.length - 1;
  }

  /// Resets the current question to the first question in [questions]
  void goBackToBeginning() {
    _questionNum = 0;
  }
}
