import 'package:flutter/material.dart';

import 'color_shades.dart';

part 'dark_theme.dart';
part 'light_theme.dart';

class ColorManager {
  // Primary Color Shades
  static const ColorShades _primary = ColorShades(
    shades: {
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF2194F2), // default shade
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );

  // Secondary Color Shades
  static const ColorShades _secondary = ColorShades(
    shades: {
      50: Color(0xFFE9EFF3),
      100: Color(0xFFC7D5E1),
      200: Color(0xFFA2B9CD),
      300: Color(0xFF7D9EB8),
      400: Color(0xFF6289A7),
      500: Color(0xFF4A789C), // default shade
      600: Color(0xFF436E8F),
      700: Color(0xFF3A6381),
      800: Color(0xFF325873),
      900: Color(0xFF23445A),
    },
  );

  // Grey Color Shades
  static const ColorShades _grey = ColorShades(
    shades: {
      50: Color(0xFFFAFBFD),
      100: Color(0xFFF5F7FA),
      200: Color(0xFFEEF2F7),
      400: Color(0xFFD0D6E0),
      500: Color(0xFFE8EDF5), // default shade
      600: Color(0xFFA0A9B8),
      700: Color(0xFF8892A4),
      800: Color(0xFF707B90),
      900: Color(0xFF58637B),
    },
  );

  // White Color Shades (using Flutter's opacity variants)
  static const ColorShades _white = ColorShades(
    shades: {
      50: Colors.white10,
      100: Colors.white12,
      200: Colors.white30,
      300: Colors.white38,
      400: Colors.white54,
      500: Colors.white,
      600: Colors.white60,
      700: Colors.white70,
    },
  );

  // Black Color Shades (using Flutter's opacity variants)
  static const ColorShades _black = ColorShades(
    shades: {
      50: Colors.black12,
      100: Colors.black26,
      200: Colors.black38,
      300: Colors.black45,
      400: Colors.black54,
      500: Colors.black,
      600: Colors.black87,
    },
  );

  // Error Color Shades (Red)
  static const ColorShades _error = ColorShades(
    shades: {
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFF44336),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );

  // Success Color Shades (Green)
  static const ColorShades _success = ColorShades(
    shades: {
      50: Color(0xFFE8F5E9),
      100: Color(0xFFC8E6C9),
      200: Color(0xFFA5D6A7),
      300: Color(0xFF81C784),
      400: Color(0xFF66BB6A),
      500: Color(0xFF4CAF50),
      600: Color(0xFF43A047),
      700: Color(0xFF388E3C),
      800: Color(0xFF2E7D32),
      900: Color(0xFF1B5E20),
    },
  );

  // Warning Color Shades (Amber)
  static const ColorShades _warning = ColorShades(
    shades: {
      50: Color(0xFFFFF8E1),
      100: Color(0xFFFFECB3),
      200: Color(0xFFFFE082),
      300: Color(0xFFFFD54F),
      400: Color(0xFFFFCA28),
      500: Color(0xFFFFC107),
      600: Color(0xFFFFB300),
      700: Color(0xFFFFA000),
      800: Color(0xFFFF8F00),
      900: Color(0xFFFF6F00),
    },
  );
}
