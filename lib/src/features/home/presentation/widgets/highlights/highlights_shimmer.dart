import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions.dart';

class HighlightsShimmer extends StatelessWidget {
  final Size size;
  const HighlightsShimmer({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: FadeShimmer(
        width: size.width,
        height: size.height,
        baseColor: context.colors.shimmerBase,
        highlightColor: context.colors.shimmerHighlight,
        radius: 12.0,
      ),
    );
  }
}
