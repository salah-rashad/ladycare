import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../salon/data/models/services_category.dart';
import '../../../domain/usecases/get_tpl_service_categories_usecase.dart';

part 'home_service_categories_state.dart';

class HomeServiceCategoriesCubit extends Cubit<HomeServiceCategoriesState> {
  final GetTplServiceCategoriesUsecase _getServiceCategoriesUsecase;
  HomeServiceCategoriesCubit(this._getServiceCategoriesUsecase)
      : super(HomeServiceCategoriesInitial());

  Future<void> fetchServiceCategories() async {
    emit(HomeServiceCategoriesLoading());
    final result = await _getServiceCategoriesUsecase();
    final state = result.fold(
      (failure) => HomeServiceCategoriesFailed(message: failure.message),
      (data) => HomeServiceCategoriesSucceed(serviceCategories: data),
    );
    emit(state);
  }
}
