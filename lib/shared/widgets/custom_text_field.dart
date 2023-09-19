import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/gen/assets.gen.dart';
import '../../core/utils/extensions.dart';

class CustomTextField extends StatelessWidget {
  final VoidCallback? onTap;
  final String? initialValue;
  final TextEditingController? controller;
  final InputDecoration decoration;
  final String? labelText;
  final Widget? prefix;
  final Widget? suffix;
  final SvgGenImage? prefixIcon;
  final SvgGenImage? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final VoidCallback? onSuffixIconPressed;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;
  final bool obsecureText;
  final FormFieldValidator<String>? validator;
  final bool autoCorrect;
  final void Function(String value)? onChanged;
  final VoidCallback? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;

  const CustomTextField({
    super.key,
    this.onTap,
    this.initialValue,
    this.controller,
    InputDecoration? decoration,
    this.labelText,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    this.textDirection,
    this.autofillHints,
    this.keyboardType,
    this.textInputAction,
    this.obsecureText = false,
    this.validator,
    this.autoCorrect = true,
    this.onChanged,
    this.onEditingComplete,
    this.onSuffixIconPressed,
    this.inputFormatters,
    this.enabled,
  }) : decoration = decoration ?? const InputDecoration();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextFormField(
        enabled: enabled ?? true,
        initialValue: initialValue,
        controller: controller,
        textDirection: textDirection,
        autofillHints: autofillHints,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obsecureText,
        style: context.textTheme.titleSmall,
        validator: validator,
        autocorrect: autoCorrect,
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatters,
        onEditingComplete: onEditingComplete,
        decoration: decoration.copyWith(
          labelText: labelText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          prefix: prefix,
          suffix: suffix,
          prefixIcon: _prefixIcon(),
          suffixIcon: _suffixIcon(),
        ),
      ),
    );
  }

  Widget? _prefixIcon() {
    return prefixIcon != null
        ? Container(
            width: 24.0,
            height: 24.0,
            alignment: Alignment.center,
            child: prefixIcon?.call(
                prefixIconColor ?? decoration.prefixIconColor ?? Colors.grey),
          )
        : null;
  }

  Widget? _suffixIcon() {
    return suffixIcon != null
        ? InkWell(
            onTap: onSuffixIconPressed,
            child: Container(
              width: 24.0,
              height: 24.0,
              alignment: Alignment.center,
              child: suffixIcon?.call(
                  suffixIconColor ?? decoration.suffixIconColor ?? Colors.grey),
            ),
          )
        : null;
  }
}
