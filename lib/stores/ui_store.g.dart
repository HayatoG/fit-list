// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UIStore on _UIStore, Store {
  Computed<bool>? _$isExerciseFormValidComputed;

  @override
  bool get isExerciseFormValid => (_$isExerciseFormValidComputed ??=
          Computed<bool>(() => super.isExerciseFormValid,
              name: '_UIStore.isExerciseFormValid'))
      .value;

  late final _$expandedDaysAtom =
      Atom(name: '_UIStore.expandedDays', context: context);

  @override
  ObservableMap<String, bool> get expandedDays {
    _$expandedDaysAtom.reportRead();
    return super.expandedDays;
  }

  @override
  set expandedDays(ObservableMap<String, bool> value) {
    _$expandedDaysAtom.reportWrite(value, super.expandedDays, () {
      super.expandedDays = value;
    });
  }

  late final _$dayCompletionStatusAtom =
      Atom(name: '_UIStore.dayCompletionStatus', context: context);

  @override
  ObservableMap<String, bool> get dayCompletionStatus {
    _$dayCompletionStatusAtom.reportRead();
    return super.dayCompletionStatus;
  }

  @override
  set dayCompletionStatus(ObservableMap<String, bool> value) {
    _$dayCompletionStatusAtom.reportWrite(value, super.dayCompletionStatus, () {
      super.dayCompletionStatus = value;
    });
  }

  late final _$exerciseNameAtom =
      Atom(name: '_UIStore.exerciseName', context: context);

  @override
  String get exerciseName {
    _$exerciseNameAtom.reportRead();
    return super.exerciseName;
  }

  @override
  set exerciseName(String value) {
    _$exerciseNameAtom.reportWrite(value, super.exerciseName, () {
      super.exerciseName = value;
    });
  }

  late final _$exerciseSetsAtom =
      Atom(name: '_UIStore.exerciseSets', context: context);

  @override
  String get exerciseSets {
    _$exerciseSetsAtom.reportRead();
    return super.exerciseSets;
  }

  @override
  set exerciseSets(String value) {
    _$exerciseSetsAtom.reportWrite(value, super.exerciseSets, () {
      super.exerciseSets = value;
    });
  }

  late final _$exerciseRepsAtom =
      Atom(name: '_UIStore.exerciseReps', context: context);

  @override
  String get exerciseReps {
    _$exerciseRepsAtom.reportRead();
    return super.exerciseReps;
  }

  @override
  set exerciseReps(String value) {
    _$exerciseRepsAtom.reportWrite(value, super.exerciseReps, () {
      super.exerciseReps = value;
    });
  }

  late final _$exerciseWeightAtom =
      Atom(name: '_UIStore.exerciseWeight', context: context);

  @override
  String get exerciseWeight {
    _$exerciseWeightAtom.reportRead();
    return super.exerciseWeight;
  }

  @override
  set exerciseWeight(String value) {
    _$exerciseWeightAtom.reportWrite(value, super.exerciseWeight, () {
      super.exerciseWeight = value;
    });
  }

  late final _$mediaUrlAtom = Atom(name: '_UIStore.mediaUrl', context: context);

  @override
  String? get mediaUrl {
    _$mediaUrlAtom.reportRead();
    return super.mediaUrl;
  }

  @override
  set mediaUrl(String? value) {
    _$mediaUrlAtom.reportWrite(value, super.mediaUrl, () {
      super.mediaUrl = value;
    });
  }

  late final _$isGifAtom = Atom(name: '_UIStore.isGif', context: context);

  @override
  bool get isGif {
    _$isGifAtom.reportRead();
    return super.isGif;
  }

  @override
  set isGif(bool value) {
    _$isGifAtom.reportWrite(value, super.isGif, () {
      super.isGif = value;
    });
  }

  late final _$selectedTypeAtom =
      Atom(name: '_UIStore.selectedType', context: context);

  @override
  ExerciseType get selectedType {
    _$selectedTypeAtom.reportRead();
    return super.selectedType;
  }

  @override
  set selectedType(ExerciseType value) {
    _$selectedTypeAtom.reportWrite(value, super.selectedType, () {
      super.selectedType = value;
    });
  }

  late final _$selectedCategoryAtom =
      Atom(name: '_UIStore.selectedCategory', context: context);

  @override
  ExerciseCategory get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(ExerciseCategory value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$_UIStoreActionController =
      ActionController(name: '_UIStore', context: context);

  @override
  void setExerciseName(String value) {
    final _$actionInfo = _$_UIStoreActionController.startAction(
        name: '_UIStore.setExerciseName');
    try {
      return super.setExerciseName(value);
    } finally {
      _$_UIStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExerciseSets(String value) {
    final _$actionInfo = _$_UIStoreActionController.startAction(
        name: '_UIStore.setExerciseSets');
    try {
      return super.setExerciseSets(value);
    } finally {
      _$_UIStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExerciseReps(String value) {
    final _$actionInfo = _$_UIStoreActionController.startAction(
        name: '_UIStore.setExerciseReps');
    try {
      return super.setExerciseReps(value);
    } finally {
      _$_UIStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExerciseWeight(String value) {
    final _$actionInfo = _$_UIStoreActionController.startAction(
        name: '_UIStore.setExerciseWeight');
    try {
      return super.setExerciseWeight(value);
    } finally {
      _$_UIStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMediaUrl(String? value) {
    final _$actionInfo =
        _$_UIStoreActionController.startAction(name: '_UIStore.setMediaUrl');
    try {
      return super.setMediaUrl(value);
    } finally {
      _$_UIStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsGif(bool value) {
    final _$actionInfo =
        _$_UIStoreActionController.startAction(name: '_UIStore.setIsGif');
    try {
      return super.setIsGif(value);
    } finally {
      _$_UIStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedType(ExerciseType value) {
    final _$actionInfo = _$_UIStoreActionController.startAction(
        name: '_UIStore.setSelectedType');
    try {
      return super.setSelectedType(value);
    } finally {
      _$_UIStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(ExerciseCategory value) {
    final _$actionInfo = _$_UIStoreActionController.startAction(
        name: '_UIStore.setSelectedCategory');
    try {
      return super.setSelectedCategory(value);
    } finally {
      _$_UIStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleDayExpansion(String day) {
    final _$actionInfo = _$_UIStoreActionController.startAction(
        name: '_UIStore.toggleDayExpansion');
    try {
      return super.toggleDayExpansion(day);
    } finally {
      _$_UIStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleDayCompletion(String day) {
    final _$actionInfo = _$_UIStoreActionController.startAction(
        name: '_UIStore.toggleDayCompletion');
    try {
      return super.toggleDayCompletion(day);
    } finally {
      _$_UIStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetExerciseForm() {
    final _$actionInfo = _$_UIStoreActionController.startAction(
        name: '_UIStore.resetExerciseForm');
    try {
      return super.resetExerciseForm();
    } finally {
      _$_UIStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
expandedDays: ${expandedDays},
dayCompletionStatus: ${dayCompletionStatus},
exerciseName: ${exerciseName},
exerciseSets: ${exerciseSets},
exerciseReps: ${exerciseReps},
exerciseWeight: ${exerciseWeight},
mediaUrl: ${mediaUrl},
isGif: ${isGif},
selectedType: ${selectedType},
selectedCategory: ${selectedCategory},
isExerciseFormValid: ${isExerciseFormValid}
    ''';
  }
}
