import '../../core/utils/extensions.dart';
import 'package:flutter/material.dart';

class RedDotIndicator extends StatelessWidget {
  const RedDotIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      heightFactor: 0,
      widthFactor: 0,
      child: Container(
        width: 12,
        height: 12,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: context.colors.error,
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(
            width: 2,
            color: context.colors.surface,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
        ),
      ),
    );
  }
}
