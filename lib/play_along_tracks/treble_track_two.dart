import '../components/sheet_music_components/note.dart';

/// The notes for some of "Old Macdonald"
///
/// Level: Beginner

///clef of the track
const Clef clef = Clef.treble;

final Map<int, Note> _map = {
  1: Note(name: 'G4', duration: 1),
  2: Note(name: 'G4', duration: 1),
  3: Note(name: 'G4', duration: 1),
  4: Note(name: 'D4', duration: 1),
  5: Note(name: 'E4', duration: 1),
  6: Note(name: 'E4', duration: 1),
  7: Note(name: 'D4', duration: 2),
  8: Note(name: 'B4', duration: 1),
  9: Note(name: 'B4', duration: 1),
  10: Note(name: 'A4', duration: 1),
  11: Note(name: 'A4', duration: 1),
  12: Note(name: 'G4', duration: 3),
  15: Note(name: 'D4', duration: 1),

  16: Note(name: 'G4', duration: 1),
  17: Note(name: 'G4', duration: 1),
  18: Note(name: 'G4', duration: 1),
  19: Note(name: 'D4', duration: 1),
  20: Note(name: 'E4', duration: 1),
  21: Note(name: 'E4', duration: 1),
  22: Note(name: 'D4', duration: 2),
  23: Note(name: 'B4', duration: 1),
  24: Note(name: 'B4', duration: 1),
  25: Note(name: 'A4', duration: 1),
  26: Note(name: 'A4', duration: 1),
  27: Note(name: 'G4', duration: 3),
};

Map<int, Note> getTrack() {
  return _map;
}

Clef getClef() {
  return clef;
}