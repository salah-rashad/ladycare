import 'package:flutter/material.dart';

import '../../core/gen/assets.gen.dart';
import '../../core/utils/extensions.dart';
import 'buttons/custom_filled_button.dart';

class CustomAlertDialog extends StatelessWidget {
  final LottieGenImage icon;
  final String title;
  final String message;
  final CustomFilledButton button;
  final Color surfaceTintColor;
  final VoidCallback? onButtonPressed;

  const CustomAlertDialog({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    required this.button,
    required this.surfaceTintColor,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: surfaceTintColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon.lottie(repeat: false),
            const SizedBox(height: 32.0),
            Text(
              title,
              style: context.textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Text(
              message,
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
            button,
          ],
        ),
      ),
    );
  }
}
