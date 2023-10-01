import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';
import 'dark_app_theme.dart';
import 'light_app_theme.dart';
import 'theme_extensions/app_theme_extensions.dart';
import 'widget_themes/widget_themes.dart';

class AppTheme {
  ThemeData _themeDataFrom({
    required Brightness brightness,
    required AppThemeExtensions themeExtensions,
  }) {
    final palette = themeExtensions.colors;
    final textTheme = themeExtensions.textTheme;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      extensions: themeExtensions.values,
      fontFamily: FontFamily.cairo,
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: palette.primary,
      ),
      scaffoldBackgroundColor: palette.background,
      // appBarTheme: _appBarTheme(palette, textTheme),
      inputDecorationTheme: inputDecorationTheme(palette, textTheme),
      elevatedButtonTheme: elevatedButtonTheme(palette, textTheme),
      filledButtonTheme: filledButtonTheme(palette, textTheme),
      textButtonTheme: textButtonTheme(palette, textTheme),
      textSelectionTheme: textSelectionTheme(palette, textTheme),
    );
  }

  // ~ App Themes ~ //

  ThemeData get light => _themeDataFrom(
        brightness: Brightness.light,
        themeExtensions: LightAppThemeExtensions(),
      );

  ThemeData get dark => _themeDataFrom(
        brightness: Brightness.dark,
        themeExtensions: DarkAppThemeExtensions(),
      );

  // ~ Widget Themes ~ //

  /* AppBarTheme _appBarTheme(AppThemeExtensions extensions) {
    return AppBarTheme(
      foregroundColor: extensions.colors.headingText,
      titleTextStyle: extensions.textTheme.headlineMedium
          ?.apply(color: extensions.colors.headingText),
      backgroundColor: extensions.colors.surface,
      centerTitle: true,
    );
  } */
}
