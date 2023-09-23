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

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.background,
    this.foreground,
  })  : icon = null,
        iconAlignment = IconAlignment.right;

  const CustomElevatedButton.icon({
    super.key,
    required SvgGenImage this.icon,
    required this.text,
    required this.onPressed,
    this.background,
    this.foreground,
    this.iconAlignment = IconAlignment.right,
  });

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;

    final Widget widget;

    if (icon != null) {
      widget = ElevatedButton.icon(
        icon: icon.call(
          color: foreground ?? context.colors.buttonColorScheme.foreground,
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          foregroundColor: foreground,
        ),
        label: Text(text),
      );
    } else {
      widget = ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          foregroundColor: foreground,
        ),
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
