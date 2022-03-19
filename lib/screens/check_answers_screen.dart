import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/menu_screen.dart';
import '../constants.dart';

class _CheckAnswersScreenState extends State<CheckAnswersScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///Sets the title of the check answers screen
  Widget getTitleWidget() {
    return const Expanded(
      flex: 1,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Check Answers',
            textAlign: TextAlign.center,
            style: titleWidgetTextStyle,
          ),
        ),
      ),
    );
  }

  // Widget getScoreWidget() {
  //   return Expanded(
  //     flex: 1,
  //     child: FittedBox(
  //       fit: BoxFit.contain,
  //       child: Padding(
  //         padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
  //         child: Text(
  //           'You got ${getPercentage()}%',
  //           textAlign: TextAlign.center,
  //           style: scoreWidgetTextStyle,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // String getPercentage() {
  //   double unroundedPercentage = widget.score * 100;
  //   return unroundedPercentage.toStringAsFixed(1);
  // }

  // Widget getIconWidget() {
  //   return Expanded(
  //     flex: 2,
  //     child: FittedBox(
  //       fit: BoxFit.contain,
  //       child: Icon(
  //         getIcon(),
  //         //color: Colors.grey.shade300,
  //         size: 150.0,
  //       ),
  //     ),
  //   );
  // }
  //
  // IconData getIcon() {
  //   if (widget.score < passThreshold) {
  //     return Icons.cancel;
  //   } else {
  //     return Icons.check_circle;
  //   }
  // }
  ///creates an exit button which takes back to the main menu
  Widget getNavigationButtons() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName(MenuScreen.id));
              },
              style: navButtonDeco,
              child: const Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff5f0a87), Color(0xffa4508b)],
          ),
        ),
        //color: Colors.lightGreen.shade500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            getTitleWidget(),
            //getIconWidget(),
            //getScoreWidget(),
            getNavigationButtons(),
          ],
        ),
      ),
    );
  }
}

class CheckAnswersScreen extends StatefulWidget {
  static const String id = 'check_answers_screen';

  const CheckAnswersScreen({Key? key}) : super(key: key);

  @override
  _CheckAnswersScreenState createState() => _CheckAnswersScreenState();
}
