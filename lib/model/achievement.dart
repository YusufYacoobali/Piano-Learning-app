class Achievement {
  late final String text;
  final int completed;
  final int target;
  late final bool achieved;

  Achievement(this.text, this.completed, this.target) {
    achieved = (completed == target) ? true : false;
  }
}
