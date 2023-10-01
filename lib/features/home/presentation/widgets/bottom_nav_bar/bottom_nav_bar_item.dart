import 'package:flutter/material.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../global/widgets/red_dot_indicator.dart';

class BottomNavBarItem {
  final VoidCallback? onTap;
  final String label;
  final SvgGenImage icon;
  final Color? iconColor;
  final Color? labelColor;
  final bool showRedDot;

  const BottomNavBarItem({
    this.onTap,
    required this.label,
    required this.icon,
    this.iconColor,
    this.labelColor,
    this.showRedDot = false,
  });
}

class BottonNavBarItemWidget extends StatelessWidget {
  const BottonNavBarItemWidget({
    super.key,
    required this.item,
    required this.isSelected,
    required this.iconSelectedColor,
    required this.iconUnselectedColor,
    required this.onPressed,
  });

  final BottomNavBarItem item;
  final bool isSelected;
  final Color? iconSelectedColor;
  final Color? iconUnselectedColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {
          onPressed?.call();
          item.onTap?.call();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox.square(
                dimension: 45.0,
                child: Stack(
                  children: [
                    Center(
                      child: item.icon.call(
                        color: isSelected
                            ? iconSelectedColor ?? context.colors.secondary
                            : iconUnselectedColor ??
                                context.colors.tertiaryText,
                        size: const Size.square(32.0),
                      ),
                    ),
                    if (item.showRedDot) const RedDotIndicator()
                  ],
                ),
              ),
              Text(
                item.label,
                style: context.textTheme.labelMedium?.apply(
                  color: isSelected
                      ? iconSelectedColor ?? context.colors.primaryText
                      : iconUnselectedColor ?? context.colors.tertiaryText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
