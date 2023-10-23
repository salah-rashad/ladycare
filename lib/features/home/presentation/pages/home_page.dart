import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../injection_container.dart';
import '../../../salon/presentation/pages/salons_search_page.dart';
import '../../../settings/presentation/pages/settings_page.dart';
import '../bloc/home_cubit/home_cubit.dart';
import '../widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../widgets/bottom_nav_bar/bottom_nav_bar_item.dart';
import 'views/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = sl<HomeCubit>();
    return BlocProvider.value(
      value: homeCubit,
      child: _build(context, homeCubit),
    );
  }

  Widget _build(BuildContext context, HomeCubit homeCubit) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: homeCubit,
      builder: (context, state) {
        return Scaffold(
          body: PageView(
            controller: homeCubit.pageController,
            onPageChanged: homeCubit.onPageChanged,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomeView(),
              SalonSearchPage(),
              Placeholder(),
              Placeholder(),
              SettingsPage(),
            ],
          ),
          bottomNavigationBar: _bottomNavBar(context, homeCubit),
        );
      },
    );
  }

  Widget _bottomNavBar(BuildContext context, HomeCubit homeCubit) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: homeCubit,
      builder: (context, state) {
        return BottomNavBar(
          selectedIndex: state.selectedIndex,
          onItemPressed: homeCubit.setSelected,
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
