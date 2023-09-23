import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../gen/fonts.gen.dart';
import '../utils/extensions.dart';
import 'theme_extensions/app_theme_extensions.dart';
import 'theme_extensions/color_theme_extension.dart';
import 'dark_app_theme.dart';
import 'light_app_theme.dart';
import 'theme_extensions/text_theme_extension.dart';
import 'widget_themes/button_themes.dart';
import 'widget_themes/input_decoration_theme.dart';
import 'widget_themes/text_selection_theme.dart';

class AppTheme extends Cubit<ThemeMode> {
  AppTheme() : super(ThemeMode.system);

  ThemeMode get themeMode => state;

  set themeMode(ThemeMode themeMode) {
    emit(themeMode);
  }

  void toggle(BuildContext context) {
    switch (themeMode) {
      case ThemeMode.system:
        context.theme.brightness == Brightness.light
            ? emit(ThemeMode.dark)
            : emit(ThemeMode.light);
        break;
      case ThemeMode.light:
        emit(ThemeMode.dark);
        break;
      case ThemeMode.dark:
        emit(ThemeMode.light);
        break;
    }
  }

  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //

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
      appBarTheme: _appBarTheme(palette, textTheme),
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

  AppBarTheme _appBarTheme(
      ColorThemeExtension colors, TextThemeExtension textTheme) {
    return AppBarTheme(
      foregroundColor: colors.headingText,
      titleTextStyle:
          textTheme.headlineMedium?.apply(color: colors.headingText),
      backgroundColor: colors.surface,
      centerTitle: true,
    );
  }
}
