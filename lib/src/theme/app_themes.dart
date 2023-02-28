import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'font_family.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = _themeData(_lightColorScheme);

  static ThemeData _themeData(ColorScheme colorScheme) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: colorScheme.primary,
        ),
      ),
      canvasColor: colorScheme.background,
      colorScheme: colorScheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.customWhiteBone;
              }
              return AppColors.customGreen;
            },
          ),
          padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
            (states) => const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
          ),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                  side: BorderSide(
                    color: AppColors.customLightGray,
                    width: 2.0,
                  ),
                );
              }
              return const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              );
            },
          ),
        ),
      ),
      focusColor: AppColors.customBlack.withOpacity(0.12),
      fontFamily: AppFontFamily.gothic,
      highlightColor: Colors.transparent,
      hintColor: AppColors.customLightGray,
      iconTheme: const IconThemeData(color: AppColors.customWhite),
      primaryColor: AppColors.customLightBlack,
      primaryColorLight: AppColors.customDarkGray,
      scaffoldBackgroundColor: colorScheme.background,
      shadowColor: Colors.grey.shade100,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          AppColors.customBlack.withOpacity(0.80),
          AppColors.customWhite,
        ),
      ),
      textButtonTheme: const TextButtonThemeData(),
      textTheme: const TextTheme(),
    );
  }

  static const ColorScheme _lightColorScheme = ColorScheme.light(
    background: AppColors.customWhiteBone,
    brightness: Brightness.light,
    error: AppColors.customBlack,
    onBackground: Colors.white,
    onError: AppColors.customBlack,
    onPrimary: AppColors.customBlack,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    primary: AppColors.customDarkBeige,
    primaryContainer: Color(0xFF253A2C),
    secondary: Color(0xFFEFF3F3),
    secondaryContainer: Color(0xFF607162),
    surface: Color(0xFFFAFBFB),
  );

  static final ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(),
    colorScheme: const ColorScheme.dark(),
    elevatedButtonTheme: const ElevatedButtonThemeData(),
    fontFamily: AppFontFamily.gothic,
    iconTheme: const IconThemeData(),
    scaffoldBackgroundColor: AppColors.customGreen,
    snackBarTheme: const SnackBarThemeData(),
    textButtonTheme: const TextButtonThemeData(),
    textTheme: const TextTheme(),
  );
}
