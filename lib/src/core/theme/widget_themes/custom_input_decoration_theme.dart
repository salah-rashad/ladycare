import 'package:flutter/material.dart';

import '../schemes/input_color_scheme.dart';
import '../theme_extensions/color_theme_extension.dart';
import '../theme_extensions/text_theme_extension.dart';

class CustomInputDecorationTheme extends InputDecorationTheme {
  final Color? tint;
  final ColorThemeExtension colors;
  final TextThemeExtension textTheme;

  const CustomInputDecorationTheme({
    this.tint,
    required this.colors,
    required this.textTheme,
  });

  InputColorScheme get inputColorScheme =>
      colors.inputColorScheme(tintColor: tint);

  @override
  bool get filled => true;
  @override
  Color? get fillColor => inputColorScheme.fill;

  @override
  EdgeInsetsGeometry? get contentPadding =>
      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
  @override
  InputBorder? get border =>
      OutlineInputBorder(borderRadius: BorderRadius.circular(12.0));
  @override
  TextStyle? get labelStyle =>
      textTheme.titleSmall.apply(color: colors.tertiaryText);
  @override
  TextStyle? get hintStyle =>
      textTheme.titleSmall.apply(color: colors.tertiaryText);
  @override
  Color? get prefixIconColor => colors.tertiaryText;

  @override
  InputBorder? get enabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: inputColorScheme.enabledOutline,
          width: 2,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      );

  @override
  InputBorder? get focusedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: inputColorScheme.focusedOutline,
          width: 2,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      );

  @override
  InputBorder? get errorBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: inputColorScheme.errorOutline,
          width: 2,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      );

  @override
  InputBorder? get disabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: inputColorScheme.disabledOutline,
          width: 2,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      );
}
