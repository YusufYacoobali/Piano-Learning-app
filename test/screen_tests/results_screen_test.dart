import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:sight_reading_app/constants.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_brain.dart';
import 'package:sight_reading_app/lessons_and_quizzes/question_finder.dart';
import 'package:sight_reading_app/main.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';
import 'package:sight_reading_app/screens/results_screen.dart';
import 'package:sight_reading_app/lessons_and_quizzes/questions_list.dart';
import 'package:sight_reading_app/screens/review_answers_screen.dart';

void main() {
  Future<void> _createResultsScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ResultsScreen(
            title: "Congratulations!",
            score: 0.42,
            questionBrain: QuestionBrain(questions: questions)),
      ),
    );
  }

  testWidgets('Check that the title is displayed', (WidgetTester tester) async {
    await _createResultsScreen(tester);
    expect(find.text("Congratulations!"), findsOneWidget);
  });

  testWidgets('Check that the score percentage is displayed',
      (WidgetTester tester) async {
    await _createResultsScreen(tester);
    expect(find.text('You got 42%'), findsOneWidget);
  });

  testWidgets(
      'Check that the tick icon is displayed when the score is high enough',
      (WidgetTester tester) async {
    await _createResultsScreen(tester);
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
  });

  testWidgets(
      'Check that the cross icon is displayed when the score below the pass threshold',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ResultsScreen(
            title: "Congratulations!",
            score: passThreshold - 0.01,
            questionBrain: QuestionBrain(questions: questions)),
      ),
    );
    expect(find.byIcon(Icons.cancel), findsOneWidget);
  });

  testWidgets('Check that the "Exit" button is displayed',
      (WidgetTester tester) async {
    await _createResultsScreen(tester);
    expect(find.text('Exit'), findsOneWidget);
  });

  testWidgets(
      'Check that pressing the exit button takes the user back to the main menu screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Lessons'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Lesson 1'));
    await tester.pumpAndSettle();
    int numOfQuestions = QuestionFinder().getQuestionsForLesson(1).length;
    for (int i = 0; i < numOfQuestions - 1; ++i) {
      await tester.tap(find.text('C4'));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();
    }
    await tester.tap(find.text('C4'));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Exit'));
    await tester.pumpAndSettle();
    expect(find.byType(MenuScreen), findsOneWidget);
  });

  testWidgets('Check that the "Review Answers" button is displayed',
      (WidgetTester tester) async {
    await _createResultsScreen(tester);
    expect(find.text('Review Answers'), findsOneWidget);
  });

  testWidgets(
      'Check that tapping the "Review Answers" button takes the user to the review answers screen',
      (WidgetTester tester) async {
    await _createResultsScreen(tester);
    await tester.tap(find.text('Review Answers'));
    await tester.pumpAndSettle();
    expect(find.byType(ReviewAnswersScreen), findsOneWidget);
  });
}
