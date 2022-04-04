import '../../storage_reader_writer.dart';

/// Tracks the score and highest score of the inputted play along track.
class PlayAlongHitCounter {

  /// The current score.
  int score = 0;

  /// The number of notes in the track.
  final int numNotes;

  /// The high score for the track.
  late double highScore;

  /// The object that will handle storage operations.
  final StorageReaderWriter _writer = StorageReaderWriter();

  /// The name of the track.
  final String songName;

  /// The difficulty selected by the user from settings.
  late final String _difficulty;

  PlayAlongHitCounter({required this.songName, required this.numNotes});

  /// Sets the difficulty by getting the difficulty value from storage, then gets the high score for the selected difficulty.
  void setDifficulty(String difficulty) {
    _difficulty = difficulty;
    getHighScore();
  }

  /// Increments the score
  void increment() {
    if (score < numNotes) {
      score++;
    }
  }

  /// Writes the high score to storage
  void _writeHighScore() async {
    String key = '${songName.toLowerCase()}-${_difficulty.toLowerCase()}-high-score';
    String percentage = getScoreAsPercentage();
    highScore = double.parse(percentage);
    _writer.write(key, percentage);
  }

  /// The high score for the track based on the current difficulty.
  void getHighScore() {
    _writer.loadDataFromStorage().then((value) {
      String key = '${songName.toLowerCase()}-${_difficulty.toLowerCase()}-high-score';
      Object? percentage = _writer.read(key);
      if (percentage == null) {
        highScore = 0;
        _writeHighScore();
      }
      else {
        highScore = double.parse(percentage.toString());
      }
    });
  }

  /// Updates the high score if the new one is higher.
  void isNewHighScore() {
    if ((score/numNotes)*100 > highScore) {
      _writeHighScore();
    }
  }

  /// The score in percentage form.
  String getScoreAsPercentage() {
    return ((score/numNotes) * 100).toStringAsFixed(0);
  }
}