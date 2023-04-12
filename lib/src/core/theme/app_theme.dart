import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:u16/src/core/theme/theme.dart';
import 'package:u16/src/gen/fonts.gen.dart';

part 'app_theme.g.dart';

final _lightColorScheme = ColorScheme.fromSeed(
  seedColor: AppColors.blueNavigation,
  primary: AppColors.blue,
  background: AppColors.white,
  onBackground: AppColors.black,
);

final _borderRadius = BorderRadius.circular(10);

class AppTheme {
  ThemeData _buildTheme(ColorScheme colorScheme) {
    return ThemeData(
      textTheme: const TextTheme(
        bodyLarge: AppTextStyles.h6Regular,
      ),
      fontFamily: FontFamily.redHatDisplay,
      useMaterial3: true,
      colorScheme: colorScheme,
      splashFactory: NoSplash.splashFactory,
      scaffoldBackgroundColor: colorScheme.background,
      appBarTheme: AppBarTheme(
        foregroundColor: colorScheme.onBackground,
        surfaceTintColor: colorScheme.background,
        backgroundColor: colorScheme.background,
        elevation: 0,
      ),
      tabBarTheme: const TabBarTheme(
        indicatorColor: AppColors.blueNavigation,
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.background,
        elevation: 0,
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          final color = states.contains(MaterialState.selected)
              ? AppColors.blueNavigation
              : AppColors.gray;

          return TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: color,
            fontFamily: FontFamily.redHatDisplay,
          );
        }),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(44),
          shape: RoundedRectangleBorder(
            borderRadius: _borderRadius,
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: FontFamily.inter,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: _borderRadius,
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontFamily: FontFamily.inter,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: const TextStyle(fontWeight: FontWeight.w500),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 9,
          horizontal: 12,
        ),
        fillColor: AppColors.superLightGray,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: colorScheme.primary,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: _borderRadius,
          borderSide: BorderSide(
            color: colorScheme.error,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: _borderRadius,
          borderSide: BorderSide.none,
        ),
        hintStyle: AppTextStyles.h6Regular.copyWith(color: AppColors.darkGray),
      ),
    );
  }

  /// for getting light theme
  ThemeData get lightTheme {
    return _buildTheme(_lightColorScheme);
  }
}

const ltPadding = 20.0;

@riverpod
AppTheme appTheme(AppThemeRef ref) => AppTheme();
