import 'package:flutter/material.dart';

import '../colors/palette.dart';
import '../text_theme/app_text_theme.dart';

TextSelectionThemeData textSelectionTheme(
    Palette colors, AppTextTheme textTheme) {
  return TextSelectionThemeData(
    cursorColor: colors.accent1,
    selectionColor: colors.accent1.withOpacity(0.3),
    selectionHandleColor: colors.accent1,
  );
}
