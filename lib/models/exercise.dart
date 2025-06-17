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
  final String?
      alternative; // Exercício alternativo caso o principal não esteja disponível
  final String sets; // Número de séries
  final String reps; // Número/faixa de repetições
  final String? weight; // Peso usado (opcional, pode ser definido pelo usuário)
  final ExerciseType type; // Tipo do exercício (máquina, halter, etc.)
  final ExerciseCategory category; // Grupo muscular
  final String? mediaUrl; // URL para imagem/GIF demonstrativo (opcional)
  final bool isGif; // Se o mediaUrl é um GIF ou imagem
  final String? notes; // Notas/instruções adicionais
  bool isDone; // Status de conclusão

  Exercise({
    required this.id,
    required this.name,
    this.alternative,
    required this.sets,
    required this.reps,
    this.weight,
    required this.type,
    required this.category,
    this.mediaUrl,
    this.isGif = false,
    this.notes,
    this.isDone = false,
  });
  Exercise copyWith({
    String? name,
    String? alternative,
    String? sets,
    String? reps,
    String? weight,
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
      type: type ?? this.type,
      category: category ?? this.category,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      isGif: isGif ?? this.isGif,
      notes: notes ?? this.notes,
      isDone: isDone ?? this.isDone,
    );
  }
}
