import '../components/sheet_music_components/note.dart';

/// The notes for some of "Faded"
///
/// Level: Expert

/// clef of the track
const Clef _clef = Clef.treble;

/// bpm in each difficulty
const List<int> _difficultyBpm = [75,90,110];

final Map<int, Note> _map = {
  1: Note(name: 'G4', duration: 0.5), //b.1
  2: Note(name: 'G4', duration: 0.5),
  3: Note(name: 'E4', duration: 0.5),
  4: Note(name: 'G4', duration: 0.5),
  5: Note(name: 'E4', duration: 0.5),
  6: Note(name: 'G4', duration: 0.5),
  7: Note(name: 'A4', duration: 0.5),
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