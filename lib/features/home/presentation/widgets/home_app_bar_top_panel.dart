import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/gen/assets.gen.dart';
import '../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../core/utils/extensions.dart';
import '../../../../../../../injection_container.dart';
import '../../../../global/widgets/custom_sliver_persistent_header_delegate.dart';
import '../../../auth/domain/entities/user_data.dart';
import '../../../auth/presentation/pages/auth/auth_cubit/auth_cubit.dart';

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
            _profileImage(userData),
            _nameText(context, userData),
            _actionButton(context),
          ].withGap(width: 16.0),
        );
      },
    );
  }

  Widget _profileImage(UserData userData) {
    return SizedBox.square(
      dimension: 45.0,
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(0, 4),
              color: Color.lerp(Colors.transparent, Colors.black26, t(1.0)) ??
                  Colors.transparent,
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(200)),
        ),
        child: CachedNetworkImage(
          imageUrl: userData.profilePictureUrl ?? "",
          errorWidget: (context, url, error) {
            return Assets.images.userPlaceholder.image();
          },
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
            heightFactor: t(0.3),
            child: Opacity(
              opacity: t(0.3),
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
                nameTextStyleCollapsed, nameTextStyleExpanded, t(0.5)),
          ),
        ],
      ),
    );
  }

  IconButton _actionButton(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: () {
        final theme = sl<AppTheme>();
        theme.toggle(context);
      },
      icon: Assets.solarIcons.bold.bell(color: context.colors.primaryText),
      style: IconButton.styleFrom(
          backgroundColor:
              Color.lerp(Colors.transparent, context.colors.surface, t(0.3))),
    );
  }
}
