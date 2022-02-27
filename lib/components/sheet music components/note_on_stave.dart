import 'note.dart';

class NoteOnStave {
  late Note note;
  late double pos;
  late double height;

  NoteOnStave(this.note, this.pos, this.height);

  void move(int x) {
    pos-=x;
  }
}