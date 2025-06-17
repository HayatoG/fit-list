import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../theme/app_styles.dart';
import '../services/preset_workouts_service.dart';
import '../services/preferences_service.dart';
import 'home_screen.dart';
import '../stores/workout_store.dart';
import '../stores/ui_store.dart';

class WelcomeScreen extends StatelessWidget {
  final WorkoutStore workoutStore;
  final UIStore uiStore;

  const WelcomeScreen({
    Key? key,
    required this.workoutStore,
    required this.uiStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo ao FitList',
                style: AppStyles.title,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Como você quer começar?',
                style:
                    AppStyles.subtitle.copyWith(color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              _buildOptionButton(
                title: 'Começar do Zero',
                subtitle: 'Crie seu próprio treino personalizado',
                icon: Icons.add_circle_outline,
                onTap: () => _startFromScratch(context),
              ),
              const SizedBox(height: 16),
              _buildOptionButton(
                title: 'Usar Treino Pronto',
                subtitle: 'Comece com um treino pré-definido',
                icon: Icons.fitness_center,
                onTap: () => _loadPresetWorkouts(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      width: double.infinity,
      child: Card(
        color: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.divider),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: AppColors.accent, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppStyles.buttonText),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: AppStyles.exerciseSubtitle,
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios,
                    color: AppColors.accent, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _loadPresetWorkouts(BuildContext context) async {
    try {
      final presetWorkouts = await PresetWorkoutsService().loadPresetWorkouts();
      await workoutStore.setWorkouts(presetWorkouts);
      await PreferencesService().savePresetWorkoutChoice(true);
      _navigateToHome(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao carregar treinos pré-definidos'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _startFromScratch(BuildContext context) async {
    await PreferencesService().savePresetWorkoutChoice(false);
    _navigateToHome(context);
  }

  void _navigateToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          workoutStore: workoutStore,
          uiStore: uiStore,
        ),
      ),
    );
  }
}
