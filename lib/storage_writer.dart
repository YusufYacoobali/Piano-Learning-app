import 'package:shared_preferences/shared_preferences.dart';

class StorageWriter {
  final Map _map = {};

  StorageWriter() {
    _setDefaultValues();
    _writeDefaultsToStorage();
  }

  Object read(String key) {
    return _map[key];
  }

  Future<void> write(String key, Object value) async {
    // 'lesson 1' -> 3
    _map[key] = value;
    final SharedPreferences pref = await SharedPreferences.getInstance();
    _map[key] = value.toString();
    await pref.setString(key, value.toString());
  }

  // Resets the StorageWriter back to the defaults
  void reset() {
    _setDefaultValues();
    _writeDefaultsToStorage();
  }

  // Puts default values into the map
  void _setDefaultValues() {
    // _map['volume'] = constants.defaultVolumeLevel;
    // _map['difficulty'] = constants.defaultDifficultyLevel;
    // With 7 lessons:

    for (int i = 1; i <= 7; ++i) {
      _map['lesson $i'] = 0;
    }
  }

  // Writes the default StorageWriter values to Shared Preferences
  Future<void> _writeDefaultsToStorage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.setInt('volume', constants.defaultVolumeLevel);
    // pref.setString('difficulty', constants.defaultDifficultyLevel);
    for (int i = 1; i <= 7; ++i) {
      pref.setString('lesson $i', '0');
    }
  }

  // Loads the StorageWriter from Shared Preferences
  Future<void> loadStorageWriterFromStorage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    // int? isOnDisk = pref.getInt('volume');
    // if (isOnDisk == null) {
    //   _setDefaultValues();
    //   await _writeDefaultsToStorage();
    // } else {
    //   int? volume = pref.getInt('volume');
    //   String? difficulty = pref.getString('difficulty');
    //   if (volume != null) _map['volume'] = volume;
    //   if (difficulty != null) _map['difficulty'] = difficulty;
    // }

    int? isOnDisk = pref.getInt('lesson 1');
    if (isOnDisk == null) {
      _setDefaultValues();
      await _writeDefaultsToStorage();
    } else {
      for (int i = 1; i <= 7; ++i) {
        String? lessonScore = pref.getString('lesson $i');
        if (lessonScore != null) _map['lesson $i'] = lessonScore;
      }
    }
  }
}
