import 'package:flutter/material.dart';
import '../theme_extensions/color_theme_extension.dart';
import '../theme_extensions/text_theme_extension.dart';

TextSelectionThemeData textSelectionTheme(
    ColorThemeExtension colors, TextThemeExtension textTheme) {
  return TextSelectionThemeData(
    cursorColor: colors.accent1,
    selectionColor: colors.accent1.withOpacity(0.3),
    selectionHandleColor: colors.accent1,
  );
}
