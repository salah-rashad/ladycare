import 'package:flutter/material.dart';

import '../colors/palette.dart';
import '../text_theme/app_text_theme.dart';

ElevatedButtonThemeData elevatedButtonTheme(
      Palette colors, AppTextTheme textTheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: colors.buttonColorScheme.background,
        foregroundColor: colors.buttonColorScheme.foreground,
        minimumSize: const Size.fromHeight(48.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: textTheme.headlineSmall,
      ),
    );
  }

  FilledButtonThemeData filledButtonTheme(
      Palette colors, AppTextTheme textTheme) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: colors.buttonColorScheme.background,
        foregroundColor: colors.buttonColorScheme.foreground,
        minimumSize: const Size.fromHeight(48.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: textTheme.headlineSmall,
      ),
    );
  }

  TextButtonThemeData textButtonTheme(Palette colors, AppTextTheme textTheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        alignment: Alignment.center,
        foregroundColor: colors.buttonColorScheme.background,
        minimumSize: const Size.fromHeight(48.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: textTheme.headlineSmall,
      ),
    );
  }
