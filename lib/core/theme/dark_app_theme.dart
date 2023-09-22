import 'package:flutter/material.dart';

import 'app_theme_extensions.dart';
import 'colors/palette.dart';

class DarkAppThemeExtensions extends AppThemeExtensions {
  @override
  Palette get palette => const Palette(
        brightness: Brightness.dark,
        // primary: Color(0xFFD44165),
        // primaryDarker: Color(0xFFB81F3C),
        // primaryLighter: Color(0xFFE46B83),
        primary: Color(0xFFF0748D),
        primaryDarker: Color(0xFFCF5463),
        primaryLighter: Color(0xFFF59EB0),
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
}
