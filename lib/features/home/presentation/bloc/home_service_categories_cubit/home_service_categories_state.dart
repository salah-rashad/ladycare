part of 'home_service_categories_cubit.dart';

sealed class HomeServiceCategoriesState extends Equatable {
  const HomeServiceCategoriesState();

  @override
  List<Object> get props => [];
}

final class HomeServiceCategoriesInitial extends HomeServiceCategoriesState {}

final class GetServiceCategoriesSucceed extends HomeServiceCategoriesState {
  final List<ServiceCategory> serviceCategories;
  const GetServiceCategoriesSucceed({required this.serviceCategories});

  @override
  List<Object> get props => [serviceCategories];
}

final class GetServiceCategoriesFailed extends HomeServiceCategoriesState {
  final String message;
  const GetServiceCategoriesFailed({required this.message});

  @override
  List<Object> get props => [message];
}
