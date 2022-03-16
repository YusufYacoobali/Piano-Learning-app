///A template for all tracks to follow.
///
/// The tracks as stored in a Map: Each note is a key and the times at which the key needed to be pressed are a list a values for each key.
class Track{
  ///The map of notes and their respective timings.
  final Map noteTimings;
  ///Constructs the track, marking the map as being required
  Track({
    required this.noteTimings,
});
}