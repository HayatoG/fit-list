import 'package:flutter/material.dart';

class LiquidGlassStyles {
  static const double defaultBlur = 10.0;
  static const double defaultReflection = 0.15;
  static const double defaultAberration = 0.1;
  static const double defaultRefraction = 1.5;
  static const double defaultLuminance = 0.8;
  static const double defaultBorderWidth = 1.5;
  static const double defaultBorderRadius = 16.0;

  static const double appBarBlur = 15.0;
  static const double appBarReflection = 0.2;
  static const double appBarAberration = 0.15;
  static const double appBarRefraction = 1.7;
  static const double appBarLuminance = 0.9;

  static LinearGradient get defaultGradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.4),
          Colors.white.withOpacity(0.2),
        ],
      );

  static LinearGradient get defaultBorderGradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.5),
          Colors.white.withOpacity(0.2),
        ],
      );

  static LinearGradient get appBarGradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF3BA4E8).withOpacity(0.6),
          Color(0xFF2C86C5).withOpacity(0.4),
        ],
      );

  static LinearGradient get actionButtonGradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF3BA4E8).withOpacity(0.6),
          Color(0xFF2C86C5).withOpacity(0.4),
        ],
      );
}
