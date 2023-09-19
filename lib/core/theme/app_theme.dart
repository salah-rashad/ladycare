import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../gen/fonts.gen.dart';
import 'colors/palette.dart';
import 'text_theme/app_text_theme.dart';

class AppTheme extends Cubit<ThemeMode> {
  AppTheme() : super(ThemeMode.system);

  ThemeMode get themeMode => state;

  set themeMode(ThemeMode themeMode) {
    emit(themeMode);
  }

  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //

  static const lightTextTheme = AppTextTheme(colors: lightThemeColors);
  static const darkTextTheme = AppTextTheme(colors: darkThemeColors);

  static const lightThemeColors = Palette(
    brightness: Brightness.light,
    primary: Color(0xFFF0748D),
    primaryDarker: Color(0xFFCF5463),
    primaryLighter: Color(0xFFF59EB0),
    accent1: Color(0xFF344251),
    accent2: Color(0xFF476F82),
    accent3: Color(0xFF48C6A9),
    headingText: Color(0xFF3F3D56),
    primaryText: Color(0xFF202327),
    secondaryText: Color(0xFF535960),
    tertiaryText: Color(0xFF9097A0),
    background: Color(0xFFF9FAFB),
    surface: Color(0xFFF1F4F8),
    receiptBackground: Color(0xFFF3F6F5),
    outline: Color(0xFFEDC7CE),
    outlineVariant: Color(0xFFE6E6E6),
    success: Color(0xFF2FD55D),
    error: Color(0xFFCD4949),
    info: Color(0xFF697F9E),
  );

  static const darkThemeColors = Palette(
    brightness: Brightness.dark,
    primary: Color(0xFFD44165),
    primaryDarker: Color(0xFFB81F3C),
    primaryLighter: Color(0xFFE46B83),
    accent1: Color(0xFF233A49),
    accent2: Color(0xFF345D75),
    accent3: Color(0xFF36A991),
    headingText: Color(0xFFC9C7D9),
    primaryText: Color(0xFFFFFFFF),
    secondaryText: Color(0xFFB0B8C1),
    tertiaryText: Color(0xFF6F7580),
    background: Color(0xFF0E1215),
    surface: Color(0xFF1A1F26),
    receiptBackground: Color(0xFF10171B),
    outline: Color(0xFF3A2428),
    outlineVariant: Color(0xFF333333),
    success: Color(0xFF2FD55D),
    error: Color(0xFFCD4949),
    info: Color(0xFF697F9E),
  );

  ThemeData _themeDataFrom({
    required Brightness brightness,
    required Palette colors,
    required AppTextTheme textTheme,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      extensions: [colors, textTheme],
      fontFamily: FontFamily.cairo,
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: colors.primary,
      ),
      scaffoldBackgroundColor: colors.background,
      appBarTheme: _appBarTheme(colors, textTheme),
      inputDecorationTheme: _inputDecorationTheme(colors, textTheme),
      elevatedButtonTheme: _elevatedButtonTheme(colors, textTheme),
      textButtonTheme: _textButtonTheme(colors, textTheme),
      textSelectionTheme: _textSelectionTheme(colors, textTheme),
    );
  }

  // ~ App Themes ~ //

  ThemeData get light => _themeDataFrom(
        brightness: Brightness.light,
        colors: lightThemeColors,
        textTheme: lightTextTheme,
      );

  ThemeData get dark => _themeDataFrom(
        brightness: Brightness.dark,
        colors: darkThemeColors,
        textTheme: darkTextTheme,
      );

  // ~ Widget Themes ~ //

  AppBarTheme _appBarTheme(Palette colors, AppTextTheme textTheme) {
    return AppBarTheme(
      foregroundColor: colors.headingText,
      titleTextStyle:
          textTheme.headlineMedium?.apply(color: colors.headingText),
      backgroundColor: colors.surface,
      centerTitle: true,
    );
  }

  InputDecorationTheme _inputDecorationTheme(
      Palette colors, AppTextTheme textTheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colors.inputColorScheme.fill,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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

  ElevatedButtonThemeData _elevatedButtonTheme(
      Palette colors, AppTextTheme textTheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: colors.buttonColorScheme.background,
        foregroundColor: colors.buttonColorScheme.foreground,
        minimumSize: const Size.fromHeight(48.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: textTheme.headlineSmall,
      ),
    );
  }

  TextButtonThemeData _textButtonTheme(Palette colors, AppTextTheme textTheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        alignment: Alignment.center,
        foregroundColor: colors.buttonColorScheme.background,
        minimumSize: const Size.fromHeight(48.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: textTheme.headlineSmall,
      ),
    );
  }

  TextSelectionThemeData _textSelectionTheme(
      Palette colors, AppTextTheme textTheme) {
    return TextSelectionThemeData(
      cursorColor: colors.accent1,
      selectionColor: colors.accent1.withOpacity(0.3),
      selectionHandleColor: colors.accent1,
    );
  }
}
