import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/workout_store.dart';
import '../stores/ui_store.dart';
import '../models/workout.dart';
import '../models/exercise.dart';
import '../constants/weekdays.dart';
import '../theme/app_styles.dart';
import '../widgets/exercise_media_viewer.dart';
import '../utils/media_helper.dart';

class HomeScreen extends StatefulWidget {
  final WorkoutStore workoutStore;
  final UIStore uiStore;

  const HomeScreen({
    Key? key,
    required this.workoutStore,
    required this.uiStore,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, bool> _expandedDays = {};
  final Map<String, bool> _dayCompletionStatus = {};
  final TextEditingController nameController = TextEditingController();

  // Inicializando com valores padrão
  ExerciseType selectedType = ExerciseType.any;
  ExerciseCategory selectedCategory = ExerciseCategory.chest;
  final TextEditingController setsController = TextEditingController();
  final TextEditingController repsController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String? mediaUrl;
  bool isGif = false;

  @override
  void initState() {
    super.initState();
    for (var day in weekDays) {
      _expandedDays[day.name] = false;
      _dayCompletionStatus[day.name] = false;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    setsController.dispose();
    repsController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text('FitList', style: AppStyles.title),
          backgroundColor: AppColors.primary,
          elevation: 0,
        ),
        body: Observer(
          builder: (_) {
            final workoutsByDay = widget.workoutStore.workoutsByDay;
            return ListView.builder(
              padding: EdgeInsets.only(top: 8, bottom: 80),
              itemCount: weekDays.length,
              itemBuilder: (context, index) {
                final day = weekDays[index];
                final dayWorkouts = workoutsByDay[day.name] ?? [];
                return _buildDaySection(context, day.name, dayWorkouts);
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddWorkoutDialog(context),
          elevation: 2,
          backgroundColor: AppColors.accent,
          child: Icon(Icons.add, color: AppColors.primary),
        ),
      ),
    );
  }

  Widget _buildDaySection(
      BuildContext context, String day, List<Workout> workouts) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.divider),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(
            initiallyExpanded: _expandedDays[day]!,
            onExpansionChanged: (expanded) {
              setState(() {
                _expandedDays[day] = expanded;
              });
            },
            backgroundColor: AppColors.surface,
            collapsedBackgroundColor: AppColors.surface,
            iconColor: AppColors.accent,
            collapsedIconColor: AppColors.accent,
            leading: SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: _dayCompletionStatus[day],
                onChanged: workouts.isEmpty
                    ? null
                    : (bool? value) {
                        if (value != null) {
                          for (var workout in workouts) {
                            for (var exercise in workout.exercises) {
                              widget.workoutStore
                                  .toggleExercise(workout.id, exercise.id);
                            }
                          }
                        }
                      },
                activeColor: AppColors.accent,
                checkColor: AppColors.primary,
                fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return AppColors.divider;
                    }
                    return states.contains(MaterialState.selected)
                        ? AppColors.accent
                        : AppColors.divider;
                  },
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            title: Text(
              day,
              style: AppStyles.dayTitle.copyWith(
                color: _expandedDays[day]!
                    ? AppColors.accent
                    : AppColors.textSecondary,
              ),
            ),
            children: [
              if (workouts.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'No workouts for $day',
                    style: AppStyles.exerciseSubtitle,
                  ),
                )
              else
                ...workouts
                    .map((workout) => _buildWorkoutCard(context, workout)),
              _buildAddWorkoutButton(context, day),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddWorkoutButton(BuildContext context, String day) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: () => _showAddWorkoutDialog(context, initialDay: day),
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          side: BorderSide(color: AppColors.accent),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: Size(double.infinity, 48),
        ),
        child: Text('Add Workout', style: AppStyles.buttonText),
      ),
    );
  }

  Widget _buildWorkoutCard(BuildContext context, Workout workout) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.divider),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              ),
              child: Row(
                children: [
                  Text(workout.name, style: AppStyles.workoutTitle),
                ],
              ),
            ),
            ...workout.exercises
                .map((exercise) => _buildExerciseItem(workout.id, exercise)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () => _showAddExerciseDialog(context, workout.id),
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFF5F9FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: BorderSide(color: Color(0xFFD0E4F5)),
                  ),
                ),
                child: Text('Add Exercise', style: AppStyles.buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseItem(String workoutId, Exercise exercise) {
    return Observer(
      builder: (_) => Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.divider,
              width: 1,
            ),
          ),
        ),
        child: ListTile(
          leading: SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: exercise.isDone,
              onChanged: (_) =>
                  widget.workoutStore.toggleExercise(workoutId, exercise.id),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              activeColor: AppColors.accent,
              checkColor: AppColors.primary,
              fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return AppColors.divider;
                  }
                  return states.contains(MaterialState.selected)
                      ? AppColors.accent
                      : AppColors.divider;
                },
              ),
            ),
          ),
          title: Text(
            exercise.name,
            style: AppStyles.exerciseTitle.copyWith(
              color: exercise.isDone ? AppColors.textSecondary : AppColors.text,
              decoration: exercise.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(
            '${exercise.sets} sets × ${exercise.reps} reps @ ${exercise.weight}kg',
            style: AppStyles.exerciseSubtitle.copyWith(
              decoration: exercise.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (exercise.mediaUrl != null)
                IconButton(
                  icon: Icon(
                    exercise.isGif ? Icons.gif_box : Icons.image,
                    color: Color(0xFF3BA4E8),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => ExerciseMediaViewer(
                        mediaUrl: exercise.mediaUrl!,
                        isGif: exercise.isGif,
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddWorkoutDialog(BuildContext context, {String? initialDay}) {
    final nameController = TextEditingController();
    final dayController = TextEditingController(text: initialDay);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text('Add Workout', style: AppStyles.workoutTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Workout Name',
                labelStyle: TextStyle(color: AppColors.text),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.divider),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.accent),
                ),
                fillColor: AppColors.primary,
                filled: true,
              ),
              style: TextStyle(color: AppColors.text),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: initialDay,
              decoration: InputDecoration(
                labelText: 'Day of Week',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Color(0xFFD0E4F5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Color(0xFF3BA4E8)),
                ),
              ),
              items: weekDays.map((day) {
                return DropdownMenuItem(
                  value: day.name,
                  child: Text(day.name),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  dayController.text = newValue;
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: AppStyles.exerciseSubtitle),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  dayController.text.isNotEmpty) {
                widget.workoutStore.addWorkout(
                  Workout(
                    id: DateTime.now().toString(),
                    name: nameController.text,
                    exercises: [],
                    dayOfWeek: dayController.text,
                  ),
                );
                setState(() {
                  _expandedDays[dayController.text] = true;
                });
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accent,
              foregroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text('Add', style: AppStyles.buttonText),
          ),
        ],
      ),
    );
  }

  void _showAddExerciseDialog(BuildContext context, String workoutId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Exercise', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.secondary,
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Exercise Name',
                  labelStyle: TextStyle(color: Colors.white70),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 8),
              TextField(
                controller: setsController,
                decoration: InputDecoration(
                  labelText: 'Sets',
                  labelStyle: TextStyle(color: Colors.white70),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 8),
              TextField(
                controller: repsController,
                decoration: InputDecoration(
                  labelText: 'Reps',
                  labelStyle: TextStyle(color: Colors.white70),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 8),
              TextField(
                controller: weightController,
                decoration: InputDecoration(
                  labelText: 'Weight (optional)',
                  labelStyle: TextStyle(color: Colors.white70),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<ExerciseType>(
                value: selectedType,
                decoration: InputDecoration(
                  labelText: 'Exercise Type',
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(),
                ),
                dropdownColor: AppColors.secondary,
                style: TextStyle(color: Colors.white),
                items: ExerciseType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type.toString().split('.').last),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedType = value!;
                  });
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<ExerciseCategory>(
                value: selectedCategory,
                decoration: InputDecoration(
                  labelText: 'Category',
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(),
                ),
                dropdownColor: AppColors.secondary,
                style: TextStyle(color: Colors.white),
                items: ExerciseCategory.values.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category.toString().split('.').last),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () async {
                  final pickedMedia = await MediaHelper.pickMedia(context);
                  if (pickedMedia != null) {
                    setState(() {
                      mediaUrl = pickedMedia;
                      isGif = MediaHelper.isGif(pickedMedia);
                    });
                  }
                },
                icon: Icon(Icons.add_photo_alternate),
                label: Text('Add Image/GIF'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3BA4E8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              if (mediaUrl != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Media selected: ${isGif ? 'GIF' : 'Image'}',
                    style: AppStyles.exerciseSubtitle.copyWith(
                      color: Color(0xFF3BA4E8),
                    ),
                  ),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  setsController.text.isNotEmpty &&
                  repsController.text.isNotEmpty) {
                widget.workoutStore.addExerciseToWorkout(
                  workoutId,
                  Exercise(
                    id: DateTime.now().toString(),
                    name: nameController.text,
                    sets: setsController.text,
                    reps: repsController.text,
                    weight: weightController.text.isEmpty
                        ? null
                        : weightController.text,
                    mediaUrl: mediaUrl,
                    isGif: isGif,
                    type: selectedType,
                    category: selectedCategory,
                  ),
                );
                nameController.clear();
                setsController.clear();
                repsController.clear();
                weightController.clear();
                mediaUrl = null;
                isGif = false;
                Navigator.pop(context);
              }
            },
            child: Text('Add', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
