import 'package:flutter/material.dart';

import '../theme_extensions/color_theme_extension.dart';
import '../theme_extensions/text_theme_extension.dart';

ChipThemeData chipTheme(
    ColorThemeExtension colors, TextThemeExtension textTheme) {
  return ChipThemeData(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
    backgroundColor: Colors.transparent,
    surfaceTintColor: colors.accent2,
    labelStyle: textTheme.labelSmall,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(200),
      side: BorderSide(
        width: 1,
        color: colors.outlineVariant,
        strokeAlign: BorderSide.strokeAlignInside,
      ),
    ),
  );
}
