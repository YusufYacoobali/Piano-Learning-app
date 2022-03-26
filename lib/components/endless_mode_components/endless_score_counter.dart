import '../../storage_reader_writer.dart';
import '../sheet_music_components/note.dart';

/// Keeps the score and highest score of the endless mode
class EndlessScoreCounter {

  /// The current score
  int score = 0;

  /// The high score
  late final int highScore;

  /// Reads and writes high score to storage
  final StorageReaderWriter _writer = StorageReaderWriter();

  /// Writes the high score to storage
  void writeHighScore(Clef clef, String difficulty) async {
    String key = 'endless-treble-${difficulty.toLowerCase()}-high-score';
    if (clef == Clef.bass) {
      key = 'endless-bass-${difficulty.toLowerCase()}-high-score';
    }
    _writer.write(key, score.toString());
  }

  /// Gets the high score
  void getHighScore(Clef clef, String difficulty) {
    _writer.loadDataFromStorage().then((value) {
      String key = 'endless-treble-${difficulty.toLowerCase()}-high-score';
      if (clef == Clef.bass) {
        key = 'endless-bass-${difficulty.toLowerCase()}-high-score';
      }
      Object? score = _writer.read(key);
      if (score == null) {
        highScore = 0;
        writeHighScore(clef, difficulty);
      }
      else {
        highScore = int.parse(score.toString());
      }
    });
  }

  /// Updates the score if the new one is higher
  void isNewHighScore(Clef clef, String difficulty) {
    if (score > highScore) {
      writeHighScore(clef, difficulty);
    }
  }
}