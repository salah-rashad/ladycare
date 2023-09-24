import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';
import '../home_highlights_cubit/home_highlights_cubit.dart';
import '../home_service_categories_cubit/home_service_categories_cubit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  Future<void> reloadPage() async {
    await Future.wait([
      sl<HomeHighlightsCubit>().fetchHighlights(),
      sl<HomeServiceCategoriesCubit>().fetchServiceCategories(),
    ]);
  }
}
