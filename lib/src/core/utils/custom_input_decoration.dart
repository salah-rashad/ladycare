import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../theme/widget_themes/custom_input_decoration_theme.dart';
import 'extensions.dart';

class CustomInputDecoration extends InputDecoration {
  final SvgGenImage? _sufIcon;
  final SvgGenImage? _preIcon;
  final VoidCallback? onSuffixIconPressed;

  const CustomInputDecoration({
    super.icon,
    super.iconColor,
    super.label,
    super.labelText,
    super.labelStyle,
    super.floatingLabelStyle,
    super.helperText,
    super.helperStyle,
    super.helperMaxLines,
    super.hintText,
    super.hintStyle,
    super.hintTextDirection,
    super.hintMaxLines,
    super.error,
    super.errorText,
    super.errorStyle,
    super.errorMaxLines,
    super.floatingLabelBehavior,
    super.floatingLabelAlignment,
    super.isCollapsed = false,
    super.isDense,
    super.contentPadding,
    super.prefixIconConstraints,
    super.prefix,
    super.prefixText,
    super.prefixStyle,
    super.prefixIconColor,
    super.suffix,
    super.suffixText,
    super.suffixStyle,
    super.suffixIconColor,
    super.suffixIconConstraints,
    super.counter,
    super.counterText,
    super.counterStyle,
    super.filled,
    super.fillColor,
    super.focusColor,
    super.hoverColor,
    super.errorBorder,
    super.focusedBorder,
    super.focusedErrorBorder,
    super.disabledBorder,
    super.enabledBorder,
    super.border,
    super.enabled = true,
    super.semanticCounterText,
    super.alignLabelWithHint,
    super.constraints,
    SvgGenImage? prefixIcon,
    SvgGenImage? suffixIcon,
    this.onSuffixIconPressed,
  })  : _preIcon = prefixIcon,
        _sufIcon = suffixIcon;

  @override
  Widget? get prefixIcon {
    if (_preIcon == null) return super.prefixIcon;
    return Container(
      width: 24.0,
      height: 24.0,
      alignment: Alignment.center,
      child: _preIcon?.call(color: prefixIconColor ?? Colors.grey),
    );
  }

  @override
  Widget? get suffixIcon {
    if (_sufIcon == null) return super.suffixIcon;
    return IconButton(
      onPressed: onSuffixIconPressed,
      icon: _sufIcon!.call(color: suffixIconColor ?? Colors.grey),
    );
  }

  InputDecoration applyTint(BuildContext context, {required Color tint}) {
    return applyDefaults(
      CustomInputDecorationTheme(
        colors: context.colors,
        textTheme: context.textTheme,
        tint: tint,
      ),
    );
  }
}
