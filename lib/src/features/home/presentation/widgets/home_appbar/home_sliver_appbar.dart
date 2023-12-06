import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_sliver_persistent_header_delegate.dart';
import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/utils/extensions.dart';
import 'home_app_bar_bottom_panel.dart';
import 'home_app_bar_top_panel.dart';

class HomeSliverAppbar extends StatelessWidget {
  const HomeSliverAppbar({super.key});

  final double minExtent = 100.0;
  final double maxExtent = 260.0;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: false,
      pinned: true,
      delegate: CustomSliverPersistentHeaderDelegate(
        paddingExpanded: const EdgeInsets.only(
          top: 60,
          bottom: 16.0,
          right: 32.0,
          left: 32.0,
        ),
        paddingCollapsed: EdgeInsets.only(
          top: context.mediaQuery.padding.top,
          right: 32.0,
          left: 32.0,
        ),
        image: Assets.images.homeBannerBackground.provider(),
        topPanel: _topPanel,
        bottomPanel: _bottomPanel,
        minExtent: minExtent,
        maxExtent: maxExtent,
      ),
    );
  }

  Widget _bottomPanel(ExtrapolationFactor t) {
    return HomeAppBarBottomPanel(t: t);
  }

  Widget _topPanel(ExtrapolationFactor t) {
    return SizedBox(
      height: lerpDouble(60, minExtent, t(0.3)),
      child: HomeAppBarTopPanel(t: t),
    );
  }
}
