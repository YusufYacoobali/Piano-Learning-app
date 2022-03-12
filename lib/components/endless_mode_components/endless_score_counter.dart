import 'package:shared_preferences/shared_preferences.dart';

import '../sheet_music_components/note.dart';

/// Keeps the score and highest score of the endless mode
class EndlessScoreCounter {

  /// The current score
  int score = 0;

  /// The high score
  late final int highScore;

  ///TODO: Make storage writer work for storing high score
  //final StorageReaderWriter _writer = StorageReaderWriter();

  /// Writes the high score to storage
  void writeHighScore(Clef clef) async {
    String key = 'endless-treble-high-score';
    if (clef == Clef.bass) {
      key = 'endless-bass-high-score';
    }
    //_writer.write(key, score.toString());
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, score.toString());
  }

  /// Gets the high score
  void getHighScore(Clef clef) async {
    String key = 'endless-treble-high-score';
    if (clef == Clef.bass) {
      key = 'endless-bass-high-score';
    }
    //Object? score = _writer.read(key);
    SharedPreferences pref = await SharedPreferences.getInstance();
    Object? score = pref.get(key);
    if (score == null) {
      //_writer.reset();
      highScore = 0;
      writeHighScore(clef);
    }
    else {
      highScore = int.parse(score.toString());
    }
  }

  /// Updates the score if the new one is higher
  void isNewHighScore(Clef clef) {
    if (score > highScore) {
      writeHighScore(clef);
    }
  }
}