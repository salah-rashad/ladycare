import 'package:flutter/material.dart';

import '../theme_extensions/color_theme_extension.dart';
import '../theme_extensions/text_theme_extension.dart';

ElevatedButtonThemeData elevatedButtonTheme(
    ColorThemeExtension colors, TextThemeExtension textTheme) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      alignment: Alignment.center,
      backgroundColor: colors.buttonColorScheme.background,
      foregroundColor: colors.buttonColorScheme.foreground,
      minimumSize: const Size(0, 48.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      textStyle: textTheme.headlineSmall,
    ),
  );
}

FilledButtonThemeData filledButtonTheme(
    ColorThemeExtension colors, TextThemeExtension textTheme) {
  return FilledButtonThemeData(
    style: FilledButton.styleFrom(
      alignment: Alignment.center,
      backgroundColor: colors.buttonColorScheme.background,
      foregroundColor: colors.buttonColorScheme.foreground,
      minimumSize: const Size(0, 48.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      textStyle: textTheme.headlineSmall,
    ),
  );
}

TextButtonThemeData textButtonTheme(
    ColorThemeExtension colors, TextThemeExtension textTheme) {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      alignment: Alignment.center,
      foregroundColor: colors.buttonColorScheme.background,
      minimumSize: const Size(0, 48.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      textStyle: textTheme.headlineSmall,
    ),
  );
}
