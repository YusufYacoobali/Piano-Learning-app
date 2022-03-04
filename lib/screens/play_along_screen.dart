import 'package:flutter/material.dart';

/// The screen that runs the "play along" practice mode with a given track.
///
/// The track is selected by the user, then passed in to this screen.
class _PlayAlongScreenState extends State<PlayAlongScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

class PlayAlongScreen extends StatefulWidget {
  static const String id = 'play_along_screen';

  const PlayAlongScreen({Key? key}) : super(key: key);

  @override
  _PlayAlongScreenState createState() => _PlayAlongScreenState();
}