import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/fonts.gen.dart';
import 'color_theme_extension.dart';

class TextThemeExtension extends ThemeExtension<TextThemeExtension> {
  final ColorThemeExtension? colors;
  const TextThemeExtension({this.colors});

  /// fontSize: 57 | fontWeight: w400 | fontFamily: Cairo
  TextStyle get displayLarge => TextStyle(
        color: colors?.headingText,
        fontSize: 57.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w400,
        height: 1.61,
      );

  /// fontSize: 45 | fontWeight: w400 | fontFamily: Cairo
  TextStyle get displayMedium => TextStyle(
        color: colors?.headingText,
        fontSize: 45.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w400,
        height: 1.69,
      );

  /// fontSize: 36 | fontWeight: w400 | fontFamily: Cairo
  TextStyle get displaySmall => TextStyle(
        color: colors?.headingText,
        fontSize: 36.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w400,
        height: 1.67,
      );

  /// fontSize: 24 | fontWeight: w700 | fontFamily: Cairo
  TextStyle get headlineLarge => TextStyle(
        color: colors?.headingText,
        fontSize: 24.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w700,
      );

  /// fontSize: 20 | fontWeight: w700 | fontFamily: Cairo
  TextStyle get headlineMedium => TextStyle(
        color: colors?.headingText,
        fontSize: 20.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w700,
      );

  /// fontSize: 16 | fontWeight: w700 | fontFamily: Cairo
  TextStyle get headlineSmall => TextStyle(
        color: colors?.headingText,
        fontSize: 16.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w700,
      );

  /// fontSize: 22 | fontWeight: w600 | fontFamily: Cairo
  TextStyle get titleLarge => TextStyle(
        color: colors?.primaryText,
        fontSize: 22.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w600,
        height: 1.64,
      );

  /// fontSize: 16 | fontWeight: w600 | fontFamily: Cairo
  TextStyle get titleMedium => TextStyle(
        color: colors?.primaryText,
        fontSize: 16.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w600,
        height: 1.75,
      );

  /// fontSize: 14 | fontWeight: w600 | fontFamily: Cairo
  TextStyle get titleSmall => TextStyle(
        color: colors?.primaryText,
        fontSize: 14.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w600,
        height: 1.71,
      );

  /// fontSize: 14 | fontWeight: w700 | fontFamily: Cairo
  TextStyle get labelLarge => TextStyle(
        color: colors?.primaryText,
        fontSize: 14.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w700,
      );

  /// fontSize: 12 | fontWeight: w700 | fontFamily: Cairo
  TextStyle get labelMedium => TextStyle(
        color: colors?.primaryText,
        fontSize: 12.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w700,
      );

  /// fontSize: 10 | fontWeight: w700 | fontFamily: Cairo
  TextStyle get labelSmall => TextStyle(
        color: colors?.primaryText,
        fontSize: 10.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w700,
      );

  /// fontSize: 16 | fontWeight: w400 | fontFamily: Cairo
  TextStyle get bodyLarge => TextStyle(
        color: colors?.primaryText,
        fontSize: 16.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w400,
      );

  /// fontSize: 14 | fontWeight: w400 | fontFamily: Cairo
  TextStyle get bodyMedium => TextStyle(
        color: colors?.primaryText,
        fontSize: 14.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w400,
      );

  /// fontSize: 12 | fontWeight: w400 | fontFamily: Cairo
  TextStyle get bodySmall => TextStyle(
        color: colors?.primaryText,
        fontSize: 12.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w400,
      );

  /// fontSize: 12 | fontWeight: w700 | fontFamily: Montserrat
  TextStyle get numbersXSmall => TextStyle(
        color: colors?.primaryText,
        fontSize: 12.sp,
        fontFamily: FontFamily.montserrat,
        fontWeight: FontWeight.bold,
      );

  /// fontSize: 16 | fontWeight: w700 | fontFamily: Montserrat
  TextStyle get numbersSmall => TextStyle(
        color: colors?.primaryText,
        fontSize: 16.sp,
        fontFamily: FontFamily.montserrat,
        fontWeight: FontWeight.bold,
      );

  /// fontSize: 20 | fontWeight: w700 | fontFamily: Montserrat
  TextStyle get numbersMedium => TextStyle(
        color: colors?.primaryText,
        fontSize: 20.sp,
        fontFamily: FontFamily.montserrat,
        fontWeight: FontWeight.bold,
      );

  /// fontSize: 32 | fontWeight: w700 | fontFamily: Montserrat
  TextStyle get numbersSemiLarge => TextStyle(
        color: colors?.primaryText,
        fontSize: 32.sp,
        fontFamily: FontFamily.montserrat,
        fontWeight: FontWeight.bold,
      );

  /// fontSize: 64 | fontWeight: w700 | fontFamily: Montserrat
  TextStyle get numbersLarge => TextStyle(
        color: colors?.primaryText,
        fontSize: 64.sp,
        fontFamily: FontFamily.montserrat,
        fontWeight: FontWeight.bold,
      );

  @override
  TextThemeExtension lerp(covariant TextThemeExtension? other, double t) {
    if (other is! TextThemeExtension) {
      return this;
    }
    return TextThemeExtension(colors: colors?.lerp(other.colors, t));
  }

  @override
  TextThemeExtension copyWith({ColorThemeExtension? colors}) {
    return TextThemeExtension(
      colors: colors ?? this.colors,
    );
  }
}
