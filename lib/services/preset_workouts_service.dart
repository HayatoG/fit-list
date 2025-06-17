import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/workout.dart';
import '../models/exercise.dart';

class PresetWorkoutsService {
  Future<List<Workout>> loadPresetWorkouts() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/preset_workouts.json');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      final List<dynamic> workoutsJson = jsonMap['workouts'];

      return workoutsJson.map((workoutJson) {
        return Workout(
          id: workoutJson['id'] ?? '',
          name: workoutJson['name'] ?? '',
          dayOfWeek: workoutJson['dayOfWeek'] ?? '',
          notes: workoutJson['notes'],
          exercises: (workoutJson['exercises'] as List? ?? []).map((exerciseJson) {
            return Exercise(
              id: exerciseJson['id'] ?? DateTime.now().toString(),
              name: exerciseJson['name'] ?? '',
              alternative: exerciseJson['alternative'],
              sets: exerciseJson['sets'] ?? '0',
              reps: exerciseJson['reps'] ?? '0',
              weight: exerciseJson['weight'],
              timeInSeconds: exerciseJson['timeInSeconds'],
              notes: exerciseJson['notes'],
              type: _parseExerciseType(exerciseJson['type'] ?? 'any'),
              category: _parseExerciseCategory(exerciseJson['category'] ?? 'chest'),
              mediaUrl: exerciseJson['mediaUrl'],
              isGif: exerciseJson['isGif'] ?? false,
            );
          }).toList(),
        );
      }).toList();
    } catch (e) {
      print('Error loading preset workouts: $e');
      rethrow; // Relançar o erro para tratamento adequado na UI
    }
  }

  ExerciseType _parseExerciseType(String type) {
    switch (type) {
      case 'machine':
        return ExerciseType.machine;
      case 'dumbbell':
        return ExerciseType.dumbbell;
      case 'barbell':
        return ExerciseType.barbell;
      case 'bodyweight':
        return ExerciseType.bodyweight;
      case 'weighted':
        return ExerciseType.weighted;
      default:
        return ExerciseType.any;
    }
  }

  ExerciseCategory _parseExerciseCategory(String category) {
    switch (category) {
      case 'chest':
        return ExerciseCategory.chest;
      case 'back':
        return ExerciseCategory.back;
      case 'legs':
        return ExerciseCategory.legs;
      case 'shoulders':
        return ExerciseCategory.shoulders;
      case 'biceps':
        return ExerciseCategory.biceps;
      case 'triceps':
        return ExerciseCategory.triceps;
      case 'abs':
        return ExerciseCategory.abs;
      case 'calves':
        return ExerciseCategory.calves;
      default:
        throw Exception('Unknown exercise category: $category');
    }
  }
}
