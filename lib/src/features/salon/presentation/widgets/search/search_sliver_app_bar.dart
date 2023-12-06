import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../../core/utils/extensions.dart';
import '../../../../../common/widgets/custom_sliver_persistent_header_delegate.dart';
import 'salon_search_bottom_panel.dart';
import 'salon_search_top_panel.dart';

class SearchSliverAppBar extends StatefulWidget {
  const SearchSliverAppBar({super.key});

  @override
  State<SearchSliverAppBar> createState() => _SearchSliverAppBarState();
}

class _SearchSliverAppBarState extends State<SearchSliverAppBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      pinned: true,
      delegate: CustomSliverPersistentHeaderDelegate.snap(
        topPanel: (t) => const SalonSearchTopPanel(),
        bottomPanel: (t) => const SalonSearchBottomPanel(),
        background: context.colors.surface,
        paddingExpanded: EdgeInsets.zero,
        paddingCollapsed: EdgeInsets.zero,
        minExtent: 24 + kToolbarHeight + 8.0,
        maxExtent: 220.0,
        vsync: this,
        snapConfiguration: FloatingHeaderSnapConfiguration(),
      ),
    );
  }
}
