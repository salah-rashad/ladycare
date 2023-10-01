import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions.dart';

class SalonShimmer extends StatelessWidget {
  final bool comfortable;
  const SalonShimmer({super.key}) : comfortable = false;
  const SalonShimmer.comfortable({super.key}) : comfortable = true;

  @override
  Widget build(BuildContext context) {
    const height = 40.0;
    // final height = comfortable ? 216.h : 120.h;
    return FadeShimmer(
      width: double.infinity,
      height: height,
      baseColor: context.colors.shimmerBase,
      highlightColor: context.colors.shimmerHighlight,
      radius: 20.0,
    );
  }
}
