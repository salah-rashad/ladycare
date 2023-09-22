import 'package:flutter/material.dart';

import '../colors/palette.dart';

class BoxShadowTheme extends ThemeExtension<BoxShadowTheme> {
  final Palette? colors;
  const BoxShadowTheme({this.colors});

  BoxShadow get surfaceShadow => BoxShadow(
        blurRadius: 5,
        offset: const Offset(0, 2),
        color: colors?.accent1.withOpacity(0.25) ?? Palette.black,
      );

  BoxShadow get surfaceShadowLite => BoxShadow(
        blurRadius: 15,
        offset: const Offset(0, 1),
        color: colors?.accent1.withOpacity(0.05) ?? Palette.black,
      );

  @override
  BoxShadowTheme lerp(covariant BoxShadowTheme? other, double t) {
    if (other is! BoxShadowTheme) {
      return this;
    }

    return BoxShadowTheme(colors: colors?.lerp(other.colors, t));
  }

  @override
  BoxShadowTheme copyWith({
    ValueGetter<Palette?>? colors,
  }) {
    return BoxShadowTheme(
      colors: colors != null ? colors() : this.colors,
    );
  }
}
