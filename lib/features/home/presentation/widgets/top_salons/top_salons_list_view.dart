import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/utils/extensions.dart';

class TopSalonsListView extends StatelessWidget {
  const TopSalonsListView({super.key});

  SvgPicture get crownIcon => Assets.solarIcons.boldDuotone.crownStar(
        color: const Color(0xFFfc6400),
        size: const Size.square(32),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              crownIcon,
              Text(
                "أعلى 5 صالونات تقييماً",
                style: context.textTheme.headlineMedium,
              ),
              crownIcon,
            ].withGap(width: 12.0),
          ),
          Placeholder(),
        ].withGap(height: 32.0),
      ),
    );
  }
}
