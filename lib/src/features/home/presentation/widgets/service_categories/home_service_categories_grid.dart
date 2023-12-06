import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/widgets/errors_list.dart';
import '../../../../../core/config/env.dart';
import '../../../../salon/data/models/services_category.dart';
import '../../bloc/home_service_categories_cubit/home_service_categories_cubit.dart';
import 'service_category_button.dart';
import 'service_category_shimmer.dart';

class HomeServiceCategoriesGrid extends StatelessWidget {
  const HomeServiceCategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<HomeServiceCategoriesCubit>(),
      child: _build(context),
    );
  }

  Widget _build(BuildContext context) {
    return BlocBuilder<HomeServiceCategoriesCubit, HomeServiceCategoriesState>(
      builder: (context, state) {
        switch (state) {
          case HomeServiceCategoriesInitial():
          case HomeServiceCategoriesLoading():
            return _gridView(context, null);
          case HomeServiceCategoriesSucceed():
            final serviceCategories = state.serviceCategories;
            return _gridView(context, serviceCategories);
          case HomeServiceCategoriesFailed():
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ErrorsList(messages: [state.message]),
            );
        }
      },
    );
  }

  Widget _gridView(
      BuildContext context, List<ServicesCategory>? serviceCategories) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: serviceCategories?.length ?? 8,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 80,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 16.0,
        // mainAxisExtent: 120,
        childAspectRatio: 3 / 5,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      itemBuilder: (context, index) {
        if (serviceCategories != null) {
          final item = serviceCategories[index];
          return ServiceCategoryButton(serviceCategory: item);
        } else {
          return const ServiceCategoryShimmer();
        }
      },
    );
  }
}
