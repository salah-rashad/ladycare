import 'package:flutter/material.dart';

import '../../../core/enums/icon_alignment.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../core/utils/extensions.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? background;
  final Color? foreground;
  final SvgGenImage? icon;
  final IconAlignment iconAlignment;
  final bool wide;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.background,
    this.foreground,
    this.wide = true,
  })  : icon = null,
        iconAlignment = IconAlignment.right;

  const CustomElevatedButton.icon({
    super.key,
    required this.text,
    required SvgGenImage this.icon,
    required this.onPressed,
    this.iconAlignment = IconAlignment.right,
    this.background,
    this.foreground,
    this.wide = true,
  });

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: background,
      foregroundColor: foreground,
      minimumSize: wide ? const Size(double.infinity, 48.0) : null,
    );

    final Widget widget;

    if (icon != null) {
      widget = ElevatedButton.icon(
        icon: icon.call(
          color: foreground ?? context.colors.buttonColorScheme.foreground,
        ),
        onPressed: onPressed,
        style: buttonStyle,
        label: Text(text),
      );
    } else {
      widget = ElevatedButton(
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
