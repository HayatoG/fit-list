// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WorkoutStore on _WorkoutStore, Store {
  Computed<Map<String, List<Exercise>>>? _$exercisesByDayComputed;

  @override
  Map<String, List<Exercise>> get exercisesByDay =>
      (_$exercisesByDayComputed ??= Computed<Map<String, List<Exercise>>>(
              () => super.exercisesByDay,
              name: '_WorkoutStore.exercisesByDay'))
          .value;
  Computed<bool>? _$hasWorkoutsComputed;

  @override
  bool get hasWorkouts =>
      (_$hasWorkoutsComputed ??= Computed<bool>(() => super.hasWorkouts,
              name: '_WorkoutStore.hasWorkouts'))
          .value;
  Computed<Map<String, List<Workout>>>? _$workoutsByDayComputed;

  @override
  Map<String, List<Workout>> get workoutsByDay => (_$workoutsByDayComputed ??=
          Computed<Map<String, List<Workout>>>(() => super.workoutsByDay,
              name: '_WorkoutStore.workoutsByDay'))
      .value;

  late final _$workoutsAtom =
      Atom(name: '_WorkoutStore.workouts', context: context);

  @override
  ObservableList<Workout> get workouts {
    _$workoutsAtom.reportRead();
    return super.workouts;
  }

  bool _workoutsIsInitialized = false;

  @override
  set workouts(ObservableList<Workout> value) {
    _$workoutsAtom
        .reportWrite(value, _workoutsIsInitialized ? super.workouts : null, () {
      super.workouts = value;
      _workoutsIsInitialized = true;
    });
  }

  late final _$setWorkoutsAsyncAction =
      AsyncAction('_WorkoutStore.setWorkouts', context: context);

  @override
  Future<void> setWorkouts(List<Workout> newWorkouts) {
    return _$setWorkoutsAsyncAction.run(() => super.setWorkouts(newWorkouts));
  }

  late final _$_WorkoutStoreActionController =
      ActionController(name: '_WorkoutStore', context: context);

  @override
  void addWorkout(Workout workout) {
    final _$actionInfo = _$_WorkoutStoreActionController.startAction(
        name: '_WorkoutStore.addWorkout');
    try {
      return super.addWorkout(workout);
    } finally {
      _$_WorkoutStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeWorkout(String id) {
    final _$actionInfo = _$_WorkoutStoreActionController.startAction(
        name: '_WorkoutStore.removeWorkout');
    try {
      return super.removeWorkout(id);
    } finally {
      _$_WorkoutStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addExerciseToWorkout(String workoutId, Exercise exercise) {
    final _$actionInfo = _$_WorkoutStoreActionController.startAction(
        name: '_WorkoutStore.addExerciseToWorkout');
    try {
      return super.addExerciseToWorkout(workoutId, exercise);
    } finally {
      _$_WorkoutStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleExercise(String workoutId, String exerciseId) {
    final _$actionInfo = _$_WorkoutStoreActionController.startAction(
        name: '_WorkoutStore.toggleExercise');
    try {
      return super.toggleExercise(workoutId, exerciseId);
    } finally {
      _$_WorkoutStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
workouts: ${workouts},
exercisesByDay: ${exercisesByDay},
hasWorkouts: ${hasWorkouts},
workoutsByDay: ${workoutsByDay}
    ''';
  }
}
