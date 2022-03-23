import 'package:flutter/material.dart';
import 'package:sight_reading_app/constants.dart';

import '../screens/achievements_screen.dart';

inAppNotification(context) {
  return showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60), topRight: Radius.circular(60))),
      context: context,
      builder: (context) {
        return Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Achievement completed!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue.shade800, fontSize: 30),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: navButtonDeco,
                  child: const Text('Continue To Results'),
                ),
                ElevatedButton(
                  onPressed: () {
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
