import '../components/sheet_music_components/note.dart';

/// The notes for some of "Faded"
///
/// Level: Expert

/// clef of the track
const Clef _clef = Clef.treble;

/// bpm in each difficulty
const List<int> _difficultyBpm = [65,75,90];

final Map<int, Note> _map = {
  1: Note(name: 'D4', duration: 0.5), // b.1
  2: Note(name: 'D4', duration: 0.5),
  3: Note(name: 'D4', duration: 0.5),
  4: Note(name: 'F#4', duration: 0.5),
  5: Note(name: 'B4', duration: 0.5), // b.2
  6: Note(name: 'B4', duration: 0.5),
  7: Note(name: 'B4', duration: 0.5),
  8: Note(name: 'A4', duration: 0.5),
  9: Note(name: 'F#4', duration: 0.5), // b.3
  10: Note(name: 'F#4', duration: 0.5),
  11: Note(name: 'F#4', duration: 0.5),
  12: Note(name: 'F#4', duration: 0.5),
  13: Note(name: 'C#4', duration: 0.5), // b.4
  14: Note(name: 'C#4', duration: 0.5),
  15: Note(name: 'C#4', duration: 0.5),
  16: Note(name: 'D4', duration: 0.5),
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