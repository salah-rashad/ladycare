import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';

class ImagesThemeExtension extends ThemeExtension<ImagesThemeExtension> {
  final AssetGenImage logo;
  final AssetGenImage logoFull;

  ImagesThemeExtension({
    required this.logo,
    required this.logoFull,
  });

  @override
  ImagesThemeExtension lerp(covariant ImagesThemeExtension? other, double t) {
    if (other is! ImagesThemeExtension) {
      return this;
    }
    return other;
  }

  @override
  ImagesThemeExtension copyWith({
    AssetGenImage? logo,
    AssetGenImage? logoFull,
  }) {
    return ImagesThemeExtension(
      logo: logo ?? this.logo,
      logoFull: logoFull ?? this.logoFull,
    );
  }
}
