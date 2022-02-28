import 'package:flutter/material.dart';

import '../components/sheet music components/music_sheet.dart';
import '../components/sheet music components/progress_timer.dart';

class SheetMusicScreenState extends State<SheetMusicScreen> {

  final MusicSheet _sheet = MusicSheet();
  late ProgressTimer _timer;
  bool _isStarted = false;

  @override
  void initState() {
    super.initState();
    _timer = ProgressTimer(_sheet);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sheet Music'),
        actions: [
          ElevatedButton(child: const Text('Start'), onPressed: () {
            if (!_isStarted) {
              _isStarted = true;
              setState(() {
                _timer.start();
              });
            }
          }),
          ElevatedButton(child: const Text('Stop'), onPressed: () {
            if (_isStarted) {
              _isStarted = false;
              setState(() {
                _timer.stop();
              });
            }
          }),
          ElevatedButton(child: const Text('Increment'), onPressed: () => _sheet.increment()),
        ],
      ),
      body: CustomPaint(
        painter: _sheet,
        child: Container(),
      ),
    );
  }
}

class SheetMusicScreen extends StatefulWidget {
  static const String id = 'sheet_music_screen';

  const SheetMusicScreen({Key? key}) : super(key: key);

  @override
  SheetMusicScreenState createState() => SheetMusicScreenState();
}