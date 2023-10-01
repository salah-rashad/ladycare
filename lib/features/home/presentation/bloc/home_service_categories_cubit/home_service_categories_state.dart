part of 'home_service_categories_cubit.dart';

sealed class HomeServiceCategoriesState extends Equatable {
  const HomeServiceCategoriesState();

  @override
  List<Object> get props => [];
}

final class HomeServiceCategoriesInitial extends HomeServiceCategoriesState {}

final class HomeServiceCategoriesLoading extends HomeServiceCategoriesState {}

final class HomeServiceCategoriesSucceed extends HomeServiceCategoriesState {
  final List<ServicesCategory> serviceCategories;
  const HomeServiceCategoriesSucceed({required this.serviceCategories});

  @override
  List<Object> get props => [serviceCategories];

  @override
  String toString() {
    return "$runtimeType([${serviceCategories.length}])";
  }
}

final class HomeServiceCategoriesFailed extends HomeServiceCategoriesState {
  final String message;
  const HomeServiceCategoriesFailed({required this.message});

  @override
  List<Object> get props => [message];
}
