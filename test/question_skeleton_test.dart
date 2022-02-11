import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';
import 'package:sight_reading_app/components/question_skeleton.dart';

void main() {
  testWidgets('check that question number is displayed',
      (WidgetTester tester) async {
    /*
    This can happen because you have not added a WidgetsApp, CupertinoApp, or MaterialApp widget (those
widgets introduce a MediaQuery), or it can happen if the context you use comes from a widget above
those widgets.

     */
    //this too
    await tester.pumpWidget(const QuestionSkeleton());
    await tester.pump();
    expect(find.text('Question 1 of 1'), findsOneWidget);
  });

  testWidgets('check that the question text is displayed',
      (WidgetTester tester) async {
    //this cause the error?
    await tester.pumpWidget(const QuestionSkeleton());
    await tester.pump();
    expect(
        find.text(
            'Question 1: What is the letter that is used to represent "Do"?'),
        findsOneWidget);
  });

  testWidgets('check that the option button 1 is displayed',
      (WidgetTester tester) async {
    //buttonOne = const Container(child: Text('C'));

    await tester.pumpWidget(const QuestionSkeleton());
    expect(find.text('C'), findsOneWidget);
  });
  testWidgets('check that the option button 2 is displayed',
      (WidgetTester tester) async {
    //buttonOne = const Container(child: Text('C'));

    await tester.pumpWidget(const QuestionSkeleton());
    expect(find.text('D'), findsOneWidget);
  });
  testWidgets('check that the option button 3 is displayed',
      (WidgetTester tester) async {
    //buttonOne = const Container(child: Text('C'));

    await tester.pumpWidget(const QuestionSkeleton());
    expect(find.text('E'), findsOneWidget);
  });
  testWidgets('check that the option button 4 is displayed',
      (WidgetTester tester) async {
    //buttonOne = const Container(child: Text('C'));

    await tester.pumpWidget(const QuestionSkeleton());
    expect(find.text('F'), findsOneWidget);
  });
  testWidgets('check that the option button 5 is displayed',
      (WidgetTester tester) async {
    //buttonOne = const Container(child: Text('C'));

    await tester.pumpWidget(const QuestionSkeleton());
    expect(find.text('G'), findsOneWidget);
  });
  testWidgets('check that the option button 6 is displayed',
      (WidgetTester tester) async {
    //buttonOne = const Container(child: Text('C'));

    await tester.pumpWidget(const QuestionSkeleton());
    expect(find.text('A'), findsOneWidget);
  });
  testWidgets('check that the option button 7 is displayed',
      (WidgetTester tester) async {
    //buttonOne = const Container(child: Text('C'));

    await tester.pumpWidget(const QuestionSkeleton());
    expect(find.text('B'), findsOneWidget);
  });
}
