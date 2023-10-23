import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../injection_container.dart';
import '../bloc/salon_search_cubit/salon_search_cubit.dart';
import '../widgets/salon_card.dart';
import '../widgets/search/search_sliver_app_bar.dart';

class SalonSearchPage extends StatelessWidget {
  const SalonSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = sl<SalonSearchCubit>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SearchSliverAppBar(),
          BlocBuilder<SalonSearchCubit, SalonSearchState>(
            bloc: cubit,
            builder: (context, state) {
              return switch (state.status) {
                SearchStatus.initial => _initialView(context, state),
                SearchStatus.loading => _loadingView(context, state),
                SearchStatus.failed => _failedView(context, state),
                SearchStatus.succeed => _succeedView(context, state),
              };
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: cubit.search,
        label: const Text("بحث"),
        icon: Builder(
          builder: (context) {
            return Assets.solarIcons.boldDuotone.minimalisticMagnifer();
          },
        ),
      ),
    );
  }

  Widget _initialView(BuildContext context, SalonSearchState state) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Text("بحث الصالونات."),
      ),
    );
  }

  Widget _loadingView(BuildContext context, SalonSearchState state) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _failedView(BuildContext context, SalonSearchState state) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Text(state.message),
      ),
    );
  }

  Widget _succeedView(BuildContext context, SalonSearchState state) {
    final salons = state.salons;
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverList.separated(
        itemCount: salons.length,
        itemBuilder: (context, index) {
          return SalonCard(salon: salons[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16.0);
        },
      ),
    );
  }
}
