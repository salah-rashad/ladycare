import 'package:flutter/material.dart';

import '../../../core/enums/icon_alignment.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../core/utils/extensions.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? background;
  final Color? foreground;
  final SvgGenImage? icon;
  final IconAlignment iconAlignment;
  final bool wide;

  const CustomFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.background,
    this.foreground,
    this.wide = true,
  })  : icon = null,
        iconAlignment = IconAlignment.right;

  const CustomFilledButton.icon({
    super.key,
    required SvgGenImage this.icon,
    required this.text,
    required this.onPressed,
    this.background,
    this.foreground,
    this.iconAlignment = IconAlignment.right,
    this.wide = true,
  });

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    final buttonStyle = FilledButton.styleFrom(
      backgroundColor: background,
      foregroundColor: foreground,
      minimumSize: wide ? const Size(double.infinity, 48.0) : null,
    );

    final Widget widget;

    if (icon != null) {
      widget = FilledButton.icon(
        icon: icon.call(
          color: foreground ?? context.colors.buttonColorScheme.foreground,
        ),
        onPressed: onPressed,
        style: buttonStyle,
        label: Text(text),
      );
    } else {
      widget = FilledButton(
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
