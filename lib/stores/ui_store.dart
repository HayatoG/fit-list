import 'package:mobx/mobx.dart';
import '../models/exercise.dart';

part 'ui_store.g.dart';

class UIStore = _UIStore with _$UIStore;

abstract class _UIStore with Store {
  @observable
  ObservableMap<String, bool> expandedDays = ObservableMap<String, bool>();

  @observable
  ObservableMap<String, bool> dayCompletionStatus =
      ObservableMap<String, bool>();

  @observable
  String exerciseName = '';

  @observable
  String exerciseSets = '';

  @observable
  String exerciseReps = '';

  @observable
  String exerciseWeight = '';

  @observable
  String? mediaUrl;

  @observable
  bool isGif = false;

  @observable
  ExerciseType selectedType = ExerciseType.any;

  @observable
  ExerciseCategory selectedCategory = ExerciseCategory.chest;

  @action
  void setExerciseName(String value) => exerciseName = value;

  @action
  void setExerciseSets(String value) => exerciseSets = value;

  @action
  void setExerciseReps(String value) => exerciseReps = value;

  @action
  void setExerciseWeight(String value) => exerciseWeight = value;

  @action
  void setMediaUrl(String? value) => mediaUrl = value;

  @action
  void setIsGif(bool value) => isGif = value;

  @action
  void setSelectedType(ExerciseType value) => selectedType = value;

  @action
  void setSelectedCategory(ExerciseCategory value) => selectedCategory = value;

  @action
  void toggleDayExpansion(String day) {
    expandedDays[day] = !(expandedDays[day] ?? false);
  }

  @action
  void toggleDayCompletion(String day) {
    dayCompletionStatus[day] = !(dayCompletionStatus[day] ?? false);
  }

  @action
  void resetExerciseForm() {
    exerciseName = '';
    exerciseSets = '';
    exerciseReps = '';
    exerciseWeight = '';
    mediaUrl = null;
    isGif = false;
    selectedType = ExerciseType.any;
    selectedCategory = ExerciseCategory.chest;
  }

  @computed
  bool get isExerciseFormValid =>
      exerciseName.isNotEmpty &&
      exerciseSets.isNotEmpty &&
      exerciseReps.isNotEmpty;
}
