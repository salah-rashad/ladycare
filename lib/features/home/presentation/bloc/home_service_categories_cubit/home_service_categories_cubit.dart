import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/extensions.dart';
import '../../../domain/entities/service_category.dart';
import '../../../domain/usecases/get_service_categories_usecase.dart';

part 'home_service_categories_state.dart';

class HomeServiceCategoriesCubit extends Cubit<HomeServiceCategoriesState> {
  final GetServiceCategoriesUsecase _getServiceCategoriesUsecase;
  HomeServiceCategoriesCubit(this._getServiceCategoriesUsecase)
      : super(HomeServiceCategoriesInitial()) {
    fetchServiceCategories();
  }

  Future<void> fetchServiceCategories() async {
    emit(HomeServiceCategoriesLoading());
    final result = await _getServiceCategoriesUsecase();
    final state = result.fold(
      (failure) => HomeServiceCategoriesError(message: failure.message),
      (data) => HomeServiceCategoriesLoaded(serviceCategories: data),
    );
    emit(state);
  }
}
