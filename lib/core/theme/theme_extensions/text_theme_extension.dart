import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/fonts.gen.dart';
import 'color_theme_extension.dart';

class TextThemeExtension extends ThemeExtension<TextThemeExtension> {
  final ColorThemeExtension? colors;
  const TextThemeExtension({this.colors});

  /// fontSize: 57 | fontWeight: w400
  TextStyle? get displayLarge => TextStyle(
        color: colors?.headingText,
        fontSize: 57.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w400,
        height: 1.61,
      );

  /// fontSize: 45 | fontWeight: w400
  TextStyle? get displayMedium => TextStyle(
        color: colors?.headingText,
        fontSize: 45.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w400,
        height: 1.69,
      );

  /// fontSize: 36 | fontWeight: w400
  TextStyle? get displaySmall => TextStyle(
        color: colors?.headingText,
        fontSize: 36.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w400,
        height: 1.67,
      );

  /// fontSize: 24 | fontWeight: w700
  TextStyle? get headlineLarge => TextStyle(
        color: colors?.headingText,
        fontSize: 24.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w700,
      );

  /// fontSize: 20 | fontWeight: w700
  TextStyle? get headlineMedium => TextStyle(
        color: colors?.headingText,
        fontSize: 20.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w700,
      );

  /// fontSize: 16 | fontWeight: w700
  TextStyle? get headlineSmall => TextStyle(
        color: colors?.headingText,
        fontSize: 16.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w700,
      );

  /// fontSize: 22 | fontWeight: w600
  TextStyle? get titleLarge => TextStyle(
        color: colors?.primaryText,
        fontSize: 22.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w600,
        height: 1.64,
      );

  /// fontSize: 16 | fontWeight: w600
  TextStyle? get titleMedium => TextStyle(
        color: colors?.primaryText,
        fontSize: 16.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w600,
        height: 1.75,
      );

  /// fontSize: 14 | fontWeight: w600
  TextStyle? get titleSmall => TextStyle(
        color: colors?.primaryText,
        fontSize: 14.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w600,
        height: 1.71,
      );

  /// fontSize: 14 | fontWeight: w700
  TextStyle? get labelLarge => TextStyle(
        color: colors?.primaryText,
        fontSize: 14.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w700,
      );

  /// fontSize: 12 | fontWeight: w700
  TextStyle? get labelMedium => TextStyle(
        color: colors?.primaryText,
        fontSize: 12.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w700,
      );

  /// fontSize: 10 | fontWeight: w700
  TextStyle? get labelSmall => TextStyle(
        color: colors?.primaryText,
        fontSize: 10.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w700,
      );

  /// fontSize: 16 | fontWeight: w400
  TextStyle? get bodyLarge => TextStyle(
        color: colors?.primaryText,
        fontSize: 16.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w400,
      );

  /// fontSize: 14 | fontWeight: w400
  TextStyle? get bodyMedium => TextStyle(
        color: colors?.primaryText,
        fontSize: 14.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w400,
      );

  /// fontSize: 12 | fontWeight: w400
  TextStyle? get bodySmall => TextStyle(
        color: colors?.primaryText,
        fontSize: 12.sp,
        fontFamily: FontFamily.cairo,
        fontWeight: FontWeight.w400,
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
