import 'package:flutter/material.dart';

import '../theme_extensions/color_theme_extension.dart';
import '../theme_extensions/text_theme_extension.dart';

BottomSheetThemeData bottomSheetTheme(
    ColorThemeExtension colors, TextThemeExtension textTheme) {
  return BottomSheetThemeData(
    backgroundColor: colors.surface,
    surfaceTintColor: colors.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: BorderSide.none,
    ),
    showDragHandle: true,
  );
}


