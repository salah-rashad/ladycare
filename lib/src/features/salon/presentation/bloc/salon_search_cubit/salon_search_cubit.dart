import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_range/time_range.dart';

import '../../../../../core/config/env.dart';
import '../../../../../core/enums/day_of_week.dart';
import '../../../../../core/serialization/time_of_day_converter.dart';
import '../../../../home/presentation/bloc/home_service_categories_cubit/home_service_categories_cubit.dart';
import '../../../data/models/salon.dart';
import '../../../data/models/services_category.dart';
import '../../../domain/usecases/search_salons_usecase.dart';

part 'salon_search_cubit.freezed.dart';
part 'salon_search_state.dart';

class SalonSearchCubit extends Cubit<SalonSearchState> {
  final SearchSalonsUsecase _searchSalonsUsecase;

  final nameController = TextEditingController();
  final locationController = TextEditingController();

  SalonSearchCubit(this._searchSalonsUsecase)
      : super(const SalonSearchState()) {
    _ensureServiceCategoriesAreLoaded();
  }

  _ensureServiceCategoriesAreLoaded() {
    final categories = sl<HomeServiceCategoriesCubit>();
    if (categories.state is HomeServiceCategoriesInitial) {
      categories.fetchServiceCategories();
    }
  }

  Future<void> search() async {
    emit(state.copyWith(status: SearchStatus.loading));

    final String name = nameController.text;
    final String location = locationController.text;

    final params = SalonSearchParams(
      name: name.isEmpty ? null : name,
      location: location.isEmpty ? null : location,
      services: state.filterServices.isEmpty ? null : state.filterServices,
      minRating: state.filterMinRate,
      workDay: state.filterWorkDay,
      workStartTime: state.filterStartTime,
      workEndTime: state.filterEndTime,
    );

    final result = await _searchSalonsUsecase(params);
    final finalState = result.fold(
      (failure) => state.copyWith(
        status: SearchStatus.failed,
        message: failure.message,
      ),
      (salons) => state.copyWith(
        status: SearchStatus.succeed,
        salons: salons,
      ),
    );
    emit(finalState);
  }

  void addServiceFilter(String value) {
    final services = Set.of(state.filterServices);
    services.add(value);
    emit(state.copyWith(filterServices: services));
  }

  void removeServiceFilter(String value) {
    final services = Set.of(state.filterServices);
    services.remove(value);
    emit(state.copyWith(filterServices: services));
  }

  List<ServicesCategory> getServiceCategories() {
    final homeServiceCategoriesState = sl<HomeServiceCategoriesCubit>().state;
    if (homeServiceCategoriesState is HomeServiceCategoriesSucceed) {
      return List.from(homeServiceCategoriesState.serviceCategories);
    }
    return [];
  }

  void onTimeRangeCompleted(TimeRangeResult? range) {
    if (range != null) {
      emit(state.copyWith(
        filterStartTime: range.start,
        filterEndTime: range.end,
      ));
    }
  }

  void updateMinRating(double value) {
    emit(state.copyWith(filterMinRate: value));
  }
}
