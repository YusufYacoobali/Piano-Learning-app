import 'package:shared_preferences/shared_preferences.dart';
import 'package:sight_reading_app/constants.dart' as constants;

class Settings {
  final Map _map = {};

  Settings() {
    _setDefaultValues();
  }

  /// Gets a setting from the map
  Object getSetting(String setting) {
    return _map[setting];
  }

  /// Updates a settings with a key and the value
  Future<void> updateSetting(String name, Object value) async {
    _map[name] = value;
    final SharedPreferences pref = await SharedPreferences.getInstance();

    if (value.runtimeType == double) {
      _map[name] = double.parse(value.toString()).toInt();
      await pref.setInt(name, double.parse(value.toString()).toInt());
    } else {
      await pref.setString(name, value.toString());
    }
  }

  /// Resets the settings back to the defaults
  void reset() {
    _setDefaultValues();
    _writeDefaultsToStorage();
  }

  /// Puts default values into the map
  void _setDefaultValues() {
    _map['volume'] = constants.defaultVolumeLevel;
  }

  /// Writes the default settings values to Shared Preferences
  Future<void> _writeDefaultsToStorage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('volume', constants.defaultVolumeLevel);
  }

  /// Loads the settings from Shared Preferences
  Future<void> loadSettingsFromStorage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int? isOnDisk = pref.getInt('volume');
    if (isOnDisk == null) {
      _setDefaultValues();
      await _writeDefaultsToStorage();
    } else {
      int? volume = pref.getInt('volume');
      if (volume != null) _map['volume'] = volume;
    }
  }
}
