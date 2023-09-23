import 'package:flutter/material.dart';

import 'color_theme_extension.dart';

class BoxShadowThemeExtension extends ThemeExtension<BoxShadowThemeExtension> {
  final ColorThemeExtension? colors;
  const BoxShadowThemeExtension({this.colors});

  BoxShadow get surfaceShadow => BoxShadow(
        blurRadius: 5,
        offset: const Offset(0, 2),
        color: colors?.accent1.withOpacity(0.25) ?? ColorThemeExtension.black,
      );

  BoxShadow get surfaceShadowLite => BoxShadow(
        blurRadius: 15,
        offset: const Offset(0, 1),
        color: colors?.accent1.withOpacity(0.05) ?? ColorThemeExtension.black,
      );

  @override
  BoxShadowThemeExtension lerp(
      covariant BoxShadowThemeExtension? other, double t) {
    if (other is! BoxShadowThemeExtension) {
      return this;
    }

    return BoxShadowThemeExtension(colors: colors?.lerp(other.colors, t));
  }

  @override
  BoxShadowThemeExtension copyWith({
    ValueGetter<ColorThemeExtension?>? colors,
  }) {
    return BoxShadowThemeExtension(
      colors: colors != null ? colors() : this.colors,
    );
  }
}
