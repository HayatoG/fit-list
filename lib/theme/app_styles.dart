import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF1A1A1A);
  static const secondary = Color(0xFF2D2D2D);
  static const accent = Color(0xFFE0E0E0);
  static const background = Color(0xFF121212);
  static const surface = Color(0xFF1E1E1E);
  static const text = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFB3B3B3);
  static const divider = Color(0xFF2A2A2A);
}

class AppStyles {
  static TextStyle get title => GoogleFonts.notoSans(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.text,
      );

  static TextStyle get dayTitle => GoogleFonts.notoSans(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.text,
      );

  static TextStyle get workoutTitle => GoogleFonts.notoSans(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.accent,
      );

  static TextStyle get buttonText => GoogleFonts.notoSans(
        color: AppColors.accent,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get exerciseTitle => GoogleFonts.notoSans(
        color: AppColors.text,
      );
  static TextStyle get subtitle => GoogleFonts.notoSans(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.text,
      );

  static TextStyle get exerciseSubtitle => GoogleFonts.notoSans(
        color: AppColors.textSecondary,
      );
}
