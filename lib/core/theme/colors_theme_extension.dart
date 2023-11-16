import 'package:flutter/material.dart';

class ColorsThemeExtension extends ThemeExtension<ColorsThemeExtension> {
  final Color color1;
  final Color color2;

  ColorsThemeExtension({required this.color1, required this.color2});

  @override
  ColorsThemeExtension copyWith({Color? color1, Color? color2}) {
    return ColorsThemeExtension(
      color1: color1 ?? this.color1,
      color2: color2 ?? this.color2,
    );
  }

  @override
  ColorsThemeExtension lerp(covariant ColorsThemeExtension? other, double t) {
    if (other is! ColorsThemeExtension) {
      return this;
    }

    return ColorsThemeExtension(
      color1: Color.lerp(color1, other.color1, t) ?? color1,
      color2: Color.lerp(color2, other.color2, t) ?? color2,
    );
  }
}
