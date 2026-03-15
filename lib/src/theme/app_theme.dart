import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'text_theme.dart';

class AppTheme {
  static const radius = 12.0;

  static final ThemeData light = ThemeData(
    colorScheme: AppColors.lightColorScheme,
    brightness: .light,
    progressIndicatorTheme: const ProgressIndicatorThemeData(year2023: false),
    textTheme: textTheme,
    fontFamily: 'Cairo',
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: .dark,
        systemNavigationBarIconBrightness: .dark,
        systemNavigationBarColor: AppColors.lightColorScheme.surface,
      ),
    ),

    popupMenuTheme: PopupMenuThemeData(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: .circular(20)),
      menuPadding: const .all(0),
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: .circular(radius)),
      margin: const .symmetric(horizontal: 12, vertical: 8),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: .circular(radius)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: .circular(radius)),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: .circular(radius)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: .circular(radius)),
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: .circular(radius)),
      ),
      menuStyle: MenuStyle(
        shape: .all(RoundedRectangleBorder(borderRadius: .circular(radius))),
      ),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: SegmentedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: .circular(radius)),
      ),
    ),
  );
}
