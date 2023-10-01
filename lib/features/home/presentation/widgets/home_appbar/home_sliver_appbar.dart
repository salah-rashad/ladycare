import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../../../../core/gen/assets.gen.dart';
import '../../../../../../../core/utils/extensions.dart';
import '../../../../../global/widgets/custom_sliver_persistent_header_delegate.dart';
import 'home_app_bar_bottom_panel.dart';
import 'home_app_bar_top_panel.dart';

class HomeSliverAppbar extends StatefulWidget {
  const HomeSliverAppbar({super.key});

  @override
  State<HomeSliverAppbar> createState() => _HomeSliverAppbarState();
}

class _HomeSliverAppbarState extends State<HomeSliverAppbar>
    with SingleTickerProviderStateMixin {
  final double minExtent = 100.0;
  final double maxExtent = 260.0;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: false,
      pinned: true,
      delegate: CustomSliverPersistentHeaderDelegate.snap(
        vsync: this,
        snapConfiguration: FloatingHeaderSnapConfiguration(
          curve: Curves.easeInOutCubic,
        ),
        paddingExpanded: const EdgeInsets.only(
          top: 60,
          bottom: 16.0,
          left: 32.0,
          right: 32.0,
        ),
        paddingCollapsed: EdgeInsets.only(
          right: 32.0,
          left: 32.0,
          top: context.mediaQuery.padding.top,
        ),
        // background: _backgroundImage(),
        background: Assets.images.homeBannerBackground.provider(),
        topPanel: (t) {
          return SizedBox(
            height: lerpDouble(60, minExtent, t(0.3)),
            child: HomeAppBarTopPanel(t: t),
          );
        },
        bottomPanel: (t) {
          return HomeAppBarBottomPanel(t: t);
        },
        minExtent: minExtent,
        maxExtent: maxExtent,
      ),
    );
  }
}
