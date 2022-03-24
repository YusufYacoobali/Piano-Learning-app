import '../components/sheet_music_components/note.dart';

/// The notes for some of "Pradeep's Composition"
///
/// Level: Expert

/// clef of the track
const Clef _clef = Clef.treble;

/// bpm in each difficulty
const List<int> _difficultyBpm = [65,75,90];

final Map<int, Note> _map = {
  1: Note(name: 'D4', duration: 1),
  2: Note(name: 'F4', duration: 1),
  3: Note(name: 'E4', duration: 1),
  4: Note(name: 'F4', duration: 1),
  5: Note(name: 'C4', duration: 1),
  6: Note(name: 'E4', duration: 1),
  7: Note(name: 'D4', duration: 1),
  8: Note(name: 'E4', duration: 1),
  9: Note(name: 'D4', duration: 1),
  10: Note(name: 'F4', duration: 1),
  11: Note(name: 'E4', duration: 1),
  12: Note(name: 'F4', duration: 1),
  13: Note(name: 'C4', duration: 1),
};

Map<int, Note> getTrack(){
  return _map;
}

Clef getClef() {
  return _clef;
}

List<int> getDifficultyBpm(){
  return _difficultyBpm;
}