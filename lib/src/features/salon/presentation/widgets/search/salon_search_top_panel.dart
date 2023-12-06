import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/env.dart';
import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../common/widgets/custom_app_bar.dart';
import '../../bloc/salon_search_cubit/salon_search_cubit.dart';
import 'salon_search_filters.dart';

class SalonSearchTopPanel extends StatelessWidget {
  const SalonSearchTopPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = sl<SalonSearchCubit>();
    return BlocBuilder<SalonSearchCubit, SalonSearchState>(
      bloc: cubit,
      builder: (context, state) {
        return CustomAppBar(
          title: "بحث الصالونات",
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () => _openFiltersMenu(context, cubit),
              icon: Assets.solarIcons.lineDuotone.filter(),
              tooltip: "تصفية نتائج البحث",
            ),
            // map view icon button
            IconButton(
              onPressed: () {
                // open map view
              },
              icon: Assets.solarIcons.lineDuotone.map(),
              tooltip: "فتح وضع الخريطة",
            ),
          ],
        );
      },
    );
  }

  void _openFiltersMenu(BuildContext context, SalonSearchCubit cubit) {
    // open a filters bottom sheet to include these filters (services, min salon average rating, workdays)
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      builder: (context) {
        return const SalonSearchFilters();
      },
    );
  }
}
