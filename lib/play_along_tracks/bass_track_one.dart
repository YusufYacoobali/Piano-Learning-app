import '../components/sheet_music_components/note.dart';

/// The notes for a simple bass melody
///
/// Level: Beginner

/// clef of the track
const Clef _clef = Clef.bass;

/// Bpm in each difficulty
const List<int> _difficultyBpm = [120, 160, 200];

final Map<int, Note> _map = {
  1: Note(name: 'C3', duration: 1), //b.1
  2: Note(name: 'D3', duration: 1),
  3: Note(name: 'E3', duration: 2),
  5: Note(name: 'E3', duration: 1), //b.2
  6: Note(name: 'F3', duration: 1),
  7: Note(name: 'G3', duration: 2),
  9: Note(name: 'G3', duration: 1), //b.3
  10: Note(name: 'F3', duration: 1),
  11: Note(name: 'E3', duration: 1),
  12: Note(name: 'D3', duration: 1),
  13: Note(name: 'C3', duration: 4), //b.3

  /// start of phrase two
  17: Note(name: 'C3', duration: 1), //b.5
  18: Note(name: 'D3', duration: 1),
  19: Note(name: 'E3', duration: 2),
  21: Note(name: 'E3', duration: 1), //b.6
  22: Note(name: 'F3', duration: 1),
  23: Note(name: 'G3', duration: 2),
  25: Note(name: 'G3', duration: 1), //b.7
  26: Note(name: 'F3', duration: 1),
  27: Note(name: 'E3', duration: 1),
  28: Note(name: 'D3', duration: 1),
  29: Note(name: 'C3', duration: 2), //b.8
  31: Note(name: 'G3', duration: 2),
  33: Note(name: 'C3', duration: 2), //b.9
};

Map<int, Note> getTrack() {
  return _map;
}

Clef getClef() {
  return _clef;
}

List<int> getDifficultyBpm() {
  return _difficultyBpm;
}