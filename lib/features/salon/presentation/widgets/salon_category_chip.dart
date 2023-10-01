import 'package:flutter/material.dart';

import '../../../../core/utils/extensions.dart';

class SalonCategoryChip extends StatelessWidget {
  final String label;
  const SalonCategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      decoration: ShapeDecoration(
        // color: context.colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(200),
          side: BorderSide(
            width: 1,
            color: context.colors.outlineVariant,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
      ),
      child: Text(label,
          style: context.textTheme.labelSmall
              ?.apply(color: context.colors.secondaryText)),
    );
  }
}
