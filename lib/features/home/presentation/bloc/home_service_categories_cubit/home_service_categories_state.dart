part of 'home_service_categories_cubit.dart';

sealed class HomeServiceCategoriesState extends Equatable {
  const HomeServiceCategoriesState();

  @override
  List<Object> get props => [];
}

final class HomeServiceCategoriesInitial extends HomeServiceCategoriesState {}
final class HomeServiceCategoriesLoading extends HomeServiceCategoriesState {}

final class HomeServiceCategoriesLoaded extends HomeServiceCategoriesState {
  final List<ServiceCategory> serviceCategories;
  const HomeServiceCategoriesLoaded({required this.serviceCategories});

  @override
  List<Object> get props => [serviceCategories];
}

final class HomeServiceCategoriesError extends HomeServiceCategoriesState {
  final String message;
  const HomeServiceCategoriesError({required this.message});

  @override
  List<Object> get props => [message];
}
