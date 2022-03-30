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

  /// A map storing the user answers for each question in [questions]
  late final Map<int, String> _userAnswerMap = {};

  /// Constructor
  QuestionBrain({
    required this.questions,
  });

  /// Accessor for the note of the current question
  Note getNote() {
    return questions[_questionNum].correctAnswer;
  }

  /// Accessor for the clef of the current question
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
    if (!isLastQuestion()) {
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
    // Return "N/A" if question has not been answered
    return _userAnswerMap[_questionNum] ?? "N/A";
  }

  /// Gets the number of user answers (essential in speedrun mode)
  int getNumberOfUserAnswers() {
    return _userAnswerMap.length;
  }

  /// Gets the correct answer of the current question without the octave
  String getUserAnswerWithoutOctave() {
    String note = getUserAnswer();
    if (note != "N/A") {
      // TODO: Add comments here explaining what's happening
      String name = note[0];
      if (note.length == 3) {
        name += note[1];
      }
      return name;
    }
    return note;
  }

  /// Sets the user answer for the current question
  void setAnswer({required userAnswer, int? timeTaken}) {
    // Add map entry
    _userAnswerMap[_questionNum] = convertToAlt(userAnswer);
    // Checks if the user answer was correct and if so, increments the score
    if (checkAnswer(userAnswer)) {
      ++_score;
      QuestionAnswerData.questionAnswered(
          questions[_questionNum].questionID, true, timeTaken);
    } else {
      QuestionAnswerData.questionAnswered(
          questions[_questionNum].questionID, false, timeTaken);
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
      // TODO: Add comments here explaining what's happening
    } else if (getCorrectAnswer().length == 3 && userAnswer.length == 3) {
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
      print(userAnswer);
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
