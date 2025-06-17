import 'package:flutter/material.dart';
import '../stores/workout_store.dart';
import '../stores/ui_store.dart';

class StoreProvider extends InheritedWidget {
  final WorkoutStore workoutStore;
  final UIStore uiStore;

  const StoreProvider({
    Key? key,
    required this.workoutStore,
    required this.uiStore,
    required Widget child,
  }) : super(key: key, child: child);

  static StoreProvider of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<StoreProvider>();
    assert(provider != null, 'No StoreProvider found in context');
    return provider!;
  }

  @override
  bool updateShouldNotify(StoreProvider oldWidget) {
    return workoutStore != oldWidget.workoutStore ||
        uiStore != oldWidget.uiStore;
  }
}
