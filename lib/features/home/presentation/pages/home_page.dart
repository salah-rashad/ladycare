import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/utils/extensions.dart';
import '../../../auth/presentation/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../../../auth/presentation/widgets/bottom_nav_bar/bottom_nav_bar_item.dart';
import '../bloc/home_cubit/home_cubit.dart';
import '../widgets/highlights/home_highlights_carousal_slider.dart';
import '../widgets/home_appbar/home_sliver_appbar.dart';
import '../widgets/service_categories/home_service_categories_grid.dart';
import '../widgets/top_salons/top_salons_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: _build(context),
    );
  }

  Widget _build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () {
              return context.read<HomeCubit>().reloadPage();
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
          ),
          bottomNavigationBar: _bottomNavBar(),
        );
      },
    );
  }

  Widget _bottomNavBar() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BottomNavBar(
          items: [
            BottomNavBarItem(
              label: "الرئيسية",
              icon: Assets.solarIcons.boldDuotone.home2,
            ),
            BottomNavBarItem(
              label: "بحث",
              icon: Assets.solarIcons.boldDuotone.magnifer,
            ),
            BottomNavBarItem(
                label: "الحجوزات",
                icon: Assets.solarIcons.boldDuotone.calendarMark,
                showRedDot: state.hasUnreadAppointments),
            BottomNavBarItem(
              label: "المحادثات",
              icon: Assets.solarIcons.boldDuotone.dialog2,
              showRedDot: state.hasUnreadInboxItems,
            ),
            BottomNavBarItem(
              label: "الإعدادات",
              icon: Assets.solarIcons.boldDuotone.settings,
            ),
          ],
        );
      },
    );
  }
}
