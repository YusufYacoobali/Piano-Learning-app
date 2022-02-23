import 'package:flutter/material.dart';
//import 'menu_screen.dart'; //For MenuButton
//import 'settings_screen.dart';
import 'package:sight_reading_app/components/app_bar_with_settings_icon.dart';

/// A list containing the names of each quiz.
//TODO: Create function to access stored data for quizzes
List<String> quizzes = <String>[];

/// A list containing the keys for each of the buttons generated by build().
List<Key> quizButtonKeys = <Key>[];

/// A list containing the user's records for each of the quizzes.
//TODO: Create function to access stored data for quiz records
List<String> quizRecords = <String>[];

/// A screen that displays a scrollable list of available quizzes with buttons to access each quiz.
///
/// An app bar is present at the top of the screen, which contains the screen's title text, a back arrow and a clickable settings icon that takes you to the settings screen.
/// There is also a button at the bottom of the screen for a "random mixed quiz".
class QuizSelectionScreen extends StatelessWidget {
  const QuizSelectionScreen({Key? key}) : super(key: key);

  /// The id used to identify the screen.
  static const String id = 'quiz_selection_screen';

  ///The key for the button that confirms the selection of a random quiz.
  static const randomQuizSelectedKey = Key('quizSelected:Random');

  ///The names of the available quizzes, with the exception of the random mixed quiz.
  //May combine functions that get names with records depending on how data is stored
  //TODO: Add ability to get quiz names from storage.
  List<String> getQuizNames() {
    return <String>[
      'Quiz 1: Lesson 1',
      'Quiz 2: Lesson 2',
      'Quiz 3: Lesson 3',
      'Quiz 4: Lesson 4',
      'Quiz 5: Lesson 5',
      'Quiz 6: Lesson 6'
    ];
  }

  ///The user records for each of the quizzes.
  //May combine functions that get names with records depending on how data is stored
  //TODO: Add ability to get quiz records from storage.
  List<String> getQuizRecords() {
    return <String>[
      'N/A',
      'N/A',
      'N/A',
      'N/A',
      'N/A',
      'N/A'
    ];
  }

  ///Builds the screen widgets.
  @override
  Widget build(BuildContext context) {
    quizzes = getQuizNames();
    quizRecords = getQuizRecords();

    quizButtonKeys = <Key>[]; //Resets list of keys
    //Generates the keys for the quiz buttons based on quiz names, with the exception of the random mixed quiz.
    for (String quiz in quizzes) {
      quizButtonKeys.add(Key('quizSelected:$quiz'));
    }

    return const Scaffold(
      appBar: AppBarWithSettingsIcon(Text('Choose a quiz:')),
    );
  }
}