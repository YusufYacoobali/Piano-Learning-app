import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/main.dart';

void main() {
  Future<void> _goToPracticeQuizForLessonOne(WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Practice'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Take a Quiz'));
    await tester.pumpAndSettle();

    // final listFinder = find.byType(Scrollable);
    // final itemFinder = find.text('Quiz 1 (Lesson 1)');
    //
    // // Scroll until the item to be found appears.
    // await tester.scrollUntilVisible(
    //   itemFinder,
    //   500.0,
    //   scrollable: listFinder,
    // );
    //
    // await tester.tap(itemFinder);
    // await tester.pump();

    //print(quizButtonKeys);
    //await tester.tap(find.byKey(quizButtonKeys[0]));

    await tester.tap(find.text('Quiz 1 (Lesson 1)'));
    // Below line causes error:
    await tester.pumpAndSettle();
  }

  testWidgets('Check that the keyboard is displayed',
      (WidgetTester tester) async {
    await _goToPracticeQuizForLessonOne(tester);
    // expect(find.byType(PageKeyboard), findsOneWidget);
  });

  // testWidgets('Check that the pause button is displayed',
  //     (WidgetTester tester) async {
  //   await _goToPracticeQuizForLessonOne(tester);
  //   expect(find.byIcon(Icons.pause), findsOneWidget);
  // });

  // testWidgets('Check that the first question is displayed',
  //     (WidgetTester tester) async {
  //   await _goToPracticeQuizForLessonOne(tester);
  //   expect(find.byType(QuestionSkeleton), findsOneWidget);
  //   expect(
  //       find.text('Question 1 of $numOfQuestionsInRandomQuiz'), findsOneWidget);
  // });
  //
  // testWidgets('Check that the pop-up is displayed when a key is pressed',
  //     (WidgetTester tester) async {
  //   await _goToPracticeQuizForLessonOne(tester);
  //   await tester.tap(find.text('C'));
  //   await tester.pumpAndSettle();
  //   expect(find.byType(AlertDialog), findsOneWidget);
  // });
  //
  // testWidgets(
  //     'Check that the pop-up displayed has a "Next" button to go to the next question',
  //     (WidgetTester tester) async {
  //   await _goToPracticeQuizForLessonOne(tester);
  //   await tester.tap(find.text('C'));
  //   await tester.pumpAndSettle();
  //   expect(find.byType(TextButton), findsOneWidget);
  //   expect(find.text('Next'), findsOneWidget);
  // });
  //
  // testWidgets('Check that tapping the "Next" button goes to the next question',
  //     (WidgetTester tester) async {
  //   await _goToPracticeQuizForLessonOne(tester);
  //   await tester.tap(find.text('C'));
  //   await tester.pumpAndSettle();
  //   await tester.tap(find.byType(TextButton));
  //   await tester.pumpAndSettle();
  //   expect(
  //       find.text('Question 2 of $numOfQuestionsInRandomQuiz'), findsOneWidget);
  // });
  //
  // testWidgets(
  //     'Check that the pop-up displayed has a "Finish" button when all questions have been answered',
  //     (WidgetTester tester) async {
  //   await _goToPracticeQuizForLessonOne(tester);
  //   for (int i = 0; i < numOfQuestionsInRandomQuiz - 1; ++i) {
  //     await tester.tap(find.text('C'));
  //     await tester.pumpAndSettle();
  //     await tester.tap(find.byType(TextButton));
  //     await tester.pumpAndSettle();
  //   }
  //   await tester.tap(find.text('C'));
  //   await tester.pumpAndSettle();
  //   expect(find.byType(TextButton), findsOneWidget);
  //   expect(find.text('Finish'), findsOneWidget);
  // });
  //
  // testWidgets(
  //     'Check that the tapping the "Finish" button goes to the results screen',
  //     (WidgetTester tester) async {
  //   await _goToPracticeQuizForLessonOne(tester);
  //   for (int i = 0; i < numOfQuestionsInRandomQuiz; ++i) {
  //     await tester.tap(find.text('C'));
  //     await tester.pumpAndSettle();
  //     await tester.tap(find.byType(TextButton));
  //     await tester.pumpAndSettle();
  //   }
  //   expect(find.byType(ResultsScreen), findsOneWidget);
  // });
}
