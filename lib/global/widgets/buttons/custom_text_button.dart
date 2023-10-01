import 'package:flutter/material.dart';

import '../../../core/enums/icon_alignment.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../core/utils/extensions.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? foreground;
  final SvgGenImage? icon;
  final IconAlignment iconAlignment;
  final bool wide;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.foreground,
    this.wide = true,
  })  : icon = null,
        iconAlignment = IconAlignment.right;

  const CustomTextButton.icon({
    super.key,
    required SvgGenImage this.icon,
    required this.text,
    required this.onPressed,
    this.foreground,
    this.iconAlignment = IconAlignment.right,
    this.wide = true,
  });

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    final buttonStyle = TextButton.styleFrom(
      foregroundColor: foreground,
      minimumSize: wide ? const Size(double.infinity, 48.0) : null,
    );

    final Widget widget;

    if (icon != null) {
      widget = TextButton.icon(
        icon: icon.call(
          color: foreground ?? context.colors.buttonColorScheme.background,
        ),
        onPressed: onPressed,
        style: buttonStyle,
        label: Text(text),
      );
    } else {
      widget = TextButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Text(text),
      );
    }

    if (iconAlignment == IconAlignment.left) {
      return widget.flipped();
    } else {
      return widget;
    }
  }
}
