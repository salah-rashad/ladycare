import 'package:flutter/material.dart';

import '../theme_extensions/color_theme_extension.dart';
import '../theme_extensions/text_theme_extension.dart';
import 'custom_input_decoration_theme.dart';

MenuThemeData menuTheme(
    ColorThemeExtension colors, TextThemeExtension textTheme) {
  return MenuThemeData(
    style: MenuStyle(
      backgroundColor: MaterialStatePropertyAll(colors.background),
      surfaceTintColor: MaterialStatePropertyAll(colors.background),
      alignment: Alignment.bottomCenter,
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
    ),
  );
}

PopupMenuThemeData popupMenuTheme(
    ColorThemeExtension colors, TextThemeExtension textTheme) {
  return PopupMenuThemeData(
    color: colors.background,
    surfaceTintColor: colors.background,
    position: PopupMenuPosition.under,
    textStyle: textTheme.labelLarge.apply(color: colors.headingText),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  );
}

DropdownMenuThemeData dropDownMenuTheme(
    ColorThemeExtension colors, TextThemeExtension textTheme) {
  return DropdownMenuThemeData(
    inputDecorationTheme:
        CustomInputDecorationTheme(colors: colors, textTheme: textTheme),
    textStyle: textTheme.labelLarge.apply(color: colors.headingText),
    menuStyle: menuTheme(colors, textTheme).style,
  );
}
