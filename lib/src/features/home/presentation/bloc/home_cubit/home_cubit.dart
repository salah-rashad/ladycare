import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/config/env.dart';
import '../home_highlights_cubit/home_highlights_cubit.dart';
import '../home_service_categories_cubit/home_service_categories_cubit.dart';
import '../top_salons_cubit/top_salons_cubit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()) {
    fetchAllData();
  }

  final pageController = PageController(keepPage: false);

  Future<void> fetchAllData() async {
    await Future.wait(
      [
        sl<HomeHighlightsCubit>().fetchHighlights(),
        sl<HomeServiceCategoriesCubit>().fetchServiceCategories(),
        sl<TopSalonsCubit>().fetchTopSalons(),
      ],
    );
  }

  int get selectedIndex => state.selectedIndex;

  void onPageChanged(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void setSelected(int index) {
    pageController.jumpToPage(index);
  }

  void goToHome() => setSelected(0);
  void goToSearch() => setSelected(1);
  void goToAppointments() => setSelected(2);
  void goToInbox() => setSelected(3);
  void goToSettings() => setSelected(4);

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
