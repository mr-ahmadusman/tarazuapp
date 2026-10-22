import 'package:flutter/material.dart';

/// Mandatory Color Palette for Tarazu App
class AppColors {
  AppColors._();

  // Core Brand Colors
  static const Color primaryOrange = Color(0xFFEB5B38);
  static const Color charcoal = Color(0xFF272A2D);
  static const Color warmOffWhite = Color(0xFFE6E4DC);
  static const Color secondaryBlue = Color(0xFF347CCB);

  // Dark Theme Palette Variations
  static const Color darkBackground = Color(0xFF1D1F21);
  static const Color darkSurface = Color(0xFF272A2D);
  static const Color darkSurfaceVariant = Color(0xFF32363A);
  static const Color darkBorder = Color(0xFF3D4247);
  static const Color darkTextPrimary = Color(0xFFF3F1EA);
  static const Color darkTextSecondary = Color(0xFFA5A9B0);

  // Light Theme Palette Variations
  static const Color lightBackground = Color(0xFFE6E4DC);
  static const Color lightSurface = Color(0xFFF3F1EA);
  static const Color lightSurfaceVariant = Color(0xFFFFFFFF);
  static const Color lightBorder = Color(0xFFD4D0C5);
  static const Color lightTextPrimary = Color(0xFF272A2D);
  static const Color lightTextSecondary = Color(0xFF62676E);

  // States & Feedback Colors
  static const Color success = Color(0xFF2E7D32);
  static const Color error = Color(0xFFD32F2F);
  static const Color warning = Color(0xFFED6C02);
  static const Color info = Color(0xFF0288D1);

  // Gradients
  static const LinearGradient orangeGlowGradient = LinearGradient(
    colors: [Color(0xFFEB5B38), Color(0xFFFF7A59)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient blueGlowGradient = LinearGradient(
    colors: [Color(0xFF347CCB), Color(0xFF539BF5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const RadialGradient darkBackgroundGlow = RadialGradient(
    center: Alignment(0.0, -0.3),
    radius: 1.2,
    colors: [
      Color(0x33EB5B38), // Soft orange accent tint
      Color(0x1A347CCB), // Soft blue tint
      Color(0xFF1D1F21), // Charcoal dark background
    ],
    stops: [0.0, 0.5, 1.0],
  );
}
