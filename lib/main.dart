import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'stores/workout_store.dart';
import 'stores/ui_store.dart';
import 'theme/app_styles.dart';
import 'services/preferences_service.dart';
import 'services/preset_workouts_service.dart';
import 'providers/store_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Força o app a ficar em modo retrato
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final workoutStore = WorkoutStore();
  final uiStore = UIStore();

  runApp(
    StoreProvider(
      workoutStore: workoutStore,
      uiStore: uiStore,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  Future<bool> _checkPresetWorkouts(BuildContext context) async {
    final stores = StoreProvider.of(context);
    final hasPresetWorkouts =
        await PreferencesService().hasPresetWorkoutBeenChosen();
    if (hasPresetWorkouts) {
      try {
        final presets = await PresetWorkoutsService().loadPresetWorkouts();
        await stores.workoutStore.setWorkouts(presets);
        return true;
      } catch (e) {
        print('Error loading preset workouts: $e');
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitList',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: AppColors.text),
        ),
      ),
      home: FutureBuilder<bool>(
        future: _checkPresetWorkouts(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final stores = StoreProvider.of(context);
          return stores.workoutStore.hasWorkouts
              ? HomeScreen(
                  workoutStore: stores.workoutStore,
                  uiStore: stores.uiStore,
                )
              : WelcomeScreen(
                  workoutStore: stores.workoutStore,
                  uiStore: stores.uiStore,
                );
        },
      ),
    );
  }
}
