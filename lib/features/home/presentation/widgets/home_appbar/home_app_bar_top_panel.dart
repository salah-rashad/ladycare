import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/gen/assets.gen.dart';
import '../../../../../../../core/utils/extensions.dart';
import '../../../../../../../injection_container.dart';
import '../../../../../global/blocs/theme_mode_cubit/theme_mode_cubit.dart';
import '../../../../../global/widgets/custom_sliver_persistent_header_delegate.dart';
import '../../../../../global/widgets/red_dot_indicator.dart';
import '../../../../auth/domain/entities/user_data.dart';
import '../../../../auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import '../../bloc/home_cubit/home_cubit.dart';

class HomeAppBarTopPanel extends StatelessWidget {
  final ExtrapolationFactor t;

  const HomeAppBarTopPanel({
    super.key,
    required this.t,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthCubit, AuthState, UserData>(
      bloc: sl<AuthCubit>(),
      selector: (state) {
        if (state is Authenticated) return state.userData;
        return UserData.empty();
      },
      builder: (context, userData) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _profileImage(context, userData),
            _nameText(context, userData),
            _actionButton(context),
          ].withGap(width: 16.0),
        );
      },
    );
  }

  Widget _profileImage(BuildContext context, UserData userData) {
    final homeCubit = context.read<HomeCubit>();
    return SizedBox.square(
      dimension: 45.0,
      child: Material(
        clipBehavior: Clip.hardEdge,
        type: MaterialType.circle,
        color: context.colors.surface,
        elevation: lerpDouble(6, 0, t(0.5)) ?? 0,
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   boxShadow: [
        //     BoxShadow(
        //       blurRadius: 10,
        //       offset: const Offset(0, 4),
        //       color: Color.lerp(Colors.black26, Colors.transparent, t(1.0)) ??
        //           Colors.transparent,
        //     )
        //   ],
        //   borderRadius: const BorderRadius.all(Radius.circular(200)),
        // ),
        child: InkWell(
          onTap: homeCubit.goToSettings,
          child: CachedNetworkImage(
            imageUrl: userData.profilePictureUrl ?? "",
            fit: BoxFit.cover,
            errorWidget: (context, url, error) {
              return Assets.images.userPlaceholder.image(fit: BoxFit.cover);
            },
          ),
        ),
      ),
    );
  }

  Expanded _nameText(BuildContext context, UserData userData) {
    const textShadows = [
      Shadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 5),
      Shadow(color: Colors.black, offset: Offset(-1, -1), blurRadius: 5),
    ];
    final nameTextStyleExpanded = context.textTheme.headlineMedium?.apply(
      shadows: textShadows,
      color: Colors.white,
    );
    final nameTextStyleCollapsed = context.textTheme.headlineMedium;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            heightFactor: 1 - t(0.2),
            child: Opacity(
              opacity: 1 - t(0.2),
              child: Text(
                "أهــلاً",
                style: context.textTheme.labelLarge?.apply(
                  shadows: textShadows,
                  color: const Color(0xFFE2E2E2),
                ),
              ),
            ),
          ),
          Text(
            "${userData.firstName} ${userData.lastName}",
            style: TextStyle.lerp(
                nameTextStyleExpanded, nameTextStyleCollapsed, t(0.5)),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return IconButton.filledTonal(
      onPressed: () {
        final theme = sl<ThemeModeCubit>();
        theme.toggle();
      },
      icon: Stack(
        children: [
          Assets.solarIcons.bold.bell(color: context.colors.primaryText),
          if (homeCubit.state.hasUnreadNotifications) const RedDotIndicator(),
        ],
      ),
      style: IconButton.styleFrom(
        padding: const EdgeInsets.all(4.0),
        backgroundColor: Color.lerp(
          context.colors.surface,
          Colors.transparent,
          t(0.3),
        ),
      ),
    );
  }
}
