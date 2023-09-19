import 'package:flutter/material.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/utils/extensions.dart';

class LadyCareLogoFull extends StatelessWidget {
  const LadyCareLogoFull({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;

    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: (isDarkMode
              ? Assets.images.logoFullDark
              : Assets.images.logoFullLight)
          .image(
        fit: BoxFit.contain,
        height: 180,
        width: 180,
      ),
    );
  }
}
