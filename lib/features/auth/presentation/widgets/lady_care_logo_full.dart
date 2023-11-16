import 'package:flutter/material.dart';

import '../../../../core/utils/extensions.dart';

class LadyCareLogoFull extends StatelessWidget {
  const LadyCareLogoFull({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: context.images.logoFull.image(
        fit: BoxFit.contain,
        height: 180,
        width: 180,
      ),
    );
  }
}
