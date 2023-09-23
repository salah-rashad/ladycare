import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/failure_messages.dart';
import '../error/failures.dart';
import '../gen/assets.gen.dart';
import '../theme/theme_extensions/box_shadow_theme_extension.dart';
import '../theme/theme_extensions/color_theme_extension.dart';
import '../theme/theme_extensions/images_theme_extension.dart';
import '../theme/theme_extensions/text_theme_extension.dart';

extension BuildContextExt on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);
  bool get isDarkMode => theme.brightness == Brightness.dark;
  // ColorScheme get colorScheme => Theme.of(this).colorScheme;
  
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(
          SnackBar snackBar) =>
      ScaffoldMessenger.of(this).showSnackBar(snackBar);

  // ~ Theme Extensions ~ //
  ColorThemeExtension get colors => theme.extension<ColorThemeExtension>()!;
  TextThemeExtension get textTheme => theme.extension<TextThemeExtension>()!;
  BoxShadowThemeExtension get boxShadowTheme =>
      theme.extension<BoxShadowThemeExtension>()!;
  ImagesThemeExtension get images => theme.extension<ImagesThemeExtension>()!;
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

extension FailureExt on Failure {
  String get message => FailureMessages.from(this);
}
