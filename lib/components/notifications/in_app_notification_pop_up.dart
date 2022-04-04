import 'package:flutter/material.dart';
import 'package:sight_reading_app/constants.dart';
import '../../screens/achievements_screen.dart';

///This is what is shown when a user completes an achievement

Future inAppNotification(BuildContext context, String text,
    {VoidCallback? onBack}) {
  return showModalBottomSheet(
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      context: context,
      builder: (context) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Achievement completed!",
                  textAlign: TextAlign.center, style: title),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:
                  //text of specific achievement completed is displayed
                  Text(text, textAlign: TextAlign.center, style: achievedText),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (onBack != null) {
                      onBack();
                    }
                  },
                  style: navButtonDeco,
                  child: const Text('Continue To Results'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (onBack != null) {
                      Navigator.pop(context);
                    }
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const AchievementsScreen();
                      }),
                    );
                  },
                  child: const Text('Check Achievements'),
                  style: navButtonDeco,
                )
              ],
            )
          ],
        );
      });
}
