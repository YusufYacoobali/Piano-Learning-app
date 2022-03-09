import 'note.dart';

/// The note when displayed on the stave
class NoteOnStave {

  /// The note to be displayed
  late Note note;

  /// The x coordinate of the note
  late double pos;

  /// The height of the note
  late double height;

  NoteOnStave(this.note, this.pos, this.height);

  /// Move the note x in the x direction
  void move(int x) {
    pos-=x;
  }
}