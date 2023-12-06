import 'package:flutter/material.dart';

import '../../core/gen/assets.gen.dart';
import '../../core/utils/extensions.dart';

class CustomPopupMenuItem<T> extends PopupMenuItem<T> {
  final String label;
  final bool? selected;
  final SvgGenImage? icon;

  const CustomPopupMenuItem({
    super.key,
    required this.label,
    required super.value,
    this.selected,
    this.icon,
    super.enabled,
    super.height = 42,
    super.onTap,
    super.mouseCursor,
    super.textStyle,
  }) : super(child: const SizedBox.shrink());

  @override
  EdgeInsets? get padding => EdgeInsets.zero;

  @override
  Widget? get child => Builder(builder: (context) {
        return IgnorePointer(
          child: ListTile(
            dense: true,
            enabled: enabled,
            selected: selected ?? false,
            selectedTileColor: context.colors.accent2.withOpacity(0.1),
            selectedColor: context.colors.accent2,
            visualDensity: VisualDensity.compact,
            title: Text(label),
            titleTextStyle: textStyle ?? context.theme.popupMenuTheme.textStyle,
            leading: icon?.call(
                color: context.theme.popupMenuTheme.textStyle?.color),
          ),
        );
      });
}

class CustomDropdownMenuItem<T> extends DropdownMenuItem<T> {
  final String label;
  final bool? selected;
  final SvgGenImage? icon;
  final Widget? leading;

  const CustomDropdownMenuItem({
    super.key,
    required this.label,
    required super.value,
    this.selected,
    this.leading,
    super.enabled,
    super.onTap,
  })  : icon = null,
        super(child: const SizedBox.shrink());

  const CustomDropdownMenuItem.icon({
    super.key,
    required this.label,
    required super.value,
    this.selected,
    this.icon,
    super.enabled,
    super.onTap,
  })  : leading = null,
        super(child: const SizedBox.shrink());

  @override
  Widget get child => Builder(builder: (context) {
        return IgnorePointer(
          child: ListTile(
            dense: true,
            enabled: enabled,
            selected: selected ?? false,
            selectedTileColor: context.colors.accent2.withOpacity(0.1),
            selectedColor: context.colors.accent2,
            visualDensity: VisualDensity.compact,
            title: Text(label),
            titleTextStyle: context.theme.popupMenuTheme.textStyle,
            leading: leading ??
                icon?.call(
                    color: context.theme.popupMenuTheme.textStyle?.color),
          ),
        );
      });
}
