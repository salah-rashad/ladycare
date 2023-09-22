import 'package:flutter/material.dart';

import 'colors/palette.dart';
import 'shadow_themes/box_shadow_theme.dart';
import 'text_theme/app_text_theme.dart';

abstract class AppThemeExtensions {
  Palette get palette;

  AppTextTheme get textTheme => AppTextTheme(colors: palette);
  BoxShadowTheme get boxShadowTheme => BoxShadowTheme(colors: palette);

  List<ThemeExtension> get values => [palette, textTheme, boxShadowTheme];
}
