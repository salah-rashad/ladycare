import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../salon/domain/entities/salon_group.dart';
import '../../../../../global/widgets/errors_list.dart';
import '../../../../../injection_container.dart';
import '../../../../salon/presentation/widgets/salon_card.dart';
import '../../../../salon/presentation/widgets/salon_shimmer.dart';
import '../../bloc/top_salons_cubit/top_salons_cubit.dart';

class TopSalonsListView extends StatelessWidget {
  const TopSalonsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<TopSalonsCubit>(),
      child: _build(context),
    );
  }

  _build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          _headerWidget(context),
          _salonsListBuilder(context),
        ].withGap(height: 32.0),
      ),
    );
  }

  Widget _headerWidget(BuildContext context) {
    final crownIcon = Assets.solarIcons.boldDuotone.crownStar(
      color: const Color(0xFFfc6400),
      size: const Size.square(32),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        crownIcon,
        Text(
          "أعلى 5 صالونات تقييماً",
          style: context.textTheme.headlineMedium,
        ),
        crownIcon,
      ].withGap(width: 12.0),
    );
  }

  Widget _salonsListBuilder(BuildContext context) {
    return BlocBuilder<TopSalonsCubit, TopSalonsState>(
      builder: (context, state) {
        switch (state) {
          case TopSalonsInitial():
          case TopSalonsLoading():
            return _salonsListView(context, null);
          case TopSalonsSucceed():
            return _salonsListView(context, state.salons);
          case TopSalonsFailed():
            return ErrorsList(messages: [state.message]);
        }
      },
    );
  }

  Widget _salonsListView(BuildContext context, List<SalonGroup>? salons) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: salons != null ? salons.length : 5,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        if (salons != null) {
          final item = salons[index];
          return SalonCard(salonGroup: item);
        } else {
          return const SalonShimmer();
        }
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16.0);
      },
    );
  }
}
