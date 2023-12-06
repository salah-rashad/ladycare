import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions.dart';

class ServiceCategoryShimmer extends StatelessWidget {
  const ServiceCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 60,
          height: 75,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: AspectRatio(
              aspectRatio: 1,
              child: FadeShimmer.round(
                size: 200,
                baseColor: context.colors.shimmerBase,
                highlightColor: context.colors.shimmerHighlight,
              ),
            ),
          ),
        ),
        FadeShimmer(
          width: 60,
          height: 8,
          baseColor: context.colors.shimmerBase,
          highlightColor: context.colors.shimmerHighlight,
          radius: 30,
        ),
        FadeShimmer(
          width: 60,
          height: 8,
          baseColor: context.colors.shimmerBase,
          highlightColor: context.colors.shimmerHighlight,
          radius: 30,
        ),
      ].withGap(height: 12.0),
    );
  }
}
