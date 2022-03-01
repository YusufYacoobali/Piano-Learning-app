class Note {
  late String name;
  late int time;
  late double duration;

  Note(this.name, this.time, this.duration);
}

class NextNote {
  bool hasNextNote = false;
  late Note _nextNote;

  Note getNextNote() {
    hasNextNote = false;
    return _nextNote;
  }

  void setNextNote(Note note) {
    hasNextNote = true;
    _nextNote = note;
  }
}