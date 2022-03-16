import '../components/sheet_music_components/note.dart';

/// The notes for the first two staves of "Ode to Joy"
///
/// Level: Beginner

///clef of the track
const Clef clef = Clef.treble;

final Map<int, Note> _map = {
  1: Note(name: 'E4', duration: 1),
  2: Note(name: 'E4', duration: 1),
  3: Note(name: 'F4', duration: 1),
  4: Note(name: 'G4', duration: 1),
  5: Note(name: 'G4', duration: 1),
  6: Note(name: 'F4', duration: 1),
  7: Note(name: 'E4', duration: 1),
  8: Note(name: 'D4', duration: 1),
  9: Note(name: 'C4', duration: 1),
  10: Note(name: 'C4', duration: 1),
  11: Note(name: 'D4', duration: 1),
  12: Note(name: 'E4', duration: 1),
  13: Note(name: 'E4', duration: 1),
  14: Note(name: 'D4', duration: 1),
  15: Note(name: 'D4', duration: 2),

  /// start of phrase two
  17: Note(name: 'E4', duration: 1),
  18: Note(name: 'E4', duration: 1),
  19: Note(name: 'F4', duration: 1),
  20: Note(name: 'G4', duration: 1),
  21: Note(name: 'G4', duration: 1),
  22: Note(name: 'F4', duration: 1),
  23: Note(name: 'E4', duration: 1),
  24: Note(name: 'D4', duration: 1),
  25: Note(name: 'C4', duration: 1),
  26: Note(name: 'C4', duration: 1),
  27: Note(name: 'D4', duration: 1),
  28: Note(name: 'E4', duration: 1),
  29: Note(name: 'D4', duration: 1),
  30: Note(name: 'C4', duration: 1),
  31: Note(name: 'C4', duration: 2),
};

Map<int, Note> getTrack() {
  return _map;
}

Clef getClef() {
  return clef;
}