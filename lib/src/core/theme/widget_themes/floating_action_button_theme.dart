import 'package:flutter/material.dart';
import '../theme_extensions/color_theme_extension.dart';
import '../theme_extensions/text_theme_extension.dart';

FloatingActionButtonThemeData floatingActionButtonTheme(
    ColorThemeExtension colors, TextThemeExtension textTheme) {
  return FloatingActionButtonThemeData(
    extendedTextStyle: textTheme.labelLarge,
    elevation: 2,
  );
}
