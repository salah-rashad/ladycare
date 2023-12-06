import 'package:flutter/material.dart';

import 'box_shadow_theme_extension.dart';
import 'color_theme_extension.dart';
import 'images_theme_extension.dart';
import 'text_theme_extension.dart';

abstract class AppThemeExtensions {
  ColorThemeExtension get colors;
  TextThemeExtension get textTheme => TextThemeExtension(colors: colors);
  BoxShadowThemeExtension get boxShadowTheme =>
      BoxShadowThemeExtension(colors: colors);
  ImagesThemeExtension get images;
  List<ThemeExtension> get values =>
      [colors, textTheme, boxShadowTheme, images];
}
