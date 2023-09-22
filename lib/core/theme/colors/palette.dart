import 'package:flutter/material.dart';

import 'button_color_scheme.dart';
import 'input_color_scheme.dart';

class Palette extends ThemeExtension<Palette> {
  final Brightness brightness;

  // General Colors
  final Color primary;
  final Color primaryDarker;
  final Color primaryLighter;

  // Accent Colors
  final Color accent1;
  final Color accent2;
  final Color accent3;

  // Text Colors
  final Color headingText;
  final Color primaryText;
  final Color secondaryText;
  final Color tertiaryText;

  // Background+on Colors
  final Color background;
  final Color surface;
  final Color receiptBackground;

  // Outline Colors
  final Color outline;
  final Color outlineVariant;

  // Other Colors
  final Color success;
  final Color error;
  final Color info;

  const Palette({
    required this.brightness,
    required this.primary,
    required this.primaryDarker,
    required this.primaryLighter,
    required this.accent1,
    required this.accent2,
    required this.accent3,
    required this.headingText,
    required this.primaryText,
    required this.secondaryText,
    required this.tertiaryText,
    required this.background,
    required this.surface,
    required this.receiptBackground,
    required this.outline,
    required this.outlineVariant,
    required this.success,
    required this.error,
    required this.info,
  });

  bool get isDark => brightness == Brightness.dark;

  static Color white = const Color(0xFFFFFFFF);
  static Color black = const Color(0xFF000000);

  InputColorScheme get inputColorScheme => InputColorScheme(
        enabledOutline: (isDark ? white : black).withOpacity(0.1),
        disabledOutline: (isDark ? white : black).withOpacity(0.1),
        focusedOutline: primary.withOpacity(0.7),
        errorOutline: error,
        fill: primary.withOpacity(0.1),
      );
  ButtonColorScheme get buttonColorScheme => ButtonColorScheme(
        background: primary,
        foreground: white,
      );
  
  @override
  Palette lerp(covariant Palette? other, double t) {
    if (other is! Palette) {
      return this;
    }

    Color l(Color a, Color b) => Color.lerp(a, b, t) ?? a;

    return Palette(
      brightness: other.brightness,
      primary: l(primary, other.primary),
      primaryDarker: l(primaryDarker, other.primaryDarker),
      primaryLighter: l(primaryLighter, other.primaryLighter),
      accent1: l(accent1, other.accent1),
      accent2: l(accent2, other.accent2),
      accent3: l(accent3, other.accent3),
      headingText: l(headingText, other.headingText),
      primaryText: l(primaryText, other.primaryText),
      secondaryText: l(secondaryText, other.secondaryText),
      tertiaryText: l(tertiaryText, other.tertiaryText),
      background: l(background, other.background),
      surface: l(surface, other.surface),
      receiptBackground: l(receiptBackground, other.receiptBackground),
      outline: l(outline, other.outline),
      outlineVariant: l(outlineVariant, other.outlineVariant),
      success: l(success, other.success),
      error: l(error, other.error),
      info: l(info, other.info),
    );
  }

  @override
  Palette copyWith({
    Brightness? brightness,
    Color? primary,
    Color? primaryDarker,
    Color? primaryLighter,
    Color? accent1,
    Color? accent2,
    Color? accent3,
    Color? headingText,
    Color? primaryText,
    Color? secondaryText,
    Color? tertiaryText,
    Color? background,
    Color? surface,
    Color? receiptBackground,
    Color? outline,
    Color? outlineVariant,
    Color? success,
    Color? error,
    Color? info,
  }) {
    return Palette(
      brightness: brightness ?? this.brightness,
      primary: primary ?? this.primary,
      primaryDarker: primaryDarker ?? this.primaryDarker,
      primaryLighter: primaryLighter ?? this.primaryLighter,
      accent1: accent1 ?? this.accent1,
      accent2: accent2 ?? this.accent2,
      accent3: accent3 ?? this.accent3,
      headingText: headingText ?? this.headingText,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      tertiaryText: tertiaryText ?? this.tertiaryText,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      receiptBackground: receiptBackground ?? this.receiptBackground,
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      success: success ?? this.success,
      error: error ?? this.error,
      info: info ?? this.info,
    );
  }
}
