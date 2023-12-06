import 'package:flutter/material.dart';
import '../gen/assets.gen.dart';
import 'theme_extensions/app_theme_extensions.dart';
import 'theme_extensions/color_theme_extension.dart';
import 'theme_extensions/images_theme_extension.dart';

class LightAppThemeExtensions extends AppThemeExtensions {
  @override
  ColorThemeExtension get colors => const ColorThemeExtension(
        brightness: Brightness.light,
        primary: Color(0xFFF0748D),
        secondary: Color(0xFFCF5463),
        tertiary: Color(0xFFF59EB0),
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
        container: Color(0xFFFFFFFF),
        outline: Color(0xFFEDC7CE),
        outlineVariant: Color(0xFFE6E6E6),
        success: Color(0xFF2FD55D),
        error: Color(0xFFCD4949),
        info: Color(0xFF697F9E),
      );

  @override
  ImagesThemeExtension get images => ImagesThemeExtension(
        logo: Assets.images.logoTpLight,
        logoFull: Assets.images.logoFullLight,
      );
}
