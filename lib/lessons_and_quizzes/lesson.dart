import 'package:sight_reading_app/lessons_and_quizzes/question_list.dart';
import 'package:sight_reading_app/lessons_and_quizzes/lesson_one.dart';

class Lesson {
  late QuestionList questions;
  void setQuestions(String questionFile) {
    if (questionFile == "LessonOne") {
      questions = lessonOneQuestions;
    }
  }

  QuestionList getQuestions() {
    return questions;
  }
}
