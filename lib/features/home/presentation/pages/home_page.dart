import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../auth/presentation/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../../../auth/presentation/widgets/bottom_nav_bar/bottom_nav_bar_item.dart';
import '../cubit/home_cubit.dart';
import '../widgets/home_sliver_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: _build(),
    );
  }

  Widget _build() {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HomeSliverAppbar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Item $index'),
              ),
              childCount: 50,
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  // Widget _authErrorView(BuildContext context, AuthError state) {
  //   return Container(
  //     alignment: Alignment.center,
  //     padding: const EdgeInsets.all(32.0),
  //     child: Text(
  //       "خطأ: ${state.message}",
  //       textAlign: TextAlign.center,
  //       style: context.textTheme.bodyLarge,
  //     ),
  //   );
  // }

  // Widget _unauthenticatedView(
  //   BuildContext context,
  // ) {
  //   return const Scaffold(
  //     body: Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  // }

  BottomNavBar _bottomNavBar() {
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
        ),
        BottomNavBarItem(
          label: "المحادثات",
          icon: Assets.solarIcons.boldDuotone.dialog2,
          showRedDot: true,
        ),
        BottomNavBarItem(
          label: "الإعدادات",
          icon: Assets.solarIcons.boldDuotone.settings,
          showRedDot: true,
        ),
      ],
    );
  }
}
