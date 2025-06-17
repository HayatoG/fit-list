enum ExerciseType { machine, dumbbell, barbell, bodyweight, weighted, any }

enum ExerciseCategory {
  chest,
  back,
  legs,
  shoulders,
  biceps,
  triceps,
  abs,
  calves
}

class Exercise {
  final String id;
  final String name;
  final String? alternative;
  final String sets;
  final String reps;
  final String? weight;
  final int? timeInSeconds;
  final String? notes;
  final ExerciseType type;
  final ExerciseCategory category;
  final String? mediaUrl;
  final bool isGif;
  bool isDone;

  Exercise({
    required this.id,
    required this.name,
    this.alternative,
    required this.sets,
    required this.reps,
    this.weight,
    this.timeInSeconds,
    this.notes,
    required this.type,
    required this.category,
    this.mediaUrl,
    this.isGif = false,
    this.isDone = false,
  });
  Exercise copyWith({
    String? name,
    String? alternative,
    String? sets,
    String? reps,
    String? weight,
    int? timeInSeconds,
    String? notes,
    ExerciseType? type,
    ExerciseCategory? category,
    String? mediaUrl,
    bool? isGif,
    bool? isDone,
  }) {
    return Exercise(
      id: id,
      name: name ?? this.name,
      alternative: alternative ?? this.alternative,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      timeInSeconds: timeInSeconds ?? this.timeInSeconds,
      notes: notes ?? this.notes,
      type: type ?? this.type,
      category: category ?? this.category,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      isGif: isGif ?? this.isGif,
      isDone: isDone ?? this.isDone,
    );
  }
}
