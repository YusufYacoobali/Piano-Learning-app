import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/components/page_keyboard.dart';
import 'package:sight_reading_app/components/question_skeleton.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_finder.dart';
import 'package:sight_reading_app/main.dart';
import 'package:sight_reading_app/screens/results_screen.dart';

void main() {
  Future<void> _goToLessonOne(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Lesson 1'));
    await tester.pumpAndSettle();
  }

  testWidgets('Check that the keyboard is displayed',
      (WidgetTester tester) async {
    await _goToLessonOne(tester);
    expect(find.byType(PageKeyboard), findsOneWidget);
  });

  testWidgets('Check that the pause button is displayed',
      (WidgetTester tester) async {
    await _goToLessonOne(tester);
    expect(find.byIcon(Icons.pause), findsOneWidget);
  });

  testWidgets('Check that the first question is displayed',
      (WidgetTester tester) async {
    await _goToLessonOne(tester);
    expect(find.byType(QuestionSkeleton), findsOneWidget);
    int numOfQuestions = QuestionFinder().getQuestionsForLesson(1).length;
    expect(find.text('Question 1 of $numOfQuestions'), findsOneWidget);
  });

  testWidgets('Check that the pop-up is displayed when a key is pressed',
      (WidgetTester tester) async {
    await _goToLessonOne(tester);
    await tester.tap(find.text('C4'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
  });

  testWidgets(
      'Check that the pop-up displayed has a "Next" button to go to the next question',
      (WidgetTester tester) async {
    await _goToLessonOne(tester);
    await tester.tap(find.text('C4'));
    await tester.pumpAndSettle();
    expect(find.byType(TextButton), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);
  });

  testWidgets('Check that tapping the "Next" button goes to the next question',
      (WidgetTester tester) async {
    await _goToLessonOne(tester);
    await tester.tap(find.text('C4'));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle();
    int numOfQuestions = QuestionFinder().getQuestionsForLesson(1).length;
    expect(find.text('Question 2 of $numOfQuestions'), findsOneWidget);
  });

  testWidgets(
      'Check that the pop-up displayed has a "Finish" button when all questions have been answered',
      (WidgetTester tester) async {
    await _goToLessonOne(tester);
    int numOfQuestions = QuestionFinder().getQuestionsForLesson(1).length;
    for (int i = 0; i < numOfQuestions - 1; ++i) {
      await tester.tap(find.text('C4'));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();
    }
    await tester.tap(find.text('C4'));
    await tester.pumpAndSettle();
    expect(find.byType(TextButton), findsOneWidget);
    expect(find.text('Finish'), findsOneWidget);
  });

  testWidgets(
      'Check that tapping the "Finish" button goes to the results screen',
      (WidgetTester tester) async {
    await _goToLessonOne(tester);
    int numOfQuestions = QuestionFinder().getQuestionsForLesson(1).length;
    for (int i = 0; i < numOfQuestions; ++i) {
      await tester.tap(find.text('C4'));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();
    }
    expect(find.byType(ResultsScreen), findsOneWidget);
  });
}
