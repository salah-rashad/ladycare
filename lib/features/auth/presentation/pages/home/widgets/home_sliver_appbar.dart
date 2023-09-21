import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../../../core/gen/assets.gen.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../../shared/widgets/custom_sliver_persistent_header_delegate.dart';
import '../../../../domain/entities/user_data.dart';
import 'home_app_bar_top_panel.dart';

class HomeSliverAppbar extends StatefulWidget {
  final UserData userData;

  const HomeSliverAppbar({
    super.key,
    required this.userData,
  });

  @override
  State<HomeSliverAppbar> createState() => _HomeSliverAppbarState();
}

class _HomeSliverAppbarState extends State<HomeSliverAppbar>
    with SingleTickerProviderStateMixin {
  final double minExtent = 100.0;
  final double maxExtent = 260.0;

  UserData get userdata => widget.userData;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      pinned: true,
      delegate: CustomSliverPersistentHeaderDelegate.snap(
        vsync: this,
        snapConfiguration: FloatingHeaderSnapConfiguration(),
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
        topPanel: (t) => HomeAppBarTopPanel(
          minExtent: minExtent,
          userData: userdata,
          context: context,
          t: t,
        ),
        bottomPanel: (t) => _bottomPanel(context, t),
        minExtent: minExtent,
        maxExtent: maxExtent,
      ),
    );
  }

  Widget _bottomPanel(BuildContext context, ExtrapolationFactor t) {
    return Container(
      height: 64.0,
      color: Colors.blue,
    );
  }
}
