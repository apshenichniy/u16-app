import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:u16/src/core/theme/custom_theme.dart';

// Define your seed colors.
const Color primarySeedColor = Color(0xFF4083E7);
const Color secondarySeedColor = Color(0xFFFFD15B);
const Color tertiarySeedColor = Color(0xFFA66CFF);

// Make a light ColorScheme from the seeds.
final ColorScheme lightColorScheme = SeedColorScheme.fromSeeds(
  primary: primarySeedColor,
  primaryKey: primarySeedColor,
  secondary: secondarySeedColor,
  secondaryKey: secondarySeedColor,
  tertiaryKey: tertiarySeedColor,
);

// Make a dark ColorScheme from the seeds.
final ColorScheme darkColorScheme = SeedColorScheme.fromSeeds(
  brightness: Brightness.dark,
  primaryKey: primarySeedColor,
  secondaryKey: secondarySeedColor,
  tertiaryKey: tertiarySeedColor,
);

class AppTheme {
  ThemeData _buildTheme(ColorScheme colorScheme) {
    const customTheme = CustomTheme();

    return ThemeData(
      fontFamily: GoogleFonts.redHatDisplay().fontFamily,
      useMaterial3: true,
      colorScheme: colorScheme,
      splashFactory: NoSplash.splashFactory,
      scaffoldBackgroundColor: colorScheme.background,
      extensions: const <ThemeExtension<CustomTheme>>[
        customTheme,
      ],
      appBarTheme: AppBarTheme(
        titleTextStyle:
            customTheme.tHeading3?.copyWith(color: colorScheme.onBackground),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.background,
        elevation: 1,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          textStyle: customTheme.tHeading6Inter,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: customTheme.tHeading6Inter,
          padding: const EdgeInsets.symmetric(horizontal: 40),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: const TextStyle(fontWeight: FontWeight.w500),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 9,
          horizontal: 12,
        ),
        fillColor: colorScheme.surfaceVariant,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: colorScheme.primary,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: colorScheme.error,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        helperStyle: customTheme.tHeading7,
      ),
    );
  }

  /// for getting light theme
  ThemeData get lightTheme {
    return _buildTheme(lightColorScheme);
  }

  /// for getting dark theme
  ThemeData get darkTheme {
    return _buildTheme(darkColorScheme);
  }
}

const ltPadding = 20.0;
