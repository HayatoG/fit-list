import 'exercise.dart';

class Workout {
  final String id;
  final String name;
  final List<Exercise> exercises;
  final String dayOfWeek;
  final String? notes;

  Workout({
    required this.id,
    required this.name,
    required this.exercises,
    required this.dayOfWeek,
    this.notes,
  });
  Workout copyWith({
    String? name,
    List<Exercise>? exercises,
    String? dayOfWeek,
    String? notes,
  }) {
    return Workout(
      id: id,
      name: name ?? this.name,
      exercises: exercises ?? this.exercises,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      notes: notes ?? this.notes,
    );
  }
}
