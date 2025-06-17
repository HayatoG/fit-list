import 'package:mobx/mobx.dart';
import '../models/workout.dart';
import '../models/exercise.dart';
import '../constants/weekdays.dart';

part 'workout_store.g.dart';

class WorkoutStore = _WorkoutStore with _$WorkoutStore;

abstract class _WorkoutStore with Store {
  _WorkoutStore() {
    workouts = ObservableList<Workout>();
  }

  @observable
  late ObservableList<Workout> workouts;

  @computed
  Map<String, List<Exercise>> get exercisesByDay {
    var map = <String, List<Exercise>>{};
    for (var workout in workouts) {
      if (map[workout.dayOfWeek] == null) {
        map[workout.dayOfWeek] = [];
      }
      map[workout.dayOfWeek]!.addAll(workout.exercises);
    }
    return map;
  }

  @computed
  bool get hasWorkouts => workouts.isNotEmpty;
  @action
  Future<void> setWorkouts(List<Workout> newWorkouts) async {
    print('Iniciando atualização dos workouts...');
    try {
      runInAction(() {
        workouts.clear();
        workouts.addAll(newWorkouts);
      });

      print('Workouts atualizados: ${workouts.length} workouts');
      for (var workout in workouts) {
        print('Workout: ${workout.name} - ${workout.dayOfWeek}');
        print('Número de exercícios: ${workout.exercises.length}');
        for (var exercise in workout.exercises) {
          print('  - Exercício: ${exercise.name}');
          print('    Sets: ${exercise.sets}, Reps: ${exercise.reps}');
          print('    Tipo: ${exercise.type}, Categoria: ${exercise.category}');
        }
      }
    } catch (e) {
      print('Erro ao atualizar workouts:');
      print('Mensagem do erro: $e');
      print('Stack trace: ${StackTrace.current}');
      rethrow;
    }
  }

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
    var map = <String, List<Workout>>{};

    // Inicializa todos os dias com uma lista vazia
    for (var day in weekDays) {
      map[day.name] = [];
    }

    // Adiciona os treinos aos respectivos dias
    for (var workout in workouts) {
      if (map[workout.dayOfWeek] != null) {
        map[workout.dayOfWeek]!.add(workout);
      }
    }

    return map;
  }
}
