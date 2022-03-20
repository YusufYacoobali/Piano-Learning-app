import 'package:flutter/material.dart';
import 'package:sight_reading_app/screens/achievements_screen.dart';
import '../../components/pop_up_components/pop_up_content_builder.dart';
import '../../constants.dart';
import '../../screens/menu_screen.dart';

class AchievementNotification extends StatelessWidget {
  const AchievementNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.black.withOpacity(0.8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              decoration: cardBackground,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: menuLength, vertical: menuWidth),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: getDisplay(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getDisplay() {
    List<Widget> display = [];
    display.add(const Text("Congrats on completing an achivement"));
    display.add(const SizedBox(
      height: 10,
    ));
    display
        .add(Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ElevatedButton(
        onPressed: () {
          //Navigator.popUntil(context, ModalRoute.withName(MenuScreen.id));
        },
        style: navButtonDeco,
        child: const Text('Review answers'),
      ),
      ElevatedButton(
        onPressed: () {
          //  Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) {
          //     return getResultsScreen();
          //   }),
          // );
        },
        style: navButtonDeco,
        child: const Text('Check Achievements'),
      ),
    ]));
    // for (Widget option in widget.options) {
    //   display.add(option);
    //   display.add(const SizedBox(height: 5,));
    // }
    return display;
  }
}
