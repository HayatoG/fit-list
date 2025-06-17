import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/welcome_screen.dart';
import 'stores/workout_store.dart';
import 'theme/app_styles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Força o app a ficar em modo retrato
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final workoutStore = WorkoutStore();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitList',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.accent,
        colorScheme: ColorScheme.dark(
          primary: AppColors.accent,
          secondary: AppColors.accent,
          surface: AppColors.surface,
          background: AppColors.background,
          onPrimary: AppColors.primary,
          onSecondary: AppColors.primary,
          onSurface: AppColors.text,
          onBackground: AppColors.text,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          elevation: 0,
        ),
        cardColor: AppColors.surface,
        cardTheme: ThemeData.dark().cardTheme.copyWith(
              elevation: 0,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: AppColors.divider),
              ),
            ),
      ),
      home: WelcomeScreen(workoutStore: workoutStore),
    );
  }
}
