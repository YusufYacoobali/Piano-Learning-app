import '../components/sheet_music_components/note.dart';

/// The notes for some of "Faded"
///
/// Level: Expert

/// clef of the track
const Clef _clef = Clef.treble;

/// bpm in each difficulty
const List<int> _difficultyBpm = [65,75,90];

final Map<int, Note> _map = {
  1:Note(name: 'G4', duration: 0.5), // b.1
  2: Note(name: 'G4', duration: 0.5),
  3: Note(name: 'G4', duration: 0.5),
  4: Note(name: 'B4', duration: 0.5),
  5: Note(name: 'E4', duration: 0.5), // b.2
  6: Note(name: 'E4', duration: 0.5),
  7: Note(name: 'E4', duration: 0.5),
  8: Note(name: 'B4', duration: 0.5),
  9: Note(name: 'B4', duration: 0.5), // b.3
  10: Note(name: 'B4', duration: 0.5),
  11: Note(name: 'B4', duration: 0.5),
  12: Note(name: 'B4', duration: 0.5),
  13: Note(name: 'F#4', duration: 0.5), // b.4
  14: Note(name: 'F#4', duration: 0.5),
  15: Note(name: 'F#4', duration: 0.5),
  16: Note(name: 'E4', duration: 0.5),


  17: Note(name: 'G4', duration: 0.5), //b.1
  18: Note(name: 'G4', duration: 0.5),
  19: Note(name: 'E4', duration: 0.5),
  20: Note(name: 'G4', duration: 0.5),
  21: Note(name: 'E4', duration: 0.5),
  22: Note(name: 'G4', duration: 0.5),
  23: Note(name: 'A4', duration: 0.5),
  24: Note(name: 'B4', duration: 0.5), //b.2
  25: Note(name: 'G4', duration: 0.5),
  26: Note(name: 'G4', duration: 0.5),
  27: Note(name: 'D4', duration: 0.5),
  28: Note(name: 'B4', duration: 1),
  29: Note(name: 'G4', duration: 2), //b.3
  //break
  31: Note(name: 'G4', duration: 0.5),
  32: Note(name: 'G4', duration: 0.5),
  33: Note(name: 'G4', duration: 0.5),
  34: Note(name: 'F#4', duration: 0.5), //b.4
  35: Note(name: 'E4', duration: 0.5),
  36: Note(name: 'F#4', duration: 0.5),
  37: Note(name: 'F#4', duration: 0.5),
  38: Note(name: 'E4', duration: 0.5),
  39: Note(name: 'G4', duration: 1),
  // start of phrase two
  41: Note(name: 'G4', duration: 0.5),
  42: Note(name: 'G4', duration: 0.5),
  43: Note(name: 'E4', duration: 0.5),
  44: Note(name: 'G4', duration: 0.5),
  45: Note(name: 'E4', duration: 0.5),
  46: Note(name: 'G4', duration: 0.5),
  47: Note(name: 'A4', duration: 0.5), // b.5
  48: Note(name: 'B4', duration: 1),
  49: Note(name: 'G4', duration: 0.5),
  50: Note(name: 'G4', duration: 0.5),
  51: Note(name: 'D4', duration: 0.5),
  52: Note(name: 'B4', duration: 3), // b.6
  55: Note(name: 'G4', duration: 0.5),
  56: Note(name: 'G4', duration: 0.5),
  //start of chorus
  57: Note(name: 'B4', duration: 0.5), // b.7
  58: Note(name: 'B4', duration: 0.5),
  59: Note(name: 'B4', duration: 0.5),

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