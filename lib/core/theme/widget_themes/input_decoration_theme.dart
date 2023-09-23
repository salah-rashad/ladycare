import 'package:flutter/material.dart';

import '../theme_extensions/color_theme_extension.dart';
import '../theme_extensions/text_theme_extension.dart';

InputDecorationTheme inputDecorationTheme(
    ColorThemeExtension colors, TextThemeExtension textTheme) {
  return InputDecorationTheme(
    filled: true,
    fillColor: colors.inputColorScheme.fill,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
    labelStyle: textTheme.titleSmall?.apply(color: colors.tertiaryText),
    prefixIconColor: colors.tertiaryText,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: colors.inputColorScheme.enabledOutline,
        width: 2,
        strokeAlign: BorderSide.strokeAlignInside,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: colors.inputColorScheme.focusedOutline,
        width: 2,
        strokeAlign: BorderSide.strokeAlignInside,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: colors.inputColorScheme.errorOutline,
        width: 2,
        strokeAlign: BorderSide.strokeAlignInside,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: colors.inputColorScheme.disabledOutline,
        width: 2,
        strokeAlign: BorderSide.strokeAlignInside,
      ),
    ),
  );
}
