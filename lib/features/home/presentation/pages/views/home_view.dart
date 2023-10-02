import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/extensions.dart';
import '../../bloc/home_cubit/home_cubit.dart';
import '../../widgets/highlights/home_highlights_carousal_slider.dart';
import '../../widgets/home_appbar/home_sliver_appbar.dart';
import '../../widgets/service_categories/home_service_categories_grid.dart';
import '../../widgets/top_salons/top_salons_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var home = context.read<HomeCubit>();

    return RefreshIndicator(
      onRefresh: () {
        return home.fetchAllData();
      },
      child: CustomScrollView(
        slivers: [
          const HomeSliverAppbar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            sliver: SliverList.list(
              children: const [
                HomeHighlightsCarousalSlider(),
                HomeServiceCategoriesGrid(),
                TopSalonsListView(),
              ].withGap(height: 32.0),
            ),
          ),
        ],
      ),
    );
  }
}
