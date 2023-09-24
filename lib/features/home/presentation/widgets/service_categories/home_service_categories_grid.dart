import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../domain/entities/service_category.dart';
import '../../bloc/home_service_categories_cubit/home_service_categories_cubit.dart';

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
            return const Center(
              child: CircularProgressIndicator(),
            );
          case GetServiceCategoriesSucceed():
            final serviceCategories = state.serviceCategories;
            return _succeedView(context, serviceCategories);
          case GetServiceCategoriesFailed():
            return Center(
              child: Text(state.message),
            );
        }
      },
    );
  }

  Widget _succeedView(
      BuildContext context, List<ServiceCategory> serviceCategories) {


        //TODO: Stopped here


    return const Placeholder();
  }
}
