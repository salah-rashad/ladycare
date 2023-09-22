import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../gen/assets.gen.dart';
import '../theme/colors/palette.dart';
import '../theme/shadow_themes/box_shadow_theme.dart';
import '../theme/text_theme/app_text_theme.dart';

extension BuildContextExt on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);
  bool get isDarkMode => theme.brightness == Brightness.dark;
  // ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Palette get palette => theme.extension<Palette>()!;
  AppTextTheme get textTheme => theme.extension<AppTextTheme>()!;
  BoxShadowTheme get boxShadowTheme => theme.extension<BoxShadowTheme>()!;
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(
          SnackBar snackBar) =>
      ScaffoldMessenger.of(this).showSnackBar(snackBar);
}

extension IterableExt on Iterable<Widget> {
  Iterable<Widget> separate({required Widget separator}) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield separator;
        yield iterator.current;
      }
    }
  }

  List<Widget> withGap({double? width, double? height}) {
    return separate(
      separator: SizedBox(
        width: width,
        height: height,
      ),
    ).toList();
  }
}

extension WidgetExt on Widget {
  Widget flipped() {
    return Builder(
      builder: (context) {
        final currentDirectionality = Directionality.of(context);
        final isLTR = currentDirectionality == TextDirection.ltr;
        final textDirection = isLTR ? TextDirection.rtl : TextDirection.ltr;

        return Directionality(
          textDirection: textDirection,
          child: this,
        );
      },
    );
  }
}

extension SvgGenImageExt on SvgGenImage {
  SvgPicture call({Color? color, Size? size}) {
    return this.svg(
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      width: size?.width ?? 24.0,
      height: size?.height ?? 24.0,
    );
  }
}
