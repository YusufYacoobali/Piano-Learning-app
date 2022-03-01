class Note {
  late String name;
  late int time;
  late double duration;

  Note(this.name, this.time, this.duration);

  String getNameWithoutSymbol() {
    return name[0] + name[name.length - 1];
  }

  int getLevelAsInt() {
    return int.parse(name[name.length - 1]);
  }

  static bool greaterOrEqualTo(Note note1, Note note2) {
    Map<String, int> noteValues = <String, int>{
      'C': 0,
      'D': 1,
      'E': 2,
      'F': 3,
      'G': 4,
      'A': 5,
      'B': 6,
    };
    int noteLevel1 = note1.getLevelAsInt();
    int noteLevel2 = note2.getLevelAsInt();
    if (noteLevel1 > noteLevel2) return true;
    if (noteLevel2 > noteLevel1) return false;
    if (note1.getNameWithoutSymbol() == note2.getNameWithoutSymbol()) return true;
    int? num1 = noteValues[note1.name[0]];
    int? num2 = noteValues[note2.name[0]];
    int n1 = -2;
    int n2 = -1;
    if (num1 != null) n1 = num1;
    if (num2 != null) n2 = num2;
    return n1 > n2;
  }
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