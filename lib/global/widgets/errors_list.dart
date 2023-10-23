import 'package:flutter/material.dart';

import '../../core/gen/assets.gen.dart';
import '../../core/utils/extensions.dart';

class ErrorsList extends StatelessWidget {
  final List<String> messages;
  final double gap;
  const ErrorsList({
    Key? key,
    required this.messages,
    this.gap = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.colors.error.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: List<Widget>.generate(
          messages.length,
          (index) {
            return ErrorMessageTile(message: messages[index]);
          },
        ).withGap(height: gap),
      ),
    );
  }
}

class ErrorMessageTile extends StatelessWidget {
  final String message;
  const ErrorMessageTile({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Assets.solarIcons.boldDuotone.dangerCircle(color: context.colors.error),
        const SizedBox(width: 16.0),
        Flexible(
          child: Text(
            message,
            style:
                context.textTheme.bodyMedium.apply(color: context.colors.error),
          ),
        ),
      ],
    );
  }
}
