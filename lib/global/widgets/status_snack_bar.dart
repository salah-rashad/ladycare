import 'package:flutter/material.dart';

import '../../core/gen/assets.gen.dart';
import '../../core/utils/extensions.dart';

enum SnackBarStatus { success, error, warning, info }

class StatusSnackBar extends SnackBar {
  final BuildContext context;
  final String text;
  final SnackBarStatus status;
  final SvgGenImage? icon;

  const StatusSnackBar(
    this.context, {
    super.key,
    required this.text,
    required this.status,
    this.icon,
    super.elevation,
    super.margin,
    super.padding,
    super.width,
    super.shape,
    super.behavior = SnackBarBehavior.floating,
    super.action,
    super.actionOverflowThreshold,
    super.showCloseIcon,
    super.duration,
    super.animation,
    super.onVisible,
    super.dismissDirection = DismissDirection.down,
    super.clipBehavior = Clip.hardEdge,
  }) : super(content: const SizedBox.shrink());

  Color get tintColor {
    switch (status) {
      case SnackBarStatus.success:
        return context.colors.success;
      case SnackBarStatus.error:
        return context.colors.error;
      case SnackBarStatus.warning:
        return context.colors.primaryText;
      case SnackBarStatus.info:
        return context.colors.info;
    }
  }

  @override
  Color? get closeIconColor => tintColor;

  @override
  Color? get backgroundColor =>
      Color.alphaBlend(tintColor.withOpacity(0.2), context.colors.primaryText);

  @override
  Widget get content {
    final icon = this.icon;
    return DefaultTextStyle.merge(
      style: TextStyle(color: tintColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) icon.call(color: tintColor),
          const SizedBox(width: 16.0),
          Flexible(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
