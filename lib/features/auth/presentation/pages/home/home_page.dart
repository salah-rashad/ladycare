import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/user_data.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../../widgets/bottom_nav_bar/bottom_nav_bar_item.dart';
import 'cubit/home_cubit.dart';
import 'widgets/app_bar/home_sliver_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: sl<AuthBloc>()),
        BlocProvider(create: (_) => HomeCubit()),
      ],
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            context.replaceNamed(Routes.LOGIN.name);
          }
        },
        builder: (context, state) {
          switch (state) {
            case Authenticated():
              return _buildAuthenticated(context, state.userData);
            case AuthError():
              return _buildAuthError(state);
            default:
              return _buildUnauthenticated();
          }
        },
      ),
    );
  }

  Widget _buildUnauthenticated() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildAuthError(AuthError state) {
    return Scaffold(
      body: Center(
        child: Text("Error: ${state.message}"),
      ),
    );
  }

  Widget _buildAuthenticated(BuildContext context, UserData userData) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HomeSliverAppbar(userData: userData),
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
