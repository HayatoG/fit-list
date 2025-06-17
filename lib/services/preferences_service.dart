import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String _presetWorkoutKey = 'preset_workout_loaded';

  Future<void> savePresetWorkoutChoice(bool usePresetWorkout) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_presetWorkoutKey, usePresetWorkout);
  }

  Future<bool> hasPresetWorkoutBeenChosen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_presetWorkoutKey) ?? false;
  }
}
