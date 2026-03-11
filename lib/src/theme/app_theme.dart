import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
//   scaffoldBackgroundColor: Colors.grey[50],
//   appBarTheme: const AppBarTheme(
//     color: Colors.white,
//     iconTheme: IconThemeData(color: Colors.teal),
//     titleTextStyle: TextStyle(
//       color: Colors.teal,
//       fontWeight: FontWeight.bold,
//       fontSize: 20,
//     ),
//     elevation: 1,
//   ),

class AppTheme {
  final TextTheme textTheme;

  const AppTheme(this.textTheme);

  ThemeData get lightTheme => ThemeData(
    colorScheme: AppColors.lightColorScheme,
    brightness: Brightness.light,
    progressIndicatorTheme: const ProgressIndicatorThemeData(year2023: false),
    textTheme: textTheme.apply(
      bodyColor: AppColors.lightColorScheme.onSurface,
      displayColor: AppColors.lightColorScheme.onSurface,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.lightColorScheme.surface,
      ),
    ),

    popupMenuTheme: PopupMenuThemeData(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      menuPadding: const EdgeInsets.all(0),
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
