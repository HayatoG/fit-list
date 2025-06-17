import 'package:mobx/mobx.dart';
import '../models/workout.dart';
import '../models/exercise.dart';

part 'workout_store.g.dart';

class WorkoutStore = _WorkoutStore with _$WorkoutStore;

abstract class _WorkoutStore with Store {
  _WorkoutStore() {
    // Adiciona um observer para debug
    autorun((_) {
      print('Workouts atualizados: ${workouts.length} workouts');
      for (var workout in workouts) {
        print(
            'Workout: ${workout.name} (${workout.exercises.length} exercícios)');
      }
    });
  }

  @observable
  ObservableList<Workout> workouts = ObservableList<Workout>();

  @action
  void addWorkout(Workout workout) {
    print('Adicionando workout: ${workout.name}');
    workouts.add(workout);
  }

  @action
  void removeWorkout(String id) {
    workouts.removeWhere((workout) => workout.id == id);
  }

  @action
  void addExerciseToWorkout(String workoutId, Exercise exercise) {
    print('Adicionando exercício ${exercise.name} ao workout ${workoutId}');
    final workoutIndex = workouts.indexWhere((w) => w.id == workoutId);
    if (workoutIndex != -1) {
      final workout = workouts[workoutIndex];
      final newExercises = [...workout.exercises, exercise];
      workouts[workoutIndex] = workout.copyWith(exercises: newExercises);
      print('Exercício adicionado com sucesso');
    } else {
      print('Workout não encontrado');
    }
  }

  @action
  void toggleExercise(String workoutId, String exerciseId) {
    final workoutIndex = workouts.indexWhere((w) => w.id == workoutId);
    if (workoutIndex != -1) {
      final workout = workouts[workoutIndex];
      final exerciseIndex =
          workout.exercises.indexWhere((e) => e.id == exerciseId);
      if (exerciseIndex != -1) {
        final exercise = workout.exercises[exerciseIndex];
        final newExercise = exercise.copyWith(isDone: !exercise.isDone);
        final newExercises = [...workout.exercises];
        newExercises[exerciseIndex] = newExercise;
        workouts[workoutIndex] = workout.copyWith(exercises: newExercises);
      }
    }
  }

  @computed
  Map<String, List<Workout>> get workoutsByDay {
    final map = <String, List<Workout>>{};
    for (final workout in workouts) {
      if (!map.containsKey(workout.dayOfWeek)) {
        map[workout.dayOfWeek] = [];
      }
      map[workout.dayOfWeek]!.add(workout);
    }
    return map;
  }
}
